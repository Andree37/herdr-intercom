#!/bin/sh
# The pane: ic watch, or a note on how to install it.
export PATH="$HOME/go/bin:$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"
if ! command -v ic >/dev/null 2>&1; then
    echo "ic is not installed:"
    echo "  go install github.com/Andree37/intercom/cmd/ic@latest && ic install claude"
elif ic watch; then
    exit 0
fi
printf '\npress enter to close '
read -r _
