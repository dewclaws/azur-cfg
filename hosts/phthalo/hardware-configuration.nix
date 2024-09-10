{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports =[
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
      timeout = 5;
    };
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    supportedFilesystems = [ "zfs" ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/0d7923ec-2889-4718-b35d-ae0585ad134a";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/3B84-144F";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
    "/storage" = {
      device = "storage";
      fsType = "zfs";
    };
  };

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
