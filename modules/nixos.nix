{ ... }:

let
  libvitamtp = (import ../default.nix { }).udev;
in
{
  config = {
    services.udev.packages = [ libvitamtp ];
  };
}
