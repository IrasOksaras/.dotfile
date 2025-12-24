{ pkgs, ... }: {
  programs = {
    k9s = {
      enable = true;
    };
    kubecolor = {
      enable = true;
      enableAlias = true;
    };
    awscli = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    google-cloud-sdk
    kdash
    kubectl
    terraform
  ];
}
