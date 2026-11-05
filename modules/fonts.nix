
{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
	noto-fonts
	noto-fonts-cjk-sans
	noto-fonts-color-emoji
	nerd-fonts.jetbrains-mono
	nerd-fonts.fira-code
	font-awesome
    ];

    fontconfig.defaultFonts = {
	sansSerif = [ "Noto Sans" ];
	serif = [ "Noto Serif" ];
	monospace = [ "JetBrainsMono Nerd Font" ];
	emoji = [ "Noto Color Emoji" ];
    };
  };
}
