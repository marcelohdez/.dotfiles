import { CLASS_NAME_MODULE, SPACING_NORMAL } from "util/consts";

const battery = await Service.import("battery");
const ppd = await Service.import("powerprofiles");

const showWattage = Variable(false);

/**
 * Battery module with power-profiles switch support on secondary-click
 */
export const Battery = () =>
  Widget.EventBox({
    onPrimaryClickRelease: () => showWattage.setValue(!showWattage.getValue()),
    onSecondaryClickRelease: () => {
      let new_profile = "balanced";
      if (ppd.active_profile != "power-saver") {
        new_profile = "power-saver";
      }

      ppd.set_property("active_profile", new_profile);
    },
    child: Widget.Button({
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
        spacing: SPACING_NORMAL,
        children: [
          Widget.Label({
            label: Utils.merge(
              [
                showWattage.bind(),
                battery.bind("percent"),
                battery.bind("energy_rate"),
              ],
              (show, percent, rate) =>
                show ? `${percent}%  ${rate.toFixed(1)}W` : `${percent}%`,
            ),
          }),
          Widget.Icon({
            icon: battery.bind("icon_name"),
          }),
        ],
      }),
    }),
  });
