
#!/usr/bin/env bash

set -o pipefail

SELECTION=$(
    cliphist list |
        rofi -dmenu -i -no-custom \
            -display-columns 2 \
            -p "Clipboard History" \
            -theme-str 'window { width: 760px; } listview { lines: 10; }'
) || exit 0

[[ -n "$SELECTION" ]] || exit 0

printf '%s\n' "$SELECTION" |
    cliphist decode |
    wl-copy
