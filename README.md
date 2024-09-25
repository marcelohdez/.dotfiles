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

You should now be able to switch to `zsh`:

```bash
chsh -s $(which zsh)
```

Brave is used by default. I prefer the Flatpak then creating a `brave-browser`
script in e.g. `.local/bin/` containing:

```bash
#!/bin/sh
flatpak run com.brave.Browser \
  --enable-features=TouchpadOverscrollHistoryNavigation "$@"
```

Then, [dim], [NerdFont] (symbols only), [ags], [satty], and [hyprpicker] must
be installed manually.

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

- Wallpapers are put in `~/Wallpapers/<light|dark>/img-[color].png`, the
  optional [color] suffix can be used for a specific accent color to be used
  with the given wallpaper. See
  [the script](./localshare/both-modes.d/accent_color.sh).

## Credits

| Usage                     | Project name                           |
| ------------------------- | -------------------------------------- |
| Window manager            | [sway]                                 |
| Shell                     | [ags]                                  |
| Screenshot Markup         | [satty]                                |
| Terminal                  | [foot]                                 |
| Auto dark mode (optional) | [darkman]                              |
| Night light               | [gammastep]                            |
| Auto-suspending           | [swayidle]                             |
| Screen dimmer             | [dim]                                  |
| Screen locker             | [swaylock]                             |
| Notifications             | [mako]                                 |
| App launching             | [fuzzel]                               |
| Emoji                     | [wofi-emoji] (use `fuzzel -d` instead) |
| Text editing/coding       | [neovim]                               |
| Screen/Keyboard backlight | [brightnessctl]                        |
| File manager              | [ranger] or [nemo]                     |

[hyprpicker]: https://github.com/hyprwm/hyprpicker
[NerdFont]: https://www.nerdfonts.com/font-downloads
[greetd]: https://wiki.archlinux.org/title/Greetd
[tuigreet]: https://github.com/apognu/tuigreet
[sway]: https://swaywm.org/
[ags]: https://github.com/Aylur/ags
[satty]: https://github.com/gabm/satty
[foot]: https://codeberg.org/dnkl/foot
[darkman]: https://gitlab.com/whynothugo/darkman
[gammastep]: https://gitlab.com/chinstrap/gammastep
[swayidle]: https://github.com/swaywm/swayidle
[dim]: https://github.com/marcelohdez/dim
[swaylock]: https://github.com/swaywm/swaylock
[mako]: https://github.com/emersion/mako
[fuzzel]: https://codeberg.org/dnkl/fuzzel
[wofi-emoji]: https://github.com/Zeioth/wofi-emoji
[neovim]: https://ranger.fm/
[brightnessctl]: https://github.com/Hummer12007/brightnessctl
[ranger]: https://github.com/linuxmint/nemo
[nemo]: https://github.com/linuxmint/nemo
