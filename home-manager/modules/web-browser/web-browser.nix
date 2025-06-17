{pkgs, ...}: {

  home.packages = with pkgs; [
    tor-browser
  ];

  programs.chromium = {
    enable = true;
    package = pkgs.chromium.override { enableWideVine = true; };
    commandLineArgs = [
      # waylandSupport
      "--ozone-platform-hint=auto"
      "--enable-wayland-ime"
      # vlukanSupport
      # ジェスチャーでの操作の有効化
      #タブスクロールを有効化
      "--enable-features=TouchpadOverscrollHistoryNavigation,ScrollableTabStrip:minTabWidth/54,VaapiVideoDecodeLinuxGL,VaapiVideoEncoder,Vulkan,VulkanFromANGLE,DefaultANGLEVulkan,VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport,UseMultiPlaneFormatForHardwareVideo"
    ];
  };

  home.file = {
  ".tor\ project/Tor/torrc".source = ./torrc;
  };
}
