import GLib from "gi://GLib?version=2.0";

const FORMAT_CLOCK = "%_I:%M %p %a %h %d";
function Clock() {
  return Widget.Label({
    className: "clock",
    label: GLib.DateTime.new_now_local().format(FORMAT_CLOCK),
    setup: (self) =>
      self.poll(1000, (label) => {
        label.label =
          GLib.DateTime.new_now_local().format(FORMAT_CLOCK) || "err";
      }),
  });
}

export default Clock();
