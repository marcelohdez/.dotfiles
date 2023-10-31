# marcelo's dotfiles

### _🚧⚠️Work in progress⚠️🚧_

Use at your own risk! This is tailored to my setup and uses.

## Setup

**First, make sure you have `stow` and any other projects/packages
mentioned below installed!**

If `~/.config` and `~/.local/share/` have not been set up, the init
scripts fail, they can be made by getting `xdg-utils` and running
`xdg-user-dirs-update`.

Then, `cd` into the root of this repo and run `./init.sh`

**Wallpapers** are put in `~/.walls/<variant>/img/`; (`<variant>`
can be _light_ or _dark_). A `accent.css` file needs to be in the
`<variant>` folder with a single color defined as _accent_ which
will be used by waybar's `style.css` to set pill colors. _To
add more wallpapers this structure must be used... or stuff
will break._

## Main projects used

_this list is non-exhaustive_

| Usage                       | Project name       |
| --------------------------- | ------------------ |
| Window manager              | [sway]             |
| Bar                         | [waybar]           |
| Terminal                    | [foot]             |
| Wallpaper Daemon            | [swww]             |
| Day/night theme switcher    | [darkman]          |
| Night light (no blue light) | [gammastep]        |
| Auto-suspending             | [swayidle]         |
| Screen locking              | [swaylock-effects] |
| Notifications               | [mako]             |
| App launching               | [wofi]             |
| Emoji                       | [wofi-emoji]       |
| Text editing/coding         | [neovim]           |
| Screen/Keyboard backlight   | [brightnessctl]    |

Other packages used include `ttf-jetbrains-mono-nerd ttf-font-awesome`
for Waybar, `grim slurp swappy` for screenshots, `blueman-git` from
the AUR to be able to hide the tray icon _(in View > Plugins >
StatusNotifierItem)_, and `gnome-keyring networkmanager`.

[sway]: https://swaywm.org/
[waybar]: https://github.com/Alexays/Waybar
[foot]: https://codeberg.org/dnkl/foot
[swww]: https://github.com/Horus645/swww
[darkman]: https://gitlab.com/whynothugo/darkman
[gammastep]: https://gitlab.com/chinstrap/gammastep
[swayidle]: https://github.com/swaywm/swayidle
[swaylock-effects]: https://github.com/mortie/swaylock-effects
[mako]: https://github.com/emersion/mako
[wofi]: https://hg.sr.ht/~scoopta/wofi
[wofi-emoji]: https://github.com/Zeioth/wofi-emoji
[neovim]: https://neovim.io/
[brightnessctl]: https://github.com/Hummer12007/brightnessctl
