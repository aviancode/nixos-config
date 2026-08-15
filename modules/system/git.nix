{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    setting = {
      init.defaultBranch = "main";
    };
  };
}