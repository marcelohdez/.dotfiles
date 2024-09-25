import { CLASS_NAME_SECTION } from "util/consts";
import { Battery } from "modules/Battery";
import { Bluetooth } from "modules/Bluetooth";
import { Clock } from "modules/Clock";
import { Mpris } from "modules/Mpris";
import { Network } from "modules/Network";
import { PowerButton } from "modules/PowerButton";
import { SystemTray } from "modules/SystemTray";
import { Volume } from "modules/Volume";
import { Workspaces } from "modules/Workspaces";

export const getBarName = (monitor = 0) => `bar${monitor}`;

const StartModules = (monitor = 0) =>
  Widget.Box({
    className: CLASS_NAME_SECTION,
    children: [PowerButton(), Workspaces(monitor)],
  });

const CenterModules = () =>
  Widget.Box({
    className: CLASS_NAME_SECTION,
    child: Mpris(),
  });

const EndModules = () =>
  Widget.Box({
    className: CLASS_NAME_SECTION,
    hpack: "end",
    children: [
      SystemTray(),
      Battery(),
      Volume(),
      Bluetooth(),
      Network(),
      Clock(),
    ],
  });

export const Bar = (monitor: number) =>
  Widget.Window({
    className: "bar",
    monitor,
    name: getBarName(monitor),
    exclusivity: "exclusive",
    anchor: ["bottom", "left", "right"],
    child: Widget.CenterBox({
      start_widget: StartModules(monitor),
      center_widget: CenterModules(),
      end_widget: EndModules(),
    }),
  });
