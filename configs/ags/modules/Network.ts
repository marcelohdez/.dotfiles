import { CLASS_NAME_MODULE } from "consts";

const network = await Service.import("network");

function WifiIndicator() {
  return Widget.Icon({
    icon: network.wifi.bind("icon_name"),
  });
}

function WiredIndicator() {
  return Widget.Icon({
    icon: network.wired.bind("icon_name"),
  });
}

function Network() {
  return Widget.Button({
    classNames: [CLASS_NAME_MODULE, "network"],
    tooltipText: network.wifi.bind("ssid").as((ssid) => ssid || "Unknown"),
    onClicked: () => Utils.execAsync("foot --title=wifi nmtui"),
    child: Widget.Stack({
      children: { wifi: WifiIndicator(), wired: WiredIndicator() },
      shown: network.bind("primary").as((p) => p || "wifi"),
    }),
  });
}

export default Network;
