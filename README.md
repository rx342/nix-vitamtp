# nix-vitamtp

Packaging [codestation/vitamtp](https://github.com/codestation/vitamtp) with Nix.

> [!TIP]
> It might work using a different source code (_e.g._ [yifanlu/VitaMTP](https://github.com/yifanlu/VitaMTP) or other forks) but I did not try it.
> It is mainly written to be used with [rx342/nix-qcma](https://github.com/rx342/nix-qcma).

> [!WARNING]
> Tested on `x86_64-linux`.

## Why and how?

`vitamtp` is an "old" package (`2.5.9` dates back to 2016) which makes it tricky to build today.
With Nix and pinned dependencies, we are sure that it will work forever™ (for legal reasons: this is a joke).

- An old version of `libxml2` is required (we use `2.9.14` in this repository)
  - Defined in the [overlay](./overlays/default.nix)
  - Needs to be built from source, which increases build time

## Installation

```bash
git clone https://github.com/rx342/nix-vitamtp.git
```

## Usage

### Build library

```bash
nix-build -A libvitamtp
```

### udev rule

To be able to detect your PS VITA you need to add an [udev](https://wiki.archlinux.org/title/Udev) rule.
You can download it from [codestation/vitamtp](https://github.com/codestation/vitamtp/blob/master/debian/libvitamtp5.udev) or do it from this repository (it does the same thing).
If you decide to install from _this_ repository, choose one of the following method according to your Linux distribution.

#### NixOS

You need to add the following to your `configuration.nix`

```nix
imports = [ "${./path/to/nix-vitamtp}/modules/nixos.nix" ];
```

and you can check that `/etc/udev/rules.d/60-psvita.rules` exists.

#### Other Linux distributions

```bash
cd nix-vitamtp
nix-build -A udev

sudo cp ./result/lib/udev/rules.d/60-psvita.rules /usr/lib/udev/rules.d/
```

## Credits

- [codestation/vitamtp](https://github.com/codestation/vitamtp)
