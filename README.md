# marcelo's dotfiles

Wayland shill... using Fedora + Sway

## Setup

### _🚧⚠️ Warning ⚠️🚧_

Use at your own risk! This is tailored to my setup and uses. I use **Fedora**.

---

First, clone this repo into its _permanent_ directory (otherwise symlinks will
break) and `cd` into it.

Then install the packages needed (at least, those available in the Fedora
repos):

```bash
sudo dnf install $(<packages.txt)
```

`pip` is one of the packages installed above, so you can install `autotiling`
through it (for automatic dwindle layout in Sway):

```bash
pip install autotiling
```

Then, [matugen], [hyprpicker], the [NerdFont] (symbols only),
[swaylock-effects], and [swww] must be installed manually (swaylock-effects'
copr is broken for me at the time of writing, inverting the screenshots and
other quirks).

Finally, run `./init.sh`. Assuming a clean install this should place config
files and scripts where they go (this will **not** override existing configs).

- **Tip**: You can install `xdg-user-dirs` to run `xdg-user-dirs-update`,
  creating the Downloads, Pictures, etc. folders for you and setting their
  `$XDG_*` environment variables.
- **Tip**: I noticed missing font problems in Firefox upon a Fedora Minimal
  install, and it seems that installing these additonal packages fixed it?
  `adobe-source-sans-pro-fonts gnu-free-sans-fonts google-noto-sans*`
- **Tip**: Wallpapers are put in `~/Wallpapers/<light|dark>`

## Credits

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

[hyprpicker]: https://github.com/hyprwm/hyprpicker
[NerdFont]: https://www.nerdfonts.com/font-downloads
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
