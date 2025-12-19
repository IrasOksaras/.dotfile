{ ... }: {
  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "*" = {
          forwardAgent = true;
          serverAliveInterval = 0;
          serverAliveCountMax = 3;
          compression = true;
          addKeysToAgent = "yes";
          hashKnownHosts = false;
          userKnownHostsFile = "~/.ssh/known_hosts";
          controlMaster = "no";
          controlPath = "~/.ssh/master-%r@%n:%p";
          controlPersist = "no";
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
