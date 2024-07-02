import { CLASS_NAME_MODULE } from "consts";

const battery = await Service.import("battery");
const ppd = await Service.import("powerprofiles");

/**
 * Battery module with power-profiles switch support on secondary-click
 */
const Battery = () =>
  Widget.Button({
    onSecondaryClickRelease: () => {
      let new_profile = "balanced";
      if (ppd.active_profile != "power-saver") {
        new_profile = "power-saver";
      }

      ppd.set_property("active_profile", new_profile);
    },
    visible: battery.bind("available"),
    tooltipText: ppd.bind("active_profile"),
    classNames: battery
      .bind("charging")
      .as((state) => [
        CLASS_NAME_MODULE,
        "battery",
        "battery-power-saver",
        state ? "battery-charging" : "",
      ]),
    child: Widget.Box({
      children: [
        Widget.Icon({
          icon: battery.bind("icon_name"),
        }),
        Widget.Label({
          label: battery.bind("percent").as((p) => `${p}%`),
        }),
      ],
    }),
  });

export default Battery;
