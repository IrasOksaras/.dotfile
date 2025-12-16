{ ... }: {
  programs = {
    ssh = {
      enable = true;
      matchBlocks = {
        "*" = {
          forwardAgent = true;
          compression = true;
          addKeysToAgent = "yes";
        };
      };
    };
  };

  services = {
    ssh-agent = {
      enable = true;
    };
  };
}
