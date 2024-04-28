{ lib, pkgs, ... }:

let

  pname = "warp-terminal";
  version = "0.2024.03.05.08.02.stable_00";

  meta = with lib; {
    description = "Rust-based terminal";
    homepage = "https://www.warp.dev";
    license = licenses.unfree;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    maintainers = with maintainers; [ emilytrau Enzime ];
    platforms = [ "x86_64-linux" ];
  };

  warp-terminal = pkgs.stdenv.mkDerivation (finalAttrs: {
    inherit pname version meta;
    src = pkgs.fetchurl {
      url =
        "https://releases.warp.dev/stable/v${finalAttrs.version}/warp-terminal-v${finalAttrs.version}-1-x86_64.pkg.tar.zst";
      hash = "sha256-cAqO0Xc8lGgvI1zzCuS90GEAkTDcwIWDlgKr65dEZPQ=";
    };

    sourceRoot = ".";

    postPatch = ''
      substituteInPlace usr/bin/warp-terminal \
        --replace-fail /opt/ $out/opt/
    '';

    nativeBuildInputs = with pkgs; [ autoPatchelfHook zstd ];

    buildInputs = with pkgs; [
      curl
      fontconfig
      stdenv.cc.cc.lib # libstdc++.so libgcc_s.so
      zlib
    ];

    runtimeDependencies = with pkgs; [
      libglvnd # for libegl
      libxkbcommon
      stdenv.cc.libc
      vulkan-loader
      xdg-utils
      xorg.libX11
      xorg.libxcb
      xorg.libXcursor
      xorg.libXi
    ];

    installPhase = ''
      runHook preInstall

      mkdir $out
      cp -r opt usr/* $out

      runHook postInstall
    '';
  });

in { home.packages = with pkgs; [ warp-terminal ]; }
