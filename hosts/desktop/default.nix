{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./filesystems.nix

    # Modules
    ../../modules/system/git.nix             # Git
    ../../modules/system/fonts.nix           # Fonts
    ../../modules/system/greetd.nix          # Login manager
    ../../modules/system/nvidia.nix          # Nvidia drivers
    ../../modules/system/mihomo/mihomo.nix   # Proxy cli
    ../../modules/system/zsh.nix             # Shell
    ../../modules/system/starship.nix        # Prompt
    ../../modules/system/network-manager.nix # Networking
    ../../modules/system/xwayland.nix        # X-server
    ../../modules/system/xwayland-satellite.nix  # X-server satellite
    ../../modules/system/bluetooth.nix       # Bluetooth
    ../../modules/system/fastfetch.nix       # Fetch

    ../../modules/desktop/discord.nix        # Discord
    ../../modules/desktop/niri.nix           # Wayland compositer
    ../../modules/desktop/rofi.nix           # Launcher
    ../../modules/desktop/hyprlock.nix       # Lock screen
    ../../modules/desktop/alacritty.nix      # Terminal emulator
    ../../modules/desktop/yazi.nix           # File manager
  
    ../../modules/programs/steam.nix         # Steam client
    ../../modules/programs/keepassxc.nix     # Pswd manager
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
    shell = pkgs.zsh;
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
