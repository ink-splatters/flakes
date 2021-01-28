{ lib, pythonPackages, feeluown-core, mySource }:

let inherit (pythonPackages) buildPythonPackage;

in buildPythonPackage rec {
  inherit (mySource) pname version src;

  doCheck = false;

  propagatedBuildInputs =
    (with pythonPackages; [ setuptools marshmallow requests ])
    ++ [ feeluown-core ];

  meta = with lib; {
    homepage = "https://github.com/feeluown/feeluown-xiami";
    description = "feeluown xiami plugin";
    license = licenses.gpl3Only;
  };
}
