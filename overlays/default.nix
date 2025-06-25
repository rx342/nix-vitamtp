final: prev: {
  libusb1 = prev.libusb1.override { withDocs = false; };
  libxml2 = (prev.libxml2.override { pythonSupport = false; }).overrideAttrs {
    version = "2.9.14";
    doCheck = false;
    src = prev.fetchurl {
      url = "mirror://gnome/sources/libxml2/${prev.lib.versions.majorMinor final.libxml2.version}/libxml2-${final.libxml2.version}.tar.xz";
      hash = "sha256-YNdKJX0czsBHXnScui8hVZ5IE577pv8oIkNXx8eY3+4=";
    };
  };
}
