{ pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/5f707e8e06fba30126a6627bc9cce9d3b4a12900.tar.gz";
    sha256 = "0vv2ribx6g4jgn0bzpjdz4l43j4nbb5ywvj5ajg29kappyay7jsi";
  }) {}
}:

with pkgs;

let self = ps: with python3Packages; rec {

  GitPyhon = buildPythonPackage rec {
    pname = "GitPython";
    version = "2.1.11";
    src = fetchPypi {
      inherit pname version;
      extension = "tar.gz";
      sha256 = "8237dc5bfd6f1366abeee5624111b9d6879393d84745a507de0fda86043b65a8";
    };
    propagatedBuildInputs = [
      gitdb2
    ];
    doCheck = false;
  };

  Deprecated = buildPythonPackage rec {
    pname = "Deprecated";
    version = "1.2.6";
    src = fetchPypi {
      inherit pname version;
      extension = "tar.gz";
      sha256 = "a515c4cf75061552e0284d123c3066fbbe398952c87333a92b8fc3dd8e4f9cc1";
    };
    checkInputs = [
      pytest
    ];
    propagatedBuildInputs = [
      wrapt
    ];
    doCheck = false;
  };

  PyGithub = buildPythonPackage rec {
    pname = "PyGithub";
    version = "1.39";
    src = fetchPypi {
      inherit pname version;
      extension = "tar.gz";
      sha256 = "8a87bc0fbd0b70c2f12911f7f25a493cd13371bc1bbac6c548cc61b69e7d006f";
    };
    propagatedBuildInputs = [
      Deprecated
      requests
      pyjwt
    ];
    doCheck = false;
  };

  layouts = buildPythonPackage rec {
    pname = "layouts";
    version = "0.4.7";
    src = fetchPypi {
      inherit pname version;
      extension = "tar.gz";
      sha256 = "b0ceae120943416752c3a4a87ca5602ab11656753f5333c44bf2ae093c8dca00";
    };
    propagatedBuildInputs = [
      requests
      PyGithub
    ];
    doCheck = false;
  };

  kll = buildPythonPackage rec {
    pname = "kll";
    version = "0.5.7.13";
    src = fetchPypi {
      inherit pname version;
      extension = "tar.gz";
      sha256 = "cf3b9de9f4157ee934a891c1a77fd9008d82fd8731167b4d50c879d49fb5e7b2";
    };
    propagatedBuildInputs = [
      GitPython
      packaging
      layouts
    ];
    doCheck = false;
  };

};

in pkgs.stdenv.mkDerivation {
  name = "ergodox";
  buildInputs = with pkgs; [
    cmake
    ctags
    dfu-util
    git
    libusb.dev
    lsb-release
    pkgsCross.arm-embedded.buildPackages.gcc
    (python3.withPackages (ps: with ps; with self { inherit ps; }; [
      kll
      pillow
    ]))
  ];
}
