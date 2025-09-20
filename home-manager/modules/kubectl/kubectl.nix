{ pkgs, ... }: {
  home.packages = [
    pkgs.kubectl
  ];

  programs = {
    kubecolor = {
      enable = true;
      enableAlias = true;
    };
  };
}
