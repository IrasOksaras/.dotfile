{pkgs, ...}: {

  home.packages = with pkgs; [
    tor-browser
  ];

  programs.chromium = {
    enable = true;
    package = pkgs.chromium.override { enableWideVine = true; };
  };

  home.file = {
  ".tor\ project/Tor/torrc".source = ./torrc;
  };
}
