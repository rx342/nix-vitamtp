{
  system ? builtins.currentSystem,
  source ? import ./npins,
  pkgs ? import source.nixpkgs {
    overlays = [ (import ./overlays/default.nix) ];
    config = { };
    inherit system;
  },
  vitamtp ? source.vitamtp,
}:

pkgs.callPackage ./libvitamtp.nix { inherit vitamtp; }
