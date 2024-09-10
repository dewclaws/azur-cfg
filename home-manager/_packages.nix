{
  pkgs,
  osConfig,
  ...
}: {
  home = {
    packages = with pkgs;
      [
        asciiquarium
        bat
        btop
        croc
        du-dust
        dua
        duf
        gdu
        htop
        hyperfine
        imagemagick
        jdupes
        kopia
        tree
        yt-dlp
      ];
  };
}       
