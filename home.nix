{ config, pkgs, ... }:

{
	gtk =
	{
		colorScheme = "dark";
		enable = true;

		font =
		{
			name = "Adwaita Sans";
			package = pkgs.adwaita-fonts;
			size = 11;
		};

		iconTheme =
		{
			name = "Papirus-Dark";
			package = pkgs.papirus-icon-theme;
		};
	};

	home =
	{
		stateVersion = "26.05";

		file =
		{
			".config/foot".source = ./config/foot;
			".config/fuzzel".source = ./config/fuzzel;
			".config/hypr".source = ./config/hypr;
			".config/quickshell".source = ./config/quickshell;
			".config/waybar".source = ./config/waybar;
			".vimrc".source = ./config/.vimrc;
		};

		pointerCursor =
		{
			enable = true;
			gtk.enable = true;
			name = "Bibata-Modern-Ice";
			package = pkgs.bibata-cursors;
			size = 24;
			x11.enable = true;
		};
	};

	programs =
	{
		librewolf =
		{
			enable = true;

			policies =
			{
				DisplayBookmarksToolbar = "never";
				Homepage.StartPage = "none";
				NewTabPage = false;
				PictureInPicture.Enabled = false;
				SanitizeOnShutdown = true;
			};
		};
	};

	services =
	{
		hyprpolkitagent.enable = true;
		hyprsunset.enable = true;
	};

	xdg.userDirs =
	{
		createDirectories = true;
		enable = true;
	};
}
