import { CLASS_NAME_MODULE } from "util/consts";

const bluetooth = await Service.import("bluetooth");

const CMD = "blueman-manager";

export const Bluetooth = () =>
  Widget.Button({
    classNames: [CLASS_NAME_MODULE, "bluetooth"],
    tooltipText: Utils.merge(
      [bluetooth.bind("state"), bluetooth.bind("connected_devices")],
      (state, devices) =>
        devices.length > 0
          ? "Connected:" + devices.map((d) => `\n${d.name}`).join()
          : state,
    ),
    onClicked: () =>
      Utils.execAsync(`pkill ${CMD}`).catch(() => Utils.execAsync(CMD)),
    child: Widget.Icon({
      icon: bluetooth
        .bind("state")
        .as((on) => `bluetooth-${on == "on" ? "active" : "disabled"}-symbolic`),
      className: bluetooth.bind("state"),
    }),
  });
