{pkgs, ...}: {

  home.packages = with pkgs; [
    tor-browser
  ];

  home.file = {
  ".tor\ project/Tor/torrc".source = ./torrc;
  };
}
