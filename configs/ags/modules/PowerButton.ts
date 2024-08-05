import { CLASS_NAME_MODULE } from "util/consts";
import { PowerMenu, POWERMENU_NAME } from "popups/PowerMenu";

const togglePowerMenu = () => {
  if (App.getWindow(POWERMENU_NAME)) {
    App.removeWindow(POWERMENU_NAME);
  } else {
    App.addWindow(PowerMenu());
  }
};

export const PowerButton = () => {
  return Widget.Button({
    classNames: [CLASS_NAME_MODULE, "powerbutton"],
    child: Widget.Icon({ icon: "system-log-out-symbolic" }),
    tooltipText: "Power menu",
    onPrimaryClick: () => togglePowerMenu(),
  });
};
