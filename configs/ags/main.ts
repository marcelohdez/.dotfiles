import Bar from "./Bar";
import Gdk from "gi://Gdk?version=3.0";
import Gtk from "gi://Gtk?version=3.0";

// setup config
function perMonitor(widget: (monitor: number) => Gtk.Window) {
  const length = Gdk.Display.get_default()?.get_n_monitors() || 1;
  return Array.from({ length }, (_, i) => i).map(widget);
}

App.config({
  windows: () => [...perMonitor(Bar)],
});
