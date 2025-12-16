{ inputs, pkgs, ... }: {

  programs.ghostty = {
    enable = true;
    package = inputs.ghostty.packages.${pkgs.system}.default;
    systemd.enable = true;
    enableZshIntegration = true;
    # installVimSyntax = true;
    installBatSyntax = true;
    settings = {
      font-family = "HackGen Console NF";
      font-size = 13;
      theme = "TokyoNight Moon";
      window-decoration = "none";
      window-padding-x = 6;
      window-padding-y = 6;
      window-padding-balance = true;
      shell-integration-features = "no-cursor";
      cursor-style = "block";
      cursor-style-blink = false;
      quick-terminal-position = "top";
      quick-terminal-keyboard-interactivity = "exclusive";
      keybind = [
        "global:super+f12=toggle_quick_terminal"
      ];
    };
  };
}
