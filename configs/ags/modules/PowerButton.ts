import { CLASS_NAME_MODULE } from "consts";
import PowerMenu, { POWERMENU_NAME } from "popups/PowerMenu";

const togglePowerMenu = () => {
  if (App.getWindow(POWERMENU_NAME)) {
    App.removeWindow(POWERMENU_NAME);
  } else {
    App.addWindow(PowerMenu());
  }
};

const PowerButton = () => {
  return Widget.Button({
    classNames: [CLASS_NAME_MODULE, "powermenu"],
    child: Widget.Icon({ icon: "system-log-out-symbolic" }),
    tooltipText: "Power menu",
    onPrimaryClick: () => togglePowerMenu(),
  });
};

export default PowerButton;
