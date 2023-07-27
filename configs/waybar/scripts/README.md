# Waybar scripts

## `mediaplayer.py`
*Modified from the [script with the same name](https://github.com/Alexays/Waybar/blob/master/resources/custom_modules/mediaplayer.py) in the waybar repo.*

Requires `playerctl` installed, only works with [MPRIS]-compatible players.

Returns waybar-compatible JSON with the values of:

| Value | State   | Text                  |
| ----- | ------- | --------------------- |
| 0     | None    | `Nothing is playing.` |
| 50    | Paused  | *song name*           |
| 100   | Playing | *song name*           |

Which lets you set custom icons depending on the state in a custom Waybar module like so:
```json
"custom/media": {
    "format": "{icon} {}",
    "format-icons": [
      "NOTHING",
      "PAUSED",
      "PLAYING"
    ],
    "escape": true,
    "return-type": "json",
    "max-length": 40,
    "on-click": "playerctl play-pause",
    "exec": "$PATH_TO_SCRIPT 2> /dev/null"
}
```

[MPRIS]: https://wiki.archlinux.org/title/MPRIS
