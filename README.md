# marcelo's dotfiles

Sway + GNOME shill

## Setup

### _🚧⚠️ Warning ⚠️🚧_

Use at your own risk! This is tailored to my setup and uses on **Fedora**.

---

First, clone this repo into its _permanent_ directory (otherwise stuff will
break) and `cd` into it; then you can install the packages needed (at least,
those available in the Fedora repos):

```bash
sudo dnf install --skip-unavailable $(cat packages.txt)
```

You should now be able to switch to `zsh`:

```bash
chsh -s $(which zsh)
```

Firefox is used throughout this repo. You _can_ just install it regularly but
for the sandboxing and quicker updates I prefer the official Flatpak; then
creating a `firefox` script in e.g. `.local/bin/` containing:

```bash
#!/bin/sh
flatpak run org.mozilla.firefox -- "$@"
```

Then, [dim], [NerdFont] (symbols only), and [hyprpicker] must be installed
manually.

Run `./init.sh`. Assuming a clean install this should place config files and
scripts where they go. You should log out and log back in to be in `zsh`.

You may now run `sway` or setup a login screen like [greetd] with [tuigreet].

## Tips

- You can install `xdg-user-dirs` and run `xdg-user-dirs-update`, creating
  the Downloads, Pictures, etc. folders for you.
- I noticed missing font problems in Firefox after a Fedora Minimal
  install, installing these additonal packages helped:
  `adobe-source-sans-pro-fonts gnu-free-sans-fonts google-noto-sans*
unifont-fonts`
- To make printing life easier, you may install `cups` and
  `system-config-printer` to graphically manage them. Additional drivers are
  available such as `gutenprint-cups` for e.g. Canon printers, see
  [Printer drivers](https://wiki.archlinux.org/title/CUPS#Printer_drivers)
- For cursor theme to apply to all apps even in Flatpak, copy it from
  `/usr/share` to `~/.icons/default` and allow all flatpaks to see that as `:ro`
  e.g.:

  ```bash
  cp -r /usr/share/icons/breeze_cursors ~/.icons/default
  ```

- You can symlink `foot` as `xdg-terminal-exec` so that glib apps (e.g.
  Thunar) open it when needing a terminal:

  ```bash
  sudo ln -s /bin/foot /bin/xdg-terminal-exec
  ```

- Wallpapers are put in `~/Wallpapers/<light|dark>/name.png`. See
  [the script](./localshare/both-modes.d/accent_color.sh).

## Credits

| Usage                     | Project name                             |
| ------------------------- | ---------------------------------------- |
| Window manager            | [sway]                                   |
| Status bar                | [waybar]                                 |
| Terminal                  | [foot]                                   |
| Screenshot Markup         | [swappy]                                 |
| Auto dark mode (optional) | [darkman]                                |
| Night light               | [gammastep]                              |
| Auto-suspending           | [swayidle]                               |
| Lockscreen                | [swaylock]                               |
| Screen dimmer             | [dim]                                    |
| Notifications             | [dunst]                                  |
| App menu                  | [fuzzel]                                 |
| Emoji                     | [wofi-emoji] (use `fuzzel -d` in script) |
| Text editing/coding       | [neovim]                                 |
| Screen/Keyboard backlight | [brightnessctl]                          |
| File manager              | [nautilus]                               |

[hyprpicker]: https://github.com/hyprwm/hyprpicker
[NerdFont]: https://www.nerdfonts.com/font-downloads
[greetd]: https://wiki.archlinux.org/title/Greetd
[tuigreet]: https://github.com/apognu/tuigreet
[sway]: https://swaywm.org/
[waybar]: https://github.com/Alexays/Waybar
[swappy]: https://github.com/jtheoof/swappy
[foot]: https://codeberg.org/dnkl/foot
[darkman]: https://gitlab.com/whynothugo/darkman
[gammastep]: https://gitlab.com/chinstrap/gammastep
[swayidle]: https://github.com/swaywm/swayidle
[dim]: https://github.com/marcelohdez/dim
[swaylock]: https://github.com/swaywm/swaylock
[dunst]: https://dunst-project.org/
[fuzzel]: https://codeberg.org/dnkl/fuzzel
[wofi-emoji]: https://github.com/Zeioth/wofi-emoji
[neovim]: https://neovim.io/
[brightnessctl]: https://github.com/Hummer12007/brightnessctl
[nautilus]: https://gitlab.gnome.org/GNOME/nautilus
