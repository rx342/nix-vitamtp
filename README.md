# nix-vitamtp

Packaging [codestation/vitamtp](https://github.com/codestation/vitamtp) with Nix.

It might work using a different source code (_e.g._ [yifanlu/VitaMTP](https://github.com/yifanlu/VitaMTP) or other forks) but I did not try it.
It is mainly written to be used with [rx342/nix-qcma](https://github.com/rx342/nix-qcma).

Tested on `x86_64-linux`.

## Installation

```bash
git clone https://github.com/rx342/nix-vitamtp.git
```

## Usage

To be able to detect your PS VITA you need to add an [udev](https://wiki.archlinux.org/title/Udev) rule.

### NixOS

You need to add the following to your `configuration.nix`

```nix
services.udev.packages = [ (import ./path/to/nix-vitamtp { }).lib ];
```

and you can check that `/etc/udev/rules.d/60-psvita.rules` exists.

### Other Linux distributions

```bash
cd nix-vitamtp
nix-build

sudo cp ./result-lib/lib/udev/rules.d/60-psvita.rules /usr/lib/udev/rules.d/
```
