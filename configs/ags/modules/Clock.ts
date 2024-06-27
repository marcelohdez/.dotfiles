import { CLASS_NAME_MODULE } from "consts";
import GLib from "gi://GLib?version=2.0";

const FORMAT_CLOCK = "%_I:%M %p %a %h %d";
const date = Variable("", {
  poll: [
    1000,
    () => {
      return (
        GLib.DateTime.new_now_local().format(FORMAT_CLOCK)?.trimStart() || ""
      );
    },
  ],
});

function Clock() {
  return Widget.Button({
    classNames: [CLASS_NAME_MODULE, "clock"],
    onClicked: () => Utils.execAsync("makoctl restore"),
    child: Widget.Label({ label: date.bind() }),
  });
}

export default Clock;
