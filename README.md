# marcelo's dotfiles

GNOME + Niri

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

I use the Chrome flatpak, to make this seamless I make a `google-chrome` script in
`/usr/local/bin/` with the following:

```bash
#!/bin/sh
flatpak run com.google.Chrome \
    --password-store=gnome-libsecret \
    --enable-features=TouchpadOverscrollHistoryNavigation "$@"
```

> [!TIP]
> You probably want to add these arguments to a copied .desktop file in
> .local/share/applications as well for launchers
>
> The `password-store` argument makes passwords stay even while not in GNOME, and
> the other is for back/forward gestures on touch pads.

Then, some extras like [hyprlock], [hypridle], [dim], [bemoji], and
[JetBrainsMono Nerd Font] must be installed manually. Additionally, [hyprpicker]
is supported by my color picker script, so if installed it will use that
instead of Niri's built-in.

Run `./init.sh`. Assuming a clean install this should place any files and
scripts where they go. You should log out and log back in to be in `zsh`.

You now have Niri on your login screen along with GNOME and all my
configurations.

## Tips

- Install 'Night Theme Switcher', 'Color Picker' and 'Focus Changer' extensions
  for GNOME
- To make printing life easier (out of GNOME), you may install `cups` and
  `system-config-printer` to graphically manage them. Additional drivers are
  available such as `gutenprint-cups` for e.g. Canon printers, see
  [Printer drivers](https://wiki.archlinux.org/title/CUPS#Printer_drivers)
- Wallpapers are put in `~/Wallpapers/<light|dark>/name.*`. See
  [the script](./localshare/both-modes.d/accent_color.sh).

[hyprlock]: https://github.com/hyprwm/hyprlock
[hypridle]: https://github.com/hyprwm/hypridle
[dim]: https://github.com/marcelohdez/dim
[bemoji]: https://github.com/marty-oehme/bemoji
[JetBrainsMono Nerd Font]: https://github.com/marcelohdez/dim
[hyprpicker]: https://github.com/hyprwm/hyprpicker
