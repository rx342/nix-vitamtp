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
    libtool
    libusb1
    libxml2
    gettext
    pkg-config
  ];
  configurePhase = ''
    mkdir -p $out
    ./autogen.sh
    ./configure --prefix=$out
  '';
  buildPhase = ''
    make
  '';
  installPhase = ''
    make install
  '';
}
