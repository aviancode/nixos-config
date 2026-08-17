{ pkgs, ... }:

{
	programs.yazi = {
		enableBashIntegration = true;

		package = pkgs.yazi;
	};
}
