{ config, lib, pkgs, ... }:

{
  imports = [
	./hardware-configuration.nix
	./modules/fonts.nix
	./modules/hyprland.nix
	./modules/qt.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Lisbon";
  i18n.defaultLocale = "en_GB.UTF-8";

  hardware.graphics.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
	enable = true;
	alsa.enable = true;
	pulse.enable = true;
  };

  users.users.jo6o = {
	isNormalUser = true;
	extraGroups = [
		"wheel"
		"networkmanager"
		"video"
		];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
	git
	nano
	wget
	curl
	pciutils
	tree

	grim
	slurp
	wl-clipboard
	cliphist	
	pavucontrol
	brightnessctl
	playerctl
	kitty
	waybar
	wofi
	awww
	hyprpolkitagent
	kdePackages.dolphin
	kdePackages.qtsvg
	kdePackages.kio-extras

	brave
	vscode
	discord
	neovim
	spotify
	tailscale
  ];

  nix.settings.experimental-features = [
	"nix-command"
	"flakes"
  ];

  services.xserver.videoDrivers = [
	"modesetting"
	"nvidia"
  ];

  hardware.nvidia = {
	modesetting.enable = true;

  	open = true;

	package = config.boot.kernelPackages.nvidiaPackages.stable;

	nvidiaSettings = true;

	prime = {
	  offload = {
		enable = true;
	  	enableOffloadCmd = true;
	  };
	

	intelBusId = "PCI:0:2:0";
	nvidiaBusId = "PCI:1:0:0";
	};
  };

  environment.shellAliases = { 
	hypr = "uwsm start hyprland-uwsm.desktop";
  };


  system.stateVersion = "26.05";
}

