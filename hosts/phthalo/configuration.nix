{
  inputs,
  outputs,
  ...
}: {
  imports =
    [
      inputs.home-manager.nixosModules.home-manager

      ./hardware-configuration.nix

      ./../nixos/base.nix
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      j = import ../home-manager/base.nix;
    };
  };

  networking = {
    hostName = "phtalo";
    hostId = "2785bd27";
  };
}
