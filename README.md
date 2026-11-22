# herdr-intercom

A [herdr](https://herdr.dev) plugin for [intercom](https://github.com/Andree37/intercom): one key opens a
live view of every agent session, their state, and every message between them and you. Pick a session
and type to message it; read your own mail; jump to an agent's pane.

## Install

```sh
go install github.com/Andree37/intercom/cmd/ic@latest && ic install claude
herdr plugin install Andree37/herdr-intercom
```

Bind keys in `~/.config/herdr/config.toml`:

```toml
[[keys.command]]
key = "prefix+i"
type = "plugin_action"
command = "andree37.intercom.open"        # popup over everything
description = "intercom"

[[keys.command]]
key = "prefix+shift+i"
type = "plugin_action"
command = "andree37.intercom.open-side"   # split beside the focused pane
description = "intercom beside this pane"
```

Keys in the pane: `↑ ↓` pick · `enter` message · `a` ask and wait · `i` read your inbox ·
`f` jump to its pane · `?` help · `q` close.
