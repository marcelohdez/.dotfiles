const network = await Service.import("network");

function WifiIndicator() {
  return Widget.Icon({
    icon: network.wifi.bind("icon_name"),
    tooltipText: network.wifi.bind("ssid").as((ssid) => ssid || "Unknown"),
  });
}

function WiredIndicator() {
  return Widget.Icon({
    icon: network.wired.bind("icon_name"),
  });
}

function Network() {
  return Widget.Stack({
    children: { wifi: WifiIndicator(), wired: WiredIndicator() },
    shown: network.bind("primary").as((p) => p || "wifi"),
  });
}

export default Network();
