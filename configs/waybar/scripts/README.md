# Waybar scripts

## `camera.sh`

Will check every device at `/dev/video*` and assume PipeWire and wireplumber
to be used in the system, and for them to be using the camera in question.
Will return [waybar-compatible JSON](https://man.archlinux.org/man/waybar-custom.5.en#RETURN-TYPE)
with the following values:

| Percent | Class/State |
| ------- | ----------- |
| 0       | `off`       |
| 100     | `on`        |

Using both percent and class to represent the on/off state lets you use it in a
module which both changes its icon depending on the percent and styling on the
class. For example, styling `custom-camera` when it is **on** to have a dark
red background can be done like:

```css
#custom-camera.on {
  background: #ee0000;
}
```

and for it to only show up when **on** you can do e.g. (in `config.jsonc`):

```json
"custom/camera": {
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
