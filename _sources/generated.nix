# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub }:
{
  apple-emoji = {
    pname = "apple-emoji";
    version = "0.0.0.20200413";
    src = fetchurl {
      url = "https://github.com/samuelngs/apple-emoji-linux/releases/download/latest/AppleColorEmoji.ttf";
      sha256 = "sha256-j1xml01ucZi7f9aRhAKo4doval5q/ohsxK+flYSkTHU=";
    };
  };
  fastocr = {
    pname = "fastocr";
    version = "0.3.0";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/fastocr/fastocr-0.3.0.tar.gz";
      sha256 = "sha256-bCsHfnuEG29TLBrbuqPu4Nc/g4ikKGTy94/gtA429kg=";
    };
  };
  fcitx5-material-color = {
    pname = "fcitx5-material-color";
    version = "0.2.1";
    src = fetchFromGitHub ({
      owner = "hosxy";
      repo = "fcitx5-material-color";
      rev = "0.2.1";
      fetchSubmodules = false;
      sha256 = "sha256-i9JHIJ+cHLTBZUNzj9Ujl3LIdkCllTWpO1Ta4OT1LTc=";
    });
  };
  fcitx5-pinyin-moegirl = {
    pname = "fcitx5-pinyin-moegirl";
    version = "20211214";
    src = fetchurl {
      url = "https://github.com/outloudvi/mw2fcitx/releases/download/20211214/moegirl.dict";
      sha256 = "sha256-yjDfdMysD6oHxDyJ3Bhz/9Qt4TD6cRtFk+NCpkAty6I=";
    };
  };
  fcitx5-pinyin-zhwiki = {
    pname = "fcitx5-pinyin-zhwiki";
    version = "0.2.3.20220101";
    src = fetchurl {
      url = "https://github.com/felixonmars/fcitx5-pinyin-zhwiki/releases/download/0.2.3/zhwiki-20220101.dict";
      sha256 = "sha256-7HidUEeLBomnl2853afVHNsGfUh61YfhYXZSZwn2h40=";
    };
  };
  feeluown-core = {
    pname = "feeluown-core";
    version = "3.7.14";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/feeluown/feeluown-3.7.14.tar.gz";
      sha256 = "sha256-emQFzsEKMfMK/hrQnnFM2Airqz2x64mairyd047l/V8=";
    };
  };
  feeluown-kuwo = {
    pname = "feeluown-kuwo";
    version = "0.1.5";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/fuo_kuwo/fuo_kuwo-0.1.5.tar.gz";
      sha256 = "sha256-1Umad7glnyO7l+Pu0dfPQkIkM8lT4Q5Z4JQqPUxge1M=";
    };
  };
  feeluown-local = {
    pname = "feeluown-local";
    version = "0.2.1";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/fuo_local/fuo_local-0.2.1.tar.gz";
      sha256 = "sha256-p5mkKOXDz4aW6N2hJNfnrH3OGxUlsRAN9Ax0jksT1EU=";
    };
  };
  feeluown-netease = {
    pname = "feeluown-netease";
    version = "0.8";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/fuo_netease/fuo_netease-0.8.tar.gz";
      sha256 = "sha256-C1eHG2V+qe+ub4OUfLVrumO31kQugr8xb8WBMmsg9LU=";
    };
  };
  feeluown-qqmusic = {
    pname = "feeluown-qqmusic";
    version = "0.3.3";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/fuo_qqmusic/fuo_qqmusic-0.3.3.tar.gz";
      sha256 = "sha256-dMQCKxxvxhtKmC6JnRsGJzsQfxV0CmdoK7NbwDp6jD8=";
    };
  };
  pypinyin = {
    pname = "pypinyin";
    version = "0.44.0";
    src = fetchurl {
      url = "https://pypi.io/packages/source/p/pypinyin/pypinyin-0.44.0.tar.gz";
      sha256 = "sha256-AHsmy5Rblt5BBB4VpIFhQH3sNt4TLwjiPfpux+NiQDM=";
    };
  };
  qasync = {
    pname = "qasync";
    version = "0.22.0";
    src = fetchurl {
      url = "https://pypi.io/packages/source/q/qasync/qasync-0.22.0.tar.gz";
      sha256 = "sha256-vXcZKhOxyUg1oMhzIOiACP6qaRt+5RhgRH36PF80cI0=";
    };
  };
  qbittorrent-enhanced = {
    pname = "qbittorrent-enhanced";
    version = "release-4.3.9.10";
    src = fetchFromGitHub ({
      owner = "c0re100";
      repo = "qBittorrent-Enhanced-Edition";
      rev = "release-4.3.9.10";
      fetchSubmodules = false;
      sha256 = "sha256-MiAfqcalfk6CWBtLtENnwc0W17MLSZOoLuzfu/xP4Pw=";
    });
  };
  qliveplayer = {
    pname = "qliveplayer";
    version = "4.1.1";
    src = fetchFromGitHub ({
      owner = "THMonster";
      repo = "QLivePlayer";
      rev = "4.1.1";
      fetchSubmodules = true;
      sha256 = "sha256-qhFcUzTV4F6UVP14XuEYp4KWalQwnMBItA7J8rzyHNY=";
    });
    cargoLock = {
      lockFile = ./qliveplayer-4.1.1/src/QLivePlayer-Lib/Cargo.lock;
      outputHashes = {
        
      };
    };
  };
}
