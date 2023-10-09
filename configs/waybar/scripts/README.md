# Waybar scripts

### `mediaplayer.py`

_Modified from the [script with the same name](https://github.com/Alexays/Waybar/blob/master/resources/custom_modules/mediaplayer.py)
in the waybar repo._

Requires `playerctl` **installed**, only works with [MPRIS]-compatible players.

Returns [waybar-compatible json] with the values of:

| Percent | Class     | Text        |
| ------- | --------- | ----------- |
| 0       | None      | `No media`  |
| 50      | `Paused`  | _song name_ |
| 100     | `Playing` | _song name_ |

You may notice that while the original script would set the `class` value to
the player name, I made it instead return the player status, which lets you
style your module accordingly:

```
#custom-media {
  background-color: black;
}

#custom-media.Paused {
  background-color: red;
}

#custom-media.Playing {
  background-color: blue;
}
```

The percent values let you set custom icons depending on the player status in
your module like so:

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
    "max-length": 32,
    "on-click": "playerctl play-pause",
    "exec": "$PATH_TO_SCRIPT 2> /dev/null"
}
```

## Privacy scripts

The following scripts will return [waybar-compatible JSON] with the following
values:

| Percent | Class/State |
| ------- | ----------- |
| 0       | `off`       |
| 100     | `on`        |

Using both percent and class to represent the on/off state lets you use it in a
module which both changes its icon depending on the percent and styling on the
class. For example, styling `custom-microphone` when it is **on** to have a dark
red background can be done like:

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

### `microphone.sh`

Uses PipeWire with pulseaudio (`pactl`) support.

### `screenshare.sh`

These dotfiles use the `exec_before` and `exec_after` config keys in `xdg-desktop-portal-wlr`
(and Hyprland's) to create a temporary file which this script will check for.

### `camera.sh`

**NOT READY FOR WIDE USAGE**
Will check every device at `/dev/video*` and assume PipeWire and
wireplumber to be used in the system, and for them to be using the
camera in question.

[MPRIS]: https://wiki.archlinux.org/title/MPRIS
[waybar-compatible JSON]: https://man.archlinux.org/man/waybar-custom.5.en#RETURN-TYPE
[Hyprland]: https://hyprland.org/
