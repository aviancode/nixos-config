{ pkgs, ... }:

{
	progras.starship = {
		enableZshIntergation = true;

		settings = {
			format = "$directory$git_branch$character";

			directory = {
				style = "bold";
				truncation_length = 3;
				truncate_to_repo = false;
			};

			git_branch = {
				format = " [$branch]($style)";
				style = "bold";
			};

			character = {
				success_symbol = "[>](bold)";
				error_symbol = "[>](bold)";
			};
		};
	};
}
