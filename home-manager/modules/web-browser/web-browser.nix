{pkgs, ...}: {

  home.packages = with pkgs; [
    (chromium.override { enableWideVine = true; })
    tor-browser
  ];

  home.file = {
  ".tor\ project/Tor/torrc".source = ./torrc;
  };
}
