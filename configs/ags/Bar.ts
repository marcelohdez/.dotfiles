import Battery from "modules/Battery";
import Bluetooth from "modules/Bluetooth";
import Clock from "modules/Clock";
import MediaPlayer from "modules/MediaPlayer";
import Network from "modules/Network";
import Notifications from "modules/Notifications";
import SystemTray from "modules/SystemTray";
import Volume from "modules/Volume";

function StartModules() {
  return Widget.Box({
    spacing: 8,
    children: [Clock, Notifications],
  });
}

function CenterModules() {
  return Widget.Box({
    spacing: 8,
    children: [MediaPlayer],
  });
}

function EndModules() {
  return Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [SystemTray, Battery, Volume, Bluetooth, Network],
  });
}

function Bar(monitor = 0) {
  return Widget.Window({
    monitor,
    name: `bar${monitor}`,
    exclusivity: "exclusive",
    anchor: ["top", "left", "right"],
    child: Widget.CenterBox({
      start_widget: StartModules(),
      center_widget: CenterModules(),
      end_widget: EndModules(),
    }),
  });
}

export default Bar;
