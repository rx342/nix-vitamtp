{
  system ? builtins.currentSystem,
  source ? import ./npins,
  pkgs ? import source.nixpkgs {
    overlays = [ ];
    config = { };
    inherit system;
  },
  vitamtp ? source.vitamtp,
}:

pkgs.callPackage ./libvitamtp.nix { inherit vitamtp; }
