import { CLASS_NAME_MODULE } from "consts";

const bluetooth = await Service.import("bluetooth");

function Bluetooth() {
  return Widget.Button({
    classNames: [CLASS_NAME_MODULE, "bluetooth"],
    tooltipText: bluetooth.bind("connected_devices").as((devices) => {
      let text = "Connected:";
      devices.forEach((device, _i) => (text += `\n${device.name}`));
      return text;
    }),
    onClicked: () => Utils.execAsync("blueman-manager"),
    child: Widget.Icon({
      icon: bluetooth
        .bind("state")
        .as((on) => `bluetooth-${on == "on" ? "active" : "disabled"}-symbolic`),
    }),
  });
}

export default Bluetooth;
