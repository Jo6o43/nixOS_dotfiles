
#!/usr/bin/env bash

set -euo pipefail

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S_%N")
SCREENSHOT="$SCREENSHOT_DIR/Screenshot_$TIMESTAMP.png"

# Selecionar uma região
REGION=$(slurp) || exit 0

# Capturar
grim -g "$REGION" "$SCREENSHOT"

# Copiar para clipboard
wl-copy --type image/png < "$SCREENSHOT"

# Notificação
notify-send \
    -i "$SCREENSHOT" \
    "Screenshot Saved" \
    "Saved and copied to clipboard."
