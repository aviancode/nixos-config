{ pkgs, ... }:

{
	programs.alacritty = {
		enable = true;

		settings = {
			window = {
				padding = { x = 10; y = 10; };

				dynamic_padding = false;
				decorations = "Full";
			};
		};
	};

	stylix.targets.alacritty.enable = true;
}
