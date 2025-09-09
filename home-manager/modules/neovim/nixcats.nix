{ inputs, ... }: let
  utils = inputs.nixCats.utils;
in { 
  imports = [
    inputs.nixCats.homeModule
  ];
  config = {
    nixCats = {
      enable = true;
    };
  };
}
