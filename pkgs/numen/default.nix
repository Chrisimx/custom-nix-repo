{ lib
, buildGoModule
, fetchFromSourcehut
, dotool
, vosk}:

buildGoModule rec {
  name = "numen-${version}";
  version = "0.7";

  src = fetchFromSourcehut {
    owner = "~geb";
    repo = "numen";
    rev = version;
    hash = "sha256-ia01lOP59RdoiO23b5Dv5/fX5CEI43tPHjmaKwxP+OM=";
  };
  buildInputs = [
     dotool
     vosk
  ];
  postInstall = ''
    mkdir -p $out/bin
    cp ./numenc $out/bin
  '';
  vendorHash = "sha256-Y3CbAnIK+gEcUfll9IlEGZE/s3wxdhAmTJkj9zlAtoQ=";
  
  meta = with lib; {
    description = "Command to simulate input anywhere";
    homepage = "https://git.sr.ht/~geb/dotool";
    changelog = "https://git.sr.ht/~geb/dotool/tree/${version}/item/CHANGELOG.md";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ dit7ya ];
  };
}
