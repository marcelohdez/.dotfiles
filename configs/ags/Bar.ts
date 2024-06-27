import { CLASS_NAME_SECTION } from "consts";
import Battery from "modules/Battery";
import Bluetooth from "modules/Bluetooth";
import Clock from "modules/Clock";
import IdleInhibitor from "modules/IdleInhibitor";
import MediaPlayer from "modules/MediaPlayer";
import Network from "modules/Network";
import PowerMenu from "modules/PowerMenu";
import SystemTray from "modules/SystemTray";
import Volume from "modules/Volume";
import Workspaces from "modules/Workspaces";
import Gdk from "types/@girs/gdk-3.0/gdk-3.0";

function StartModules(monitor = 0) {
  return Widget.Box({
    className: CLASS_NAME_SECTION,
    children: [PowerMenu(), Clock(), Workspaces(monitor)],
  });
}

function CenterModules() {
  return Widget.Box({
    className: CLASS_NAME_SECTION,
    children: [MediaPlayer()],
  });
}

function EndModules() {
  return Widget.Box({
    className: CLASS_NAME_SECTION,
    hpack: "end",
    children: [
      SystemTray(),
      IdleInhibitor(),
      Battery(),
      Volume(),
      Bluetooth(),
      Network(),
    ],
  });
}

function Bar(monitor = 0) {
  return Widget.Window({
    className: "bar",
    monitor,
    name: `bar${monitor}`,
    exclusivity: "exclusive",
    anchor: ["top", "left", "right"],
    child: Widget.CenterBox({
      start_widget: StartModules(monitor),
      center_widget: CenterModules(),
      end_widget: EndModules(),
    }),
  });
}

export default Bar;
