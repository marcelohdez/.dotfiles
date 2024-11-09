import { SPACING_NORMAL } from "util/consts";

export const POWERMENU_NAME = "powermenu";

const ActionButton = (name: string, icon_name: string, exec: string) =>
  Widget.Button({
    className: name,
    tooltipText: name.at(0)?.toUpperCase() + name.substring(1),
    child: Widget.Icon(icon_name),
    onClicked: () => {
      Utils.execAsync(exec);
      App.closeWindow(POWERMENU_NAME); // for non-terminating commands like locking
    },
  });

export const PowerMenu = () =>
  Widget.Window({
    name: POWERMENU_NAME,
    className: POWERMENU_NAME,
    anchor: ["top", "left"],
    keymode: "exclusive",
    setup: (self) => {
      self.keybind("Escape", () => App.closeWindow(POWERMENU_NAME));
    },
    child: Widget.Box({
      className: "list",
      vertical: true,
      spacing: SPACING_NORMAL,
      children: [
        ActionButton("poweroff", "system-shutdown-symbolic", "shutdown -h now"),
        ActionButton("restart", "system-reboot-symbolic", "shutdown -r now"),
        ActionButton(
          "sleep",
          "weather-clear-night-symbolic",
          "systemctl suspend",
        ),
        ActionButton("lock", "system-lock-screen-symbolic", "swaylock"),
      ],
    }),
  });
