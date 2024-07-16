import { CLASS_NAME_SECTION } from "consts";
import Battery from "modules/Battery";
import Bluetooth from "modules/Bluetooth";
import Clock from "modules/Clock";
import Mpris from "modules/Mpris";
import Network from "modules/Network";
import PowerMenu from "modules/PowerMenu";
import SystemTray from "modules/SystemTray";
import Volume from "modules/Volume";
import Workspaces from "modules/Workspaces";

const StartModules = (monitor = 0) =>
  Widget.Box({
    className: CLASS_NAME_SECTION,
    children: [PowerMenu(), Clock(), Workspaces(monitor)],
  });

const EndModules = () =>
  Widget.Box({
    className: CLASS_NAME_SECTION,
    hpack: "end",
    children: [
      SystemTray(),
      Mpris(),
      Battery(),
      Volume(),
      Bluetooth(),
      Network(),
    ],
  });

const Bar = (monitor = 0) =>
  Widget.Window({
    className: "bar",
    monitor,
    name: `bar${monitor}`,
    exclusivity: "exclusive",
    anchor: ["bottom", "left", "right"],
    child: Widget.CenterBox({
      start_widget: StartModules(monitor),
      end_widget: EndModules(),
    }),
  });

export default Bar;
