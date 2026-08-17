{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.xdg-desktop-portal
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-gnome
  ];

  
}
