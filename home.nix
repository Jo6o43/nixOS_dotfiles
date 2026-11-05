
{ ... }:

{
  imports = [
	./modules/mako.nix
	./modules/clipboard.nix
  	./modules/rofi.nix 
 ];

  home.username = "jo6o";
  home.homeDirectory = "/home/jo6o";
  home.stateVersion = "26.05";

  xdg.configFile."hypr" = {
    source = ./desktop/hypr;
    recursive = true;
  };

  xdg.configFile."waybar" = {
    source = ./desktop/waybar;
    recursive = true;
  };
}
