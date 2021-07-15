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
    version = "0.3.0";
    src = fetchurl {
      sha256 = "0j7n6q7b9q4gyzr68a54i21kzmz0xsivmnqs5i9ny6w4gdz0favc";
      url = "https://pypi.io/packages/source/f/fastocr/fastocr-0.3.0.tar.gz";
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
    version = "20210614";
    src = fetchurl {
      sha256 = "07zk96havkli1i8945vgbk1nvym3jxyy34gglxhgx1639z1pmh52";
      url = "https://github.com/outloudvi/mw2fcitx/releases/download/20210614/moegirl.dict";
    };
    
  };
  fcitx5-pinyin-zhwiki = {
    pname = "fcitx5-pinyin-zhwiki";
    version = "0.2.3.20210704";
    src = fetchurl {
      sha256 = "1419cqwbqfkixzsfp207zvm2fw6gmfgiwcic7mcfgak9b7x0jhc9";
      url = "https://github.com/felixonmars/fcitx5-pinyin-zhwiki/releases/download/0.2.3/zhwiki-20210704.dict";
    };
    
  };
  feeluown-core = {
    pname = "feeluown-core";
    version = "3.7.10";
    src = fetchurl {
      sha256 = "0yr7xqaf7bb8xg2hdphgii6pmlnrpadhhmzns6aw591l469xgpmp";
      url = "https://pypi.io/packages/source/f/feeluown/feeluown-3.7.10.tar.gz";
    };
    
  };
  feeluown-kuwo = {
    pname = "feeluown-kuwo";
    version = "0.1.4";
    src = fetchurl {
      sha256 = "1knflrhipadmqqsgs9cysp1hn9lx58q2x00bd1lrbm16nq1ngcyr";
      url = "https://pypi.io/packages/source/f/fuo_kuwo/fuo_kuwo-0.1.4.tar.gz";
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
    version = "0.7.1";
    src = fetchurl {
      sha256 = "0yzhbpwlsg3n8q21xfd8hfnf7fc9pcv69kqdypij3xpdrfadvcpg";
      url = "https://pypi.io/packages/source/f/fuo_netease/fuo_netease-0.7.1.tar.gz";
    };
    
  };
  feeluown-qqmusic = {
    pname = "feeluown-qqmusic";
    version = "0.3.3";
    src = fetchurl {
      sha256 = "0gwcg8xc0nxk5dl6f2kl2mzi0fr70qdrv29fk151pikg3hmh5i3l";
      url = "https://pypi.io/packages/source/f/fuo_qqmusic/fuo_qqmusic-0.3.3.tar.gz";
    };
    
  };
  pypinyin = {
    pname = "pypinyin";
    version = "0.42.0";
    src = fetchurl {
      sha256 = "18fkl6hagg6w8pz48r6af9pqvnz6fdq7zrf783a3h8xx0frh7w62";
      url = "https://pypi.io/packages/source/p/pypinyin/pypinyin-0.42.0.tar.gz";
    };
    
  };
  qasync = {
    pname = "qasync";
    version = "0.17.0";
    src = fetchurl {
      sha256 = "11x7qdcldxlq1fw9aza2fqijbdf6yxl7kyjf674164kkg2acf5ky";
      url = "https://pypi.io/packages/source/q/qasync/qasync-0.17.0.tar.gz";
    };
    
  };
  qliveplayer = {
    pname = "qliveplayer";
    version = "3.22.4";
    src = fetchgit {
      url = "https://github.com/IsoaSFlus/QLivePlayer";
      rev = "3.22.4";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0nd8f7ixwrpdkwq3dz8891xnbm4ss2scmkz5v29s2gfk2kgdmilq";
    };
    
  };
}
