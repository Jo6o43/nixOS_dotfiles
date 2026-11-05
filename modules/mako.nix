
{ pkgs, ... }:

{
  services.mako = {
    enable = true;

    settings = {
      # Posição
      anchor = "top-right";
      layer = "overlay";

      # Aparência
      font = "JetBrainsMono Nerd Font 10";

      background-color = "#1e1e2eee";
      text-color = "#ffffffff";
      border-color = "#7aa2f7ff";

      border-size = 2;
      border-radius = 8;

      # Dimensões
      width = 320;
      height = 120;
      margin = 12;
      padding = 12;

      # Comportamento
      default-timeout = 5000;
      max-visible = 4;
      icons = true;
    };
  };

  home.packages = with pkgs; [
    libnotify
  ];
}
