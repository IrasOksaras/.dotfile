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
            ssh_prompts = [
              {
                match = "Enter passphrase for key";
                type = "secret";
                value_type = "static";
                value = "";
              }
              {
                match = "password:";
                type = "secret";
                value_type = "static";
                value = "";
              }
            ];
          };
          offline_mode = {
            enabled = true;
            no_github = true;
          };
        };
      };
    };
  };
}
