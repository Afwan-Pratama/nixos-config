{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "sddm";
    rev = "529ec0f994c0e2527f118d17b143892f4d214575";
    sha256 = "gXUi6rBUr8ZGbUbo1/rMYIvbluKkyqqe+PMP3Xwf/kI=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./src/catppuccin-mocha/* $out/
  '';
}
