# Waybar scripts

## `mediaplayer.py`
*Modified from the [script with the same name](https://github.com/Alexays/Waybar/blob/master/resources/custom_modules/mediaplayer.py) in the waybar repo.*

Requires `playerctl` installed, only works with [MPRIS]-compatible players.

Returns [waybar-compatible json] with the values of:

| Percent | State   | Text                  |
| ------- | ------- | --------------------- |
| 0       | None    | `Nothing is playing.` |
| 50      | Paused  | *song name*           |
| 100     | Playing | *song name*           |

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

## `microphone.sh`
Using PipeWire with pulseaudio support, will return [waybar-compatible json] with
the following values depending on whether an input device is running or not:

| Percent | Class/State |
| ------- | ----------- |
| 0       | `off`       |
| 100     | `on`        |

Using both percent and class to represent the on/off state lets you use it in a module
which both changes its icon depending on the percent and styling on the class. For example,
styling `custom-microphone` when it is **on** to have a dark red background can be done
like:
```css
#custom-microphone.on {
  background: #ee0000;
}
```
and for it to only show up when **on** you can do e.g. (in `config.jsonc`):
```json
"custom/microphone": {
  "format": "{icon}",
  "format-icons": [
    "",
    "ON"
  ],
  "return-type": "json",
  "interval": 2
  "exec": "$PATH_TO_SCRIPT"
}
```


[MPRIS]: https://wiki.archlinux.org/title/MPRIS
[waybar-compatible JSON]: https://man.archlinux.org/man/waybar-custom.5.en#RETURN-TYPE
