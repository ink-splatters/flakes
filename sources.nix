# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl }:
{
  apple-emoji = {
    pname = "apple-emoji";
    version = "0.0.0.20200413";
    src = fetchurl {
      sha256 = "0xaclj29b7xgqin8izkabrm2znp1m01894fngyxrhwbf9nbncp4g";
      url = "https://github.com/samuelngs/apple-emoji-linux/releases/download/latest/AppleColorEmoji.ttf";
    };
  };
  fastocr = {
    pname = "fastocr";
    version = "0.2.0";
    src = fetchurl {
      sha256 = "1s0cgfknjrws8c1mfj656gd9cjbwh3cspf14p2qvs10hlf7jvbh2";
      url = "https://pypi.io/packages/source/f/fastocr/fastocr-0.2.0.tar.gz";
    };
  };
  fcitx5-material-color = {
    pname = "fcitx5-material-color";
    version = "0.2.1";
    src = fetchgit {
      url = "https://github.com/hosxy/fcitx5-material-color";
      rev = "0.2.1";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0drdypjf1njl7flkb5d581vchwlp4gaqyws3cp0v874wkwh4gllb";
    };
  };
  fcitx5-pinyin-moegirl = {
    pname = "fcitx5-pinyin-moegirl";
    version = "20210415";
    src = fetchurl {
      sha256 = "0gwhx4myhp2dc323rg4m33kv9m73klii42lnji7mywi0zn7s7nx1";
      url = "https://github.com/outloudvi/mw2fcitx/releases/download/20210415/moegirl.dict";
    };
  };
  fcitx5-pinyin-zhwiki = {
    pname = "fcitx5-pinyin-zhwiki";
    version = "20210520";
    src = fetchurl {
      sha256 = "17f6cmvs0xsi3sq6da98865szzkfpk2smdag06aikl8bn9s5v584";
      url = "https://github.com/felixonmars/fcitx5-pinyin-zhwiki/releases/download/0.2.2/zhwiki-20210520.dict";
    };
  };
  feeluown-core = {
    pname = "feeluown-core";
    version = "3.7.7";
    src = fetchurl {
      sha256 = "06d3j39ff9znqxkhp9ly81lcgajkhg30hyqxy2809yn23xixg3x2";
      url = "https://pypi.io/packages/source/f/feeluown/feeluown-3.7.7.tar.gz";
    };
  };
  feeluown-kuwo = {
    pname = "feeluown-kuwo";
    version = "0.1.3";
    src = fetchurl {
      sha256 = "06icvmidr8c5bz0m5jvg5qzgaj86n5gsr0jgjpd1a9ahkhi19gb8";
      url = "https://pypi.io/packages/source/f/fuo_kuwo/fuo_kuwo-0.1.3.tar.gz";
    };
  };
  feeluown-local = {
    pname = "feeluown-local";
    version = "0.2.1";
    src = fetchurl {
      sha256 = "0ifl2d5qwx0cyh6i1c952ldwwzdcwzbj98fxx2b8dky3wlla96d7";
      url = "https://pypi.io/packages/source/f/fuo_local/fuo_local-0.2.1.tar.gz";
    };
  };
  feeluown-netease = {
    pname = "feeluown-netease";
    version = "0.6";
    src = fetchurl {
      sha256 = "1hklk1kg91n9mdnq6v2r13yv2rv1q637jlzw09jix4hzg71bsngs";
      url = "https://pypi.io/packages/source/f/fuo_netease/fuo_netease-0.6.tar.gz";
    };
  };
  feeluown-qqmusic = {
    pname = "feeluown-qqmusic";
    version = "0.3.2";
    src = fetchurl {
      sha256 = "0m428fgmsyj96mxjq6x29ksl0m9wx0ni09m67smraz8jqlwj79sk";
      url = "https://pypi.io/packages/source/f/fuo_qqmusic/fuo_qqmusic-0.3.2.tar.gz";
    };
  };
  pypinyin = {
    pname = "pypinyin";
    version = "0.41.0";
    src = fetchurl {
      sha256 = "06qbcwkhrym11wajwxa7zcy9lz970bv0hadsbrg5235h4ann7jhx";
      url = "https://pypi.io/packages/source/p/pypinyin/pypinyin-0.41.0.tar.gz";
    };
  };
  qasync = {
    pname = "qasync";
    version = "0.16.0";
    src = fetchurl {
      sha256 = "1c9058j2l4jg46zicm7n3pc9jdnd617lwg60kv6lmqrlfyv1zfv5";
      url = "https://pypi.io/packages/source/q/qasync/qasync-0.16.0.tar.gz";
    };
  };
  qliveplayer = {
    pname = "qliveplayer";
    version = "3.22.1";
    src = fetchgit {
      url = "https://github.com/IsoaSFlus/QLivePlayer";
      rev = "3.22.1";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "02qnlalylz47h1kz8qq5v67nq8j2qxzwfnfs53syz1kkkzq61rc2";
    };
  };
}