# marcelo's dotfiles

Sway shill

## Setup

### _🚧⚠️ Warning ⚠️🚧_

Use at your own risk! This is tailored to my setup and uses on **Fedora**.

---

First, clone this repo into its _permanent_ directory (otherwise stuff will
break) and `cd` into it; then you can install the packages needed (at least,
those available in the Fedora repos):

```bash
sudo dnf install $(cat packages.txt)
```

You should now be able to switch to `zsh` and install `autotiling`:

```bash
chsh -s $(which zsh)
pip install autotiling
```

Firefox is used throughout this repo. You _can_ just install it regularly but
for the sandboxing and quicker updates I prefer the official Flatpak; then
creating a `firefox` script in e.g. `.local/bin/` containing:

```bash
#!/bin/sh
flatpak run org.mozilla.firefox -- $@
```

Then, [hyprpicker], [NerdFont] (symbols only), [swaylock-effects], and [swww]
must be installed manually.

For theme files to be put in place, the `theme <light|dark>` command must be
run at least once, these dots also support [`darkman`] through the systemd
service.

Finally, run `./init.sh`. Assuming a clean install this should place config
files and scripts where they go (this will **not** override existing configs).

## Tips

- You can install `xdg-user-dirs` and run `xdg-user-dirs-update`, creating
  the Downloads, Pictures, etc. folders for you.
- I noticed missing font problems in Firefox after a Fedora Minimal
  install, installing these additonal packages helped:
  `adobe-source-sans-pro-fonts gnu-free-sans-fonts google-noto-sans*
unifont-fonts`
- You can symlink `foot` as `xdg-terminal-exec` so that glib apps (e.g.
  Thunar) open foot when needing a terminal:

  ```bash
  sudo ln -s /bin/foot /bin/xdg-terminal-exec
  ```

- Wallpapers are put in `~/Wallpapers/<light|dark>`

## Credits

| Usage                       | Project name                             |
| --------------------------- | ---------------------------------------- |
| Window manager              | [sway]                                   |
| Bar                         | [waybar]                                 |
| Terminal                    | [foot]                                   |
| Wallpaper Daemon            | [swww]                                   |
| Day/night theme switcher    | [darkman]                                |
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
[gammastep]: https://gitlab.com/chinstrap/gammastep
[swayidle]: https://github.com/swaywm/swayidle
[swaylock-effects]: https://github.com/mortie/swaylock-effects
[mako]: https://github.com/emersion/mako
[fuzzel]: https://codeberg.org/dnkl/fuzzel
[wofi-emoji]: https://github.com/Zeioth/wofi-emoji
[neovim]: https://neovim.io/
[brightnessctl]: https://github.com/Hummer12007/brightnessctl
[thunar]: https://gitlab.xfce.org/xfce/thunar
