{
  stdenv,
  autoconf,
  automake,
  gettext,
  libtool,
  libusb1,
  libxml2,
  pkg-config,
  vitamtp,
}:

stdenv.mkDerivation {
  pname = "libvitamtp";
  version = "2.5.9";
  src = vitamtp;
  nativeBuildInputs = [
    autoconf
    automake
    pkg-config
  ];
  buildInputs = [
    libtool
    libusb1
    libxml2
    gettext
  ];
  configurePhase = ''
    mkdir -p $out
    ./autogen.sh
    ./configure --prefix=$out --libdir=$lib/lib --includedir=$dev/include
  '';
  buildPhase = ''
    make
  '';
  installPhase = ''
    make install
    install -D -m644 $src/debian/libvitamtp5.udev $lib/lib/udev/rules.d/60-psvita.rules
  '';
  outputs = [
    "lib"
    "dev"
    "out"
  ];
}
