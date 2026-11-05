
{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gcc
    gnumake
    unzip
    tree-sitter
    ripgrep
    fd
    nodejs
  ];

  xdg.configFile."nvim/init.lua".source =
    ../desktop/nvim/init.lua;

  xdg.configFile."nvim/lua" = {
    source = ../desktop/nvim/lua;
    recursive = true;
  };

  xdg.configFile."nvim/.stylua.toml".source = ../desktop/nvim/.stylua.toml;
  home.activation.initNvChadLock = lib.hm.dag.entryAfter [ "writeBoundary" ] '' lockfile="$HOME/.config/nvim/lazy-lock.json"

      if [ ! -e "$lockfile" ]; then
        ${pkgs.coreutils}/bin/mkdir -p "$HOME/.config/nvim"
        ${pkgs.coreutils}/bin/install -m 0644 \
          ${../desktop/nvim/lazy-lock.json} "$lockfile"
      fi
    '';
}

