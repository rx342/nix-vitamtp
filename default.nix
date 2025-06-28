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

{
  libvitamtp = pkgs.callPackage ./libvitamtp.nix { inherit vitamtp; };
  udev = pkgs.runCommand "psvita-udev" { } ''
    install -D -m644 ${vitamtp}/debian/libvitamtp5.udev $out/lib/udev/rules.d/60-psvita.rules
  '';
}
