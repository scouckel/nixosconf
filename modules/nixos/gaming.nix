{
  imports = [
    ./steam.nix
  ];

  services.flatpak = {
    packages = [
      "org.vinegarhq.Sober"
    ];
  };
}