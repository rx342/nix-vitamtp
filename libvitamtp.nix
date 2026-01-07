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
  version = "2.5.10";
  src = vitamtp;
  nativeBuildInputs = [
    autoconf
    automake
    gettext
    libtool
    pkg-config
  ];
  buildInputs = [
    libusb1
    libxml2
  ];
  patchPhase = ''
    substituteInPlace configure.ac --replace-fail 'AM_ICONV' '# AM_ICONV'
  '';
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
  '';
  outputs = [
    "lib"
    "dev"
    "out"
  ];
}
