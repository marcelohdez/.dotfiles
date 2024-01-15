# marcelo's dotfiles

### _🚧⚠️Work in progress⚠️🚧_

Use at your own risk! This is tailored to my setup and uses.

## Setup

_First, make sure you have all projects mentioned below installed!_

Then, `cd` into the root of this repo and run `./init.sh`. Finally,
let darkman run at least once to put all theme files in place.

**Wallpapers** are put in `~/Wallpapers/<variant>/`; (`<variant>`
can be _light_ or _dark_).

## Main projects used

_this list is non-exhaustive_

| Usage                       | Project name                             |
| --------------------------- | ---------------------------------------- |
| Window manager              | [sway]                                   |
| Bar                         | [waybar]                                 |
| Terminal                    | [foot]                                   |
| Wallpaper Daemon            | [swww]                                   |
| Day/night theme switcher    | [darkman]                                |
| Color generator             | [matugen]                                |
| Night light (no blue light) | [gammastep]                              |
| Auto-suspending             | [swayidle]                               |
| Screen locking              | [swaylock-effects]                       |
| Notifications               | [mako]                                   |
| App launching (+dmenu)      | [fuzzel]                                 |
| Emoji                       | [wofi-emoji] (using `fuzzel -d` instead) |
| Text editing/coding         | [neovim]                                 |
| Screen/Keyboard backlight   | [brightnessctl]                          |
| File manager                | [thunar]                                 |

Other packages used include font awesome, jetbrains mono, cascadia code, and
Nerd Fonts (Symbols Only), either of which should be patched with nerd icons.
grim, slurp, and swappy for screenshot regions/editing. NetworkManager,
inotify-tools, autotiling, gnome-themes-extra, gnome-keyring,
polkit-gnome-authenticating-agent.

[sway]: https://swaywm.org/
[waybar]: https://github.com/Alexays/Waybar
[foot]: https://codeberg.org/dnkl/foot
[swww]: https://github.com/Horus645/swww
[darkman]: https://gitlab.com/whynothugo/darkman
[matugen]: https://github.com/inioX/matugen
[gammastep]: https://gitlab.com/chinstrap/gammastep
[swayidle]: https://github.com/swaywm/swayidle
[swaylock-effects]: https://github.com/mortie/swaylock-effects
[mako]: https://github.com/emersion/mako
[fuzzel]: https://codeberg.org/dnkl/fuzzel
[wofi-emoji]: https://github.com/Zeioth/wofi-emoji
[neovim]: https://neovim.io/
[brightnessctl]: https://github.com/Hummer12007/brightnessctl
[thunar]: https://gitlab.xfce.org/xfce/thunar
