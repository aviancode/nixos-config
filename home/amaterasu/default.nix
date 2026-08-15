{ ... }:

{
  imports = [
    ./git.nix
    ./neovim.nix
  ];

  home = {
    username = "amaterasu";
    homeDirectory = "/home/amaterasu";
    stateVersion = "25.11";

    packages = with pkgs; [
      unzip
    ];
  };

  programs.home-manager.enable = true;
}
