{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE ViewPatterns #-}
{-# OPTIONS_GHC -Wall #-}

module Updater.Main where

import Config
import Control.Monad (unless, void, when, (<=<))
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as LBS
import qualified Data.Map.Strict as Map
import Data.Maybe (catMaybes, fromJust)
import Data.Text (Text)
import qualified Data.Text as T
import Data.Text.Encoding (decodeUtf8, encodeUtf8)
import qualified Data.Text.IO as T
import qualified Data.Text.Lazy.IO as LT
import NeatInterpolation (trimming)
import System.Directory (doesFileExist)
import System.Environment (lookupEnv)
import System.Exit (exitSuccess)
import System.FilePath ((</>))
import System.Process (readCreateProcessWithExitCode, shell)
import Text.Pretty.Simple
import Updater.Lib

-----------------------------------------------------------------------------

nvcheckerConfig :: FilePath
nvcheckerConfig = "Updater/nvchecker.toml"

sha256Data :: FilePath
sha256Data = "sums.json"

newVerData :: FilePath
newVerData = "new_ver.json"

oldVerData :: FilePath
oldVerData = "old_ver.json"

-----------------------------------------------------------------------------

-- nvchecker

generateNvcheckerConfig :: [(SourceName, NvcheckerSource)] -> IO ()
generateNvcheckerConfig entries = T.writeFile nvcheckerConfig file
  where
    o = T.pack oldVerData
    n = T.pack newVerData
    file =
      [trimming|
        # This file was generated by Updater, please do not modify it manually.
        [__config__]
        oldver = "$o"
        newver = "$n"

        $body
      |]
    body = T.unlines [toNvEntry srcName srcNv <> "\n" | (srcName, srcNv) <- entries]

data NvcheckerResult = NvcheckerResult
  { nvName :: SourceName,
    isUpToDate :: Bool
  }
  deriving (Eq, Show)

instance A.FromJSON NvcheckerResult where
  parseJSON = A.withObject "NvcheckerResult" $ \o ->
    NvcheckerResult <$> o A..: "name" <*> ((== A.String "up-to-date") <$> o A..: "event")

runNvchecker :: IO [NvcheckerResult]
runNvchecker = do
  txt <- runShell ("nvchecker --logger json -c " <> T.pack nvcheckerConfig)
  pure . catMaybes $ A.decodeStrict . encodeUtf8 <$> T.lines txt

runNvtake :: IO ()
runNvtake = void $ runShell ("nvtake --all -c " <> T.pack nvcheckerConfig)

runNvcmp :: IO Text
runNvcmp = runShell ("nvcmp -c" <> T.pack nvcheckerConfig)

decodeAsMap :: (A.FromJSONKey a, Ord a) => Maybe A.Value -> Map.Map a Text
decodeAsMap (Just o) = case A.fromJSON o of
  A.Success x -> x
  A.Error e -> error e
decodeAsMap _ = error "failed to parse json"

-----------------------------------------------------------------------------

-- prefetch

prefetchCommand :: Text -> Text
prefetchCommand template = "nix-prefetch '" <> template <> "'"

prefetchPackage :: Text -> IO Text
prefetchPackage fetcherExpr = strip <$> runShell (prefetchCommand fetcherExpr)
  where
    strip :: Text -> Text
    strip s = case (T.stripPrefix "sha256-" <=< lastMaybe . T.lines) s of
      Just x -> x
      _ -> error "failed to prefetch"

lastMaybe :: [Text] -> Maybe Text
lastMaybe [] = Nothing
lastMaybe xs = Just $ last xs

-----------------------------------------------------------------------------

-- homepage

evalHomePages :: IO (Map.Map Text Text)
evalHomePages = fromJust . A.decodeStrict . encodeUtf8 <$>
  runShell [trimming|nix eval './#packages.x86_64-linux' --apply 'with builtins; mapAttrs (_: value: value.meta.homepage or "")' --json|]

-----------------------------------------------------------------------------

snippetN :: Text -> Text -> Text -> Text
snippetN name ver srcP =
  [trimming|
    $name = {
      pname = "$name";
      version = "$ver";
      src = $srcP;
    };
  |]

fixedSN :: Text -> Text
fixedSN name = [trimming|sums.$name|]

sourcesN :: Text -> Text
sourcesN body =
  let s = T.pack sha256Data
   in [trimming|
    # This file was generated by Updater, please do not modify it manually.
    { fetchFromGitHub, fetchurl }:
    let sums = with builtins; (fromJSON (readFile ./$s));
    in {
      $body
    }
  |]

-----------------------------------------------------------------------------

main :: IO ()
main = do
  DefState {_pkgs, _sources} <- runDefinition nixSources
  -- generate nvchecker config file
  generateNvcheckerConfig $ Map.toList _sources

  -- run nvchecker to generate new_ver.json
  T.putStrLn "Running nvchecker..."
  ignoredNames <- fmap nvName . filter isUpToDate <$> runNvchecker

  T.putStr "The following packages are up-to-date: "
  pPrint ignoredNames

  -- parse new_ver.json
  T.putStrLn "Parsing newver json..."
  newVers <- decodeAsMap <$> A.decodeFileStrict' ("Updater" </> newVerData)

  -- stale sources
  let sourcesNeedFetch = Map.filterWithKey (\srcName _ -> srcName `notElem` ignoredNames) newVers
      pkgsNeedFetch = Map.filter (`Map.member` sourcesNeedFetch) _pkgs
      fetchersNeedRun =
        Map.mapWithKey
          ( \Pkg {..} srcName ->
              T.replace
                (unVersion attatchedVer)
                (sourcesNeedFetch Map.! srcName)
                (toNix fetcher)
          )
          pkgsNeedFetch

  T.putStrLn "Packages to fetch: "
  pPrint pkgsNeedFetch

  when (Map.null pkgsNeedFetch) $ do
    T.putStrLn "Nothing to do"
    -- TODO: always update README
    hs <- evalHomePages
    T.writeFile "README.md" $ readme _pkgs newVers hs
    exitSuccess

  -- run fetchers to get SHA256
  sha256sums <- mapM prefetchPackage fetchersNeedRun

  -- recover fresh sha256sums from file
  T.putStrLn "Parsing sha256 json..."
  hasOld <- doesFileExist sha256Data
  recovered <-
    if hasOld
      then Map.filterWithKey (\k _ -> k `elem` ignoredNames) . decodeAsMap <$> A.decodeFileStrict' sha256Data
      else pure Map.empty

  let sha256sumsWithRecovered = recovered <> Map.fromList [(_pkgs Map.! pkg, sha256) | (pkg, sha256) <- Map.toList sha256sums]

  T.putStrLn "Fetch result:"
  pPrint sha256sums

  -- generate sources
  T.putStrLn "Generating sources.nix..."

  let k =
        T.unlines
          [ snippetN name (newVers Map.! srcName) fetcherExpr
            | (Pkg {..}, srcName) <- Map.toList _pkgs,
              let name = unPkgName pkgName,
              let fetcherExpr =
                    T.replace
                      (unVersion attatchedVer)
                      (newVers Map.! srcName)
                      $ toNix $ setSHA256 fetcher $ Just $ fixedSN $ unSourceName srcName
          ]
  T.writeFile "sources.nix" $ sourcesN k <> "\n"

  -- use nvcmp output as commit message
  T.putStrLn "Running nvcmp..."
  commitMessage <- ("Auto update\n" <>) <$> runNvcmp
  T.putStr "Commit message: "
  T.putStrLn commitMessage

  -- update old_ver.json
  T.putStrLn "Running nvtake..."
  runNvtake

  -- write all sums for next use
  LT.writeFile sha256Data $ pStringNoColor . T.unpack . decodeUtf8 . LBS.toStrict $ A.encode sha256sumsWithRecovered
  T.appendFile sha256Data "\n"

  -- update README
  hs <- evalHomePages
  T.writeFile "README.md" $ readme _pkgs newVers hs

  githubEnv <- lookupEnv "GITHUB_ENV"
  case githubEnv of
    Just fp -> do
      appendFile fp "COMMIT_MSG<<EOF\n"
      T.appendFile fp commitMessage
      appendFile fp "\nEOF\n"
    _ -> T.putStrLn "Not in github environment"

  -- stage changes
  unless (null githubEnv) $
    void $ runShell "git add ."

runShell :: Text -> IO Text
runShell x = do
  (_, T.pack -> stdout, T.pack -> stderr) <- readCreateProcessWithExitCode (shell $ T.unpack x) ""
  let s = T.replicate 10 "-"
  T.putStrLn $ s <> " stdout: " <> T.pack (show x) <> " " <> s
  T.putStrLn stdout
  T.putStrLn $ s <> " stderr: " <> T.pack (show x) <> " " <> s
  T.putStrLn stderr
  pure stdout

readme :: Map.Map Pkg SourceName -> Map.Map SourceName Text -> Map.Map Text Text -> Text
readme ps vs hs =
  [trimming|

    # flakes

    ![CI](https://github.com/berberman/flakes/workflows/Update%20and%20check/badge.svg)

    This repo adopts automatic update mechanism, where packages sources are defined in [Config.hs](./Config.hs).
    The update script generates configuration file for [nvchecker](https://github.com/lilydjwg/nvchecker),
    and then consults it to find outdated packages, feeding them to [nix-prefetch](https://github.com/msteen/nix-prefetch)
    to recalculate SHA256 sums. The results will be dumped to [sums.json](./sums.json),
    and corresponding nix exprs will be written to [sources.nix](./sources.nix).

    ## Usage

    Use binary cache from cachix:
    
    ```
    $ cachix use berberman
    ```

    ### Run a package immediately
    
    ```
    $ nix run github:berberman/flakes#feeluown
    ```

    ### Add the overlay to your system

    In your [NixOS configuration flake](https://www.tweag.io/blog/2020-07-31-nixos-flakes/):

    ```nix
    {
    
      inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        berberman = {
          url = "github:berberman/flakes";
          inputs.nixpkgs.follows = "nixpkgs";
        };
      };

      outputs = { self, nixpkgs, berberman }: {
      
        overlays = [ berberman.overlay ];

        # ... rest config
      };
    }
    ```

    ### NixOS CN

    Packages provided by this flake are re-exported to [NixOS CN Flakes](https://github.com/nixos-cn/flakes),
    so you can also use the CN flakes by following their instructions.

    ## Packages available

    #### This part was generated automatically.

    $rendered

|]
  where
    rendered =
      T.unlines
        [ [trimming|* [$name]($homepage) - $ver|]
          | (Pkg {..}, srcName) <- Map.toList ps,
            let name = unPkgName pkgName
                ver = vs Map.! srcName
                homepage = hs Map.! name
        ]
