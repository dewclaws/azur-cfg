{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./_packages.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  users = {
    users.j = {
      isNormalUser = true;
      description = "J Koenen";
      extraGroups = [ "networkmanager" "wheel" ];
      hashedPassword = "$6$rqNspupzNXYXuP2U$AwvN0iDS25R9gIJ1miynHbvKd/2KGfhsMOota.EuSRO9MfLrJMQtHHP4afXuEFe/WJzDQNKQFVp3ZpMSurSFp.";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDUnT87txzAPYuJLVYnVdA5vOUkXZ1yfRfhIg5ibSyox"
      ];
      shell = pkgs.zsh;
    };
    mutableUsers = false;
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
      openFirewall = true;
    };
    fstrim.enable = true;
    zfs = {
      autoSnapshot.enable = true;
      autoScrub.enable = true;
      trim.enable = true;
    };
  };

  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
  };

  programs.zsh.enable = true;
  security.sudo.wheelNeedsPassword = false;
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
