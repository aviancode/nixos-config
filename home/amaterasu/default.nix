{ inputs, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./neovim.nix

    # Home modules
    ./system/stylix.nix
    ./system/mihomo/mihomo.nix
    ./system/zsh.nix

    ./desktop/alacritty.nix
    ./desktop/waybar.nix
    ./desktop/niri/niri.nix
    ./desktop/zen.nix
    ./desktop/yazi.nix
    
    inputs.niri.homeModules.niri
    inputs.stylix.homeModules.stylix
  ];

  home = {
    username = "amaterasu";
    homeDirectory = "/home/amaterasu";
    stateVersion = "25.11";

    packages = with pkgs; [
      unzip
      jq
    ];
  };

  xdg.configFile."niri/config.kdl".text =
    builtins.readFile ./desktop/niri/config.kdl;

  programs.home-manager.enable = true;
}
