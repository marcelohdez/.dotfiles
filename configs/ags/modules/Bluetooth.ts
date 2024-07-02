import { CLASS_NAME_MODULE } from "consts";

const bluetooth = await Service.import("bluetooth");

const CMD = "blueman-manager";

const Bluetooth = () =>
  Widget.Button({
    classNames: [CLASS_NAME_MODULE, "bluetooth"],
    tooltipText: bluetooth.bind("connected_devices").as((devices) => {
      if (devices.length > 0)
        return "Connected:" + devices.map((d) => `\n${d.name}`).join();

      return "Online";
    }),
    onClicked: () =>
      Utils.execAsync(`pkill ${CMD}`).catch(() => Utils.execAsync(CMD)),
    child: Widget.Icon({
      icon: bluetooth
        .bind("state")
        .as((on) => `bluetooth-${on == "on" ? "active" : "disabled"}-symbolic`),
      className: bluetooth.bind("state"),
    }),
  });

export default Bluetooth;
