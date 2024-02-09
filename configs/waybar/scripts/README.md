# Waybar scripts

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
  "interval": 3
  "exec": "$PATH_TO_SCRIPT"
}
```

### `camera.sh`

Will check every device at `/dev/video*` and assume PipeWire and wireplumber
to be used in the system, and for them to be using the camera in question.

## Deprecated

While still in use, these scripts will be removed when a release containing
[waybar #2612] is published.

### `microphone.sh`

Uses PipeWire with pulseaudio (`pactl`) support.

### `screenshare.sh`

These dotfiles use the `exec_before` and `exec_after` config keys in
`xdg-desktop-portal-wlr` (and Hyprland's) to create a temporary file which
this script will check for.

[waybar-compatible JSON]: https://man.archlinux.org/man/waybar-custom.5.en#RETURN-TYPE
[waybar #2612]: (https://github.com/Alexays/Waybar/pull/2612)
