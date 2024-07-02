import { CLASS_NAME_MODULE } from "consts";
import Gdk from "types/@girs/gdk-3.0/gdk-3.0";

const PowerMenu = () => {
  const menu = Widget.Menu({
    children: [
      Widget.MenuItem({
        label: "Lock",
        onActivate: () => Utils.execAsync("swaylock"),
      }),
      Widget.MenuItem({
        label: "Sleep",
        onActivate: () => Utils.execAsync("systemctl suspend"),
      }),
      Widget.MenuItem({
        label: "Restart",
        onActivate: () => Utils.execAsync("systemctl reboot"),
      }),
      Widget.MenuItem({
        label: "Power Off",
        onActivate: () => Utils.execAsync("systemctl poweroff"),
      }),
    ],
  });

  return Widget.Button({
    classNames: [CLASS_NAME_MODULE, "powermenu"],
    child: Widget.Icon({ icon: "system-shutdown" }),
    tooltipText: "Power menu",
    onPrimaryClick: (self, event) =>
      menu.popup_at_widget(self, Gdk.Gravity.SOUTH, Gdk.Gravity.NORTH, event),
  });
};

export default PowerMenu;
