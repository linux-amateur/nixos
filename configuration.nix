{ config, pkgs, ... }:

let
	home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz";
	username = "test";
in
{
	boot =
	{
		kernelPackages = pkgs.linuxPackages_latest;

		loader =
		{
			efi.canTouchEfiVariables = true;
			systemd-boot.enable = true;
			timeout = 0;
		};
	};

	console.keyMap = "fr";
	
	environment.systemPackages = with pkgs;
	[
		brightnessctl
		fastfetch
		foot
		fuzzel
		gcc
		git
		gnumake
		hyprlock
		hyprpicker
		hyprshot
		libreoffice
		loupe
		mousepad
		nautilus
		swaybg
		tree
		vim
		waybar
	];

	fonts.packages = with pkgs;
	[
		nerd-fonts.jetbrains-mono
	];

	home-manager.users.${username} = import ./home.nix;
	i18n.defaultLocale = "en_US.UTF-8";

	imports =
	[
		./hardware-configuration.nix
		(import "${home-manager}/nixos")
	];

	networking =
	{
		hostName = "nixos";
		networkmanager.enable = true;
		wireless.enable = true;
	};

	programs =
	{
		virt-manager.enable = true;

		bash =
		{
			promptInit =
			''
				if [[ $(id --user) == "0" ]]; then
					PS1='\[\e[01;31m\]\h\[\e[01;34m\] \w \$\[\e[00m\] '
				else
					PS1='\[\e[01;32m\]\u@\h\[\e[01;34m\] \w \$\[\e[00m\] '
				fi
			'';

			shellAliases =
			{
				ned = "sudo vim /etc/nixos";
				nrs = "sudo nixos-rebuild switch";
			};

			shellInit =
			''
				uwsm check may-start && exec uwsm start hyprland.desktop &>/dev/null
			'';
		};

		hyprland =
		{
			enable = true;
			withUWSM = true;
		};
	};

	services =
	{
		gvfs.enable = true;
		udisks2.enable = true;

		pipewire =
		{
			enable = true;
			pulse.enable = true;
		};
	};

	system.stateVersion = "26.05";
	time.timeZone = "Europe/Paris";

	users.users.${username} =
	{
		extraGroups = [ "libvirtd" "wheel" ];
		isNormalUser = true;
	};

	virtualisation.libvirtd =
	{
		enable = true;
		qemu.swtpm.enable = true;
	};
}
