import { CLASS_NAME_MODULE } from "consts";

const network = await Service.import("network");

const WifiIndicator = () =>
  Widget.Icon({
    icon: network.wifi.bind("icon_name"),
    tooltipText: network.wifi.bind("ssid").as((ssid) => ssid || "Unknown"),
  });

const WiredIndicator = () =>
  Widget.Icon({
    icon: network.wired.bind("icon_name"),
    tooltipText: network.wired.bind("speed").as((speed) => {
      if (speed < 1000) return `${speed} Megabit`;
      return `${speed / 1000} Gigabit`;
    }),
  });

const Network = () =>
  Widget.Button({
    classNames: [CLASS_NAME_MODULE, "network"],
    onClicked: () => Utils.execAsync("foot --title=wifi nmtui"),
    child: Widget.Stack({
      className: network.bind("connectivity"),
      children: { wifi: WifiIndicator(), wired: WiredIndicator() },
      shown: network.bind("primary").as((p) => p || "wifi"),
    }),
  });

export default Network;
