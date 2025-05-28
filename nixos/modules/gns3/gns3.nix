{ inputs, config, lib, pkgs, ... }: {

  services.gns3-server = {
    enable = true;
    vpcs.enable = true;
    ubridge.enable = true;
    dynamips.enable = true;
    auth.user = "Iras";
  };

  environment.systemPackages = with pkgs; [
    gns3-gui
  ];
}
