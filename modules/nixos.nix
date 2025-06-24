{ ... }:

let
  libvitamtp = (import ../default.nix { }).lib;
in
{
  config = {
    services.udev.packages = [ libvitamtp ];
  };
}
