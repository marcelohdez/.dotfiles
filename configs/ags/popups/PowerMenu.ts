export const POWERMENU_NAME = "powermenu";

const ActionButton = (name: string, icon_name: string, exec: string) =>
  Widget.Button({
    className: name,
    tooltipText: name.at(0)?.toUpperCase() + name.substring(1),
    child: Widget.Icon(icon_name),
    onClicked: () => Utils.execAsync(exec),
  });

const PowerMenu = () =>
  Widget.Window({
    name: POWERMENU_NAME,
    className: POWERMENU_NAME,
    anchor: ["bottom", "left"],
    child: Widget.Box({
      className: "list",
      vertical: true,
      spacing: 10,
      children: [
        ActionButton(
          "poweroff",
          "system-shutdown-symbolic",
          "systemctl shutdown now",
        ),
        ActionButton("restart", "system-reboot-symbolic", "systemctl reboot"),
        ActionButton(
          "sleep",
          "weather-clear-night-symbolic",
          "systemctl suspend",
        ),
        ActionButton("lock", "system-lock-screen-symbolic", "swaylock"),
      ],
    }),
  });

export default PowerMenu;
