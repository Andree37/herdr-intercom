#!/bin/sh
# Keys can only target actions, so each action opens the pane it names.
herdr="${HERDR_BIN_PATH:-herdr}"
if [ "$1" = side ]; then
    exec "$herdr" plugin pane open --plugin andree37.intercom --entrypoint side \
        --placement split --direction right --target-pane "$HERDR_PANE_ID" --focus
fi
exec "$herdr" plugin pane open --plugin andree37.intercom --entrypoint popup
