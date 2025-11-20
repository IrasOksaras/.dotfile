{pkgs, ...}: {

  home.packages = with pkgs; [
    tor-browser
  ];

  programs.firefox = {
    enable = true;
  };

  # programs.chromium = {
  #   enable = true;
  #   package = pkgs.chromium.override { enableWideVine = true; };
  #   commandLineArgs = [
  #     # waylandSupport
  #     "--ozone-platform-hint=auto"
  #     "--enable-wayland-ime"
  #     # vlukanSupport
  #     # ジェスチャーでの操作の有効化
  #     #タブスクロールを有効化
  #     "--enable-features=TouchpadOverscrollHistoryNavigation,ScrollableTabStrip:minTabWidth/54,VaapiVideoDecodeLinuxGL,VaapiVideoEncoder,Vulkan,VulkanFromANGLE,DefaultANGLEVulkan,VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport,UseMultiPlaneFormatForHardwareVideo"
  #   ];
  # };

  home.file = {
    torrc = {
      source = ./torrc;
      target = ".tor\ project/Tor/torrc";
    };
  };
}
