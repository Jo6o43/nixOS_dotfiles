
{ pkgs, ... }:

{
  home.packages = [
    pkgs.rofi
  ];

  xdg.configFile."rofi/config.rasi".source =
    ../desktop/rofi/config.rasi;
}
