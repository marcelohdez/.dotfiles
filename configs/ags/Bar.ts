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

function StartModules() {
  return Widget.Box({
    className: CLASS_NAME_SECTION,
    children: [PowerMenu(), Clock(), Workspaces()],
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
      IdleInhibitor(),
      SystemTray(),
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
      start_widget: StartModules(),
      center_widget: CenterModules(),
      end_widget: EndModules(),
    }),
  });
}

export default Bar;
