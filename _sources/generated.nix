# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  apple-emoji = {
    pname = "apple-emoji";
    version = "0.0.0.20200413";
    src = fetchurl {
      url = "https://github.com/samuelngs/apple-emoji-linux/releases/download/alpha-release-v1.0.0/AppleColorEmoji.ttf";
      sha256 = "sha256-j1xml01ucZi7f9aRhAKo4doval5q/ohsxK+flYSkTHU=";
    };
  };
  fastocr = {
    pname = "fastocr";
    version = "0.3.7";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/fastocr/fastocr-0.3.7.tar.gz";
      sha256 = "sha256-jOvWmKWwrBfq/2+XqKaaeavfNn7OAcsn6bB6ZCfNukM=";
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
    version = "20230514";
    src = fetchurl {
      url = "https://github.com/outloudvi/mw2fcitx/releases/download/20230514/moegirl.dict";
      sha256 = "sha256-Ozr9EBPoaSj17RTDC2fPMfMu0p2Mu/D9Wkxtddw3Myk=";
    };
  };
  fcitx5-pinyin-zhwiki = {
    pname = "fcitx5-pinyin-zhwiki";
    version = "0.2.4.20230507";
    src = fetchurl {
      url = "https://github.com/felixonmars/fcitx5-pinyin-zhwiki/releases/download/0.2.4/zhwiki-20230507.dict";
      sha256 = "sha256-p4JdQMIBfg9QuRu6vT+eCLqXGyTvAUz2V5wJOSAbv7c=";
    };
  };
  feeluown-bilibili = {
    pname = "feeluown-bilibili";
    version = "0.1.5";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/feeluown_bilibili/feeluown_bilibili-0.1.5.tar.gz";
      sha256 = "sha256-g7N3QnRLXC1MOMQAbxGLqwMMcUdxmIEL9vX5OKsxMg4=";
    };
  };
  feeluown-core = {
    pname = "feeluown-core";
    version = "3.8.11";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/feeluown/feeluown-3.8.11.tar.gz";
      sha256 = "sha256-+bJ+vsim5kIx4rnSVEHlw+4HWm9IPbuo9dBvHqEQ7wg=";
    };
  };
  feeluown-kuwo = {
    pname = "feeluown-kuwo";
    version = "0.1.6";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/fuo_kuwo/fuo_kuwo-0.1.6.tar.gz";
      sha256 = "sha256-V7Y6OXv9xJNde+Ynu8I4uv9G3F9pBS+Z3IiSVIkwsOU=";
    };
  };
  feeluown-local = {
    pname = "feeluown-local";
    version = "0.3";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/fuo_local/fuo_local-0.3.tar.gz";
      sha256 = "sha256-7Qgi9nGxmic3nq6icWUC7pQjyF6Gj91TAH5RyrvMI7Y=";
    };
  };
  feeluown-netease = {
    pname = "feeluown-netease";
    version = "0.9.5";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/fuo_netease/fuo_netease-0.9.5.tar.gz";
      sha256 = "sha256-tdmdR2WaXpieAR4TT8QplymDtAUGtm22U+QCOCeMdco=";
    };
  };
  feeluown-qqmusic = {
    pname = "feeluown-qqmusic";
    version = "0.4.1";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/fuo_qqmusic/fuo_qqmusic-0.4.1.tar.gz";
      sha256 = "sha256-IBCw5o5VYUyJbioWNgSML2ZVculhHBLXAhZA7qlZKH4=";
    };
  };
  py-term = {
    pname = "py-term";
    version = "0.7";
    src = fetchurl {
      url = "https://pypi.io/packages/source/p/py-term/py-term-0.7.tar.gz";
      sha256 = "sha256-q6pNGsEnzMbdUNGTensDD1on6jvZOvNr7COu79BdUMk=";
    };
  };
  pypinyin = {
    pname = "pypinyin";
    version = "0.49.0";
    src = fetchurl {
      url = "https://pypi.io/packages/source/p/pypinyin/pypinyin-0.49.0.tar.gz";
      sha256 = "sha256-pdYaecX0j2tKQi8BDCDUj81TxwV4TfSqgOMpSTIZpL4=";
    };
  };
  qasync = {
    pname = "qasync";
    version = "0.24.0";
    src = fetchurl {
      url = "https://pypi.io/packages/source/q/qasync/qasync-0.24.0.tar.gz";
      sha256 = "sha256-5YPRw64g/RLpCN7jWMUncJtIDnjVf7cu5XqUCXMH2Vk=";
    };
  };
  qbittorrent-enhanced = {
    pname = "qbittorrent-enhanced";
    version = "release-4.5.2.10";
    src = fetchFromGitHub ({
      owner = "c0re100";
      repo = "qBittorrent-Enhanced-Edition";
      rev = "release-4.5.2.10";
      fetchSubmodules = false;
      sha256 = "sha256-MuVwqUaPQij6Kox9BLjxkOqPLz/B+hALX7AurKy65KM=";
    });
  };
  zydra = {
    pname = "zydra";
    version = "791fabd188adcb1fd1cd8c53288b424740114cf9";
    src = fetchFromGitHub ({
      owner = "hamedA2";
      repo = "Zydra";
      rev = "791fabd188adcb1fd1cd8c53288b424740114cf9";
      fetchSubmodules = false;
      sha256 = "sha256-6yHPlinmbg3M7Yun+fn34LJY1xggZy9mAgwRDgRZf9Y=";
    });
    date = "2020-07-22";
  };
}
