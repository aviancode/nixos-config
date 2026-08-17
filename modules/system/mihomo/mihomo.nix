{ config, pkgs, ... }:

{
	#environment.systemPackages = with pkgs; [
	#	mihomo
	#];

	services.mihomo = {
		enable = true;
		tunMode = true;
		configFile = "${./config.yaml}";
	};
}
