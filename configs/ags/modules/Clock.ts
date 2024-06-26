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

const MODE_NAME = "dnd";
const dndMode = Variable(false);

export const update_dnd = (output?: string) => {
  if (!output) output = Utils.exec("makoctl mode");

  dndMode.setValue(output?.match(MODE_NAME) != null);
};

const Clock = () => {
  return Widget.Button({
    classNames: [CLASS_NAME_MODULE, "clock"],
    onPrimaryClick: () => Utils.execAsync("makoctl restore"),
    onSecondaryClick: () =>
      Utils.execAsync(`makoctl mode -t ${MODE_NAME}`).then(update_dnd),
    child: Widget.Box({
      children: [
        Widget.Label({ label: date.bind() }),
        Widget.Icon({
          className: dndMode
            .bind()
            .as((active) => (active ? "dnd-active" : "dnd")),
          visible: dndMode.bind(),
          icon: "weather-clear-night-symbolic",
          setup: () => update_dnd(),
        }),
      ],
    }),
  });
};

Object.assign(globalThis, { update_dnd });
export default Clock;
