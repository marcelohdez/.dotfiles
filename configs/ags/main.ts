import Gdk from "gi://Gdk?version=3.0";
import { idle } from "resource:///com/github/Aylur/ags/utils.js";
import { Bar, getBarName } from "windows/Bar";

const length = Gdk.Display.get_default()?.get_n_monitors() || 1;
for (let m = 0; m < length; m++) {
  if (!App.getWindow(getBarName(m))) App.addWindow(Bar(m));
}

idle(async () => {
  const display = Gdk.Display.get_default();
  const reloadBar = () =>
    Utils.exec("swaymsg exec ~/.local/share/fn-scripts/reload_bar.sh");

  display?.connect("monitor-added", () => reloadBar());
  display?.connect("monitor-removed", () => reloadBar());
});
