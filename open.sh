#!/bin/sh
# Keys can only target actions, so each action opens the pane it names.
herdr="${HERDR_BIN_PATH:-herdr}"
if [ "$1" = side ]; then
    exec "$herdr" plugin pane open --plugin andree37.intercom --entrypoint side \
        --placement split --direction right --target-pane "$HERDR_PANE_ID" --focus
fi

open_popup() { "$herdr" plugin pane open --plugin andree37.intercom --entrypoint popup 2>&1; }

# herdr keeps one popup per session. One left open in another space stays
# hidden there and blocks this one, so close it and open again here.
out=$(open_popup)
case "$out" in
*ui_busy*)
    printf '{"id":"intercom","method":"popup.close","params":{}}\n' |
        nc -U -w 1 "${HERDR_SOCKET_PATH:-$HOME/.config/herdr/herdr.sock}" >/dev/null 2>&1
    sleep 0.2
    out=$(open_popup)
    ;;
esac
echo "$out"
case "$out" in *'"error"'*) exit 1 ;; esac
