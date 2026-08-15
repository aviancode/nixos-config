{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./filesystems.nix

    # Modules
    ../../modules/system/git.nix          # Git
    ../../modules/system/fonts.nix        # Fonts

    ../../modules/desktop/niri.nix        # Wayland compositer
    ../../modules/desktop/waybar.nix      # Bar
    ../../modules/desktop/rofi.nix        # Launcher
    ../../modules/desktop/mako.nix        # Notify
    ../../modules/desktop/awww.nix        # Wallpaper
    ../../modules/desktop/hyprlock.nix    # Lock screen
    ../../modules/desktop/alacritty.nix   # Terminal emulator

  ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "desktop";

  users.users.amaterasu = {
    isNormalUser = true;
    description = "amaterasu";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "docker"
      ];
    shell = pkgs.bashInteractive;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "home-manager-backup";
    extraSpecialArgs = { inherit inputs; };
    users.amaterasu = import ../../home/amaterasu;
  };

  system.stateVersion = "25.11";
}
