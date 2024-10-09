import { CLASS_NAME_MODULE } from "util/consts";

const network = await Service.import("network");

const WifiIndicator = () =>
  Widget.Icon({
    icon: network.wifi.bind("icon_name"),
  });

const WiredIndicator = () =>
  Widget.Icon({
    icon: network.wired.bind("icon_name"),
  });

export const Network = () =>
  Widget.Button({
    cursor: "pointer",
    classNames: [CLASS_NAME_MODULE, "network"],
    onClicked: () =>
      Utils.execAsync("foot --title=wifi sh -c 'sleep 0.1; nmtui'"),
    child: Widget.Stack({
      className: network.bind("connectivity"),
      children: { wifi: WifiIndicator(), wired: WiredIndicator() },
      shown: network.bind("primary").as((p) => p || "wifi"),
    }),
    setup: (self) =>
      self.hook(network, () => {
        const ssid = network.wifi.ssid;
        self.tooltip_text = ssid ? `${ssid}` : `Unknown`;
      }),
  });
