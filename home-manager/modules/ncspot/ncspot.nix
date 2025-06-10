{pkgs, ...}: {

  programs.ncspot = {
    enable = true;
    settings = {
      use_nerdfont = true;
      flip_status_indicators = true;
      volnorm = false;
      volnorm_pregain = 12.5;
      theme = {
        # background = "#222436";
        primary = "#C8D3F5";
        secondary = "#828BB8";
        title = "#82AAFF";
        playing = "#FFC777";
        playing_selected = "#FFB16C";
        playing_bg = "#191B29";
        highlight = "#FF966C";
        highlight_bg = "#2F334D";
        error = "#FF757F";
        error_bg = "#222436";
        statusbar = "#C099FF";
        statusbar_progress = "#FFC777";
        statusbar_bg = "#1E2030";
        cmdline = "#C8D3F5";
        cmdline_bg = "#1E2030";
      };
    };
  };
}
