import Gdk from "gi://Gdk?version=3.0";
import { idle } from "resource:///com/github/Aylur/ags/utils.js";
import { Bar, getBarName } from "windows/Bar";

const setupWindows = () => {
  const length = Gdk.Display.get_default()?.get_n_monitors() || 1;

  for (let m = 0; m < length; m++) {
    if (!App.getWindow(getBarName(m))) App.addWindow(Bar(m));
  }
};

setupWindows();

idle(async () => {
  const display = Gdk.Display.get_default();

  display?.connect("monitor-added", () => setupWindows());
  display?.connect("monitor-removed", () => setupWindows());
});
