import Bar from "./Bar";
import Gdk from "gi://Gdk?version=3.0";
import Gtk from "gi://Gtk?version=3.0";
import { idle } from "resource:///com/github/Aylur/ags/utils.js";

// setup config
function perMonitor(widget: (monitor: number) => Gtk.Window) {
  const length = Gdk.Display.get_default()?.get_n_monitors() || 1;
  return Array.from({ length }, (_, i) => i).map(widget);
}

App.config({
  windows: () => perMonitor(Bar),
});

idle(async () => {
  const display = Gdk.Display.get_default();

  display?.connect("monitor-added", () =>
    Utils.exec("swaymsg exec ~/.local/share/fn-scripts/reload_bar.sh"),
  );

  display?.connect("monitor-removed", () =>
    Utils.exec("swaymsg exec ~/.local/share/fn-scripts/reload_bar.sh"),
  );
});
