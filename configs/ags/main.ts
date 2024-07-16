import Bar from "./Bar";
import Gdk from "gi://Gdk?version=3.0";
import { idle } from "resource:///com/github/Aylur/ags/utils.js";

const setupWindows = () => {
  const length = Gdk.Display.get_default()?.get_n_monitors() || 1;

  for (let m = 0; m < length; m++) {
    App.addWindow(Bar(m));
  }
};

setupWindows();

idle(async () => {
  const display = Gdk.Display.get_default();

  display?.connect("monitor-added", () =>
    Utils.exec("swaymsg exec ~/.local/share/fn-scripts/reload_bar.sh"),
  );

  display?.connect("monitor-removed", () =>
    Utils.exec("swaymsg exec ~/.local/share/fn-scripts/reload_bar.sh"),
  );
});
