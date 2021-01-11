{ stdenv, lib, pythonPackages, qasync, mpv }:

let
  buildPythonApplication = pythonPackages.buildPythonApplication;
  fetchPypi = pythonPackages.fetchPypi;

in buildPythonApplication rec {
  pname = "feeluown";
  version = "3.6.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "dXFSAH2CdWkJsidFqwvnftPHKFcLCq7MjRIjDGYy/ds=";
  };

  doCheck = false;

  propagatedBuildInputs = (with pythonPackages; [
    dbus-python
    setuptools
    pyqt5
    pyopengl
    janus
    requests
    tomlkit
  ]) ++ [ mpv qasync ];

  postUnpack = ''
    substituteInPlace ./${pname}-${version}/mpv.py \
      --replace "_dll = ctypes.util.find_library(_default_mpv_dylib)" \
                '_dll = "${mpv}/lib/libmpv${stdenv.targetPlatform.extensions.sharedLibrary}"'
  '';
  meta = with lib; {
    homepage = "https://github.com/feeluown/FeelUOwn";
    description = "FeelUOwn Music Player";
    license = licenses.gpl3Only;
  };
}
