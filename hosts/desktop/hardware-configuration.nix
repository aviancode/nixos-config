{ lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "ahci" "nvme" "sd_mod" "uas" "usb_storage" "usbhid" "xhci_pci"
  ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  hardware.enableRedistributableFirmware = lib.mkDefault true;
}
