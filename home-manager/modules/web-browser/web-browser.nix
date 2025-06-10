{pkgs, ...}: {

  home.packages = with pkgs; [
    tor-browser
  ];

  programs.chromium = {
    enable = true;
    package = pkgs.chromium.override { enableWideVine = true; };
    commandLineArgs = [
      # vlukanSupport
      "--enable-features=VaapiVideoDecodeLinuxGL,VaapiVideoEncoder,Vulkan,VulkanFromANGLE,DefaultANGLEVulkan,VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport,UseMultiPlaneFormatForHardwareVideo"
      # waylandSupport
      "--ozone-platform-hint=auto"
      # ジェスチャーでの操作の有効化
      "--enable-features=TouchpadOverscrollHistoryNavigation"
    ];
  };

  home.file = {
  ".tor\ project/Tor/torrc".source = ./torrc;
  };
}
