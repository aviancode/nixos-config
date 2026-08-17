{ config, pkgs, ... }:

{
	programs.waybar = {
		enable = true;

		settings = {
			mainBar = {
				layer = "top";
				position = "top";

				margin-top = 10;
				margin-left = 10;
				margin-right = 10;

				modules-left = [
					"niri/workspaces"
				];

				modules-center = [
					"clock"
				];

				clock = {
					format = "{:%H:%M}";
					tooltip-format = "{:%A, %d %B %Y}";
				};
			};
		};

		style = ''
			window#waybar {
				background: transparent;
			}

			box {
				background: #${config.lib.stylix.colors.base00};
				border-radius: 10px;
			}
		'';
	};

	stylix.targets.waybar = {
		enable = true;
		addCss = false;
	};
}
