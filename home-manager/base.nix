{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./_packages.nix
    ./_zsh.nix
  ];

  home = {
    username = "j";
    homeDirectory = lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux "/home/j")
      (lib.mkIf pkgs.stdenv.isDarwin "/Users/j")
    ];
    stateVersion = "24.05";
  };

  programs = {
    git = {
      enable = true;
      userName = "J Koenen";
      userEmail = "koenen@sheridancollege.ca";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };
    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "zenburn";
      };
    };
    tealdeer = {
      enable = true;
      settings.updates.auto_update = true;
    };
    lsd = {
      enable = true;
      enableAliases = true;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    ranger.enable = true;
    fastfetch.enable = true;
  };

  systemd.user.startServices = "sd-switch";
}
