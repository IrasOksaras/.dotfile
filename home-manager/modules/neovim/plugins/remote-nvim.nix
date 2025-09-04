{
  programs.nixvim = {
    plugins = {
      remote-nvim = {
        enable = true;
        settings = {
          ssh_config = {
            ssh_binary = "ssh";
            scp_binary = "scp";
            ssh_config_file_paths = [ "$HOME/.ssh/config" ];
            ssh_prompts = {
              match = "Enter passphrese for key";
              type = "secret";
              value_type = "static";
              value = "";
            };
          };
        };
      };
    };
  };
}
