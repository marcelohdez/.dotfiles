import { CLASS_NAME_MODULE } from "util/consts";
import GLib from "gi://GLib?version=2.0";

const FORMAT_CLOCK = "%_I:%M  %a  %h  %d";
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

export const Clock = () => {
  return Widget.Button({
    cursor: "pointer",
    classNames: [CLASS_NAME_MODULE, "clock"],
    onPrimaryClick: () => Utils.execAsync("makoctl restore"),
    onSecondaryClick: () =>
      Utils.execAsync(`makoctl mode -t ${MODE_NAME}`).then(update_dnd),
    child: Widget.Box({
      children: [
        Widget.Icon({
          className: dndMode
            .bind()
            .as((active) => (active ? "dnd-active" : "dnd")),
          visible: dndMode.bind(),
          icon: "weather-clear-night-symbolic",
          setup: () => update_dnd(),
        }),
        Widget.Label({ label: date.bind() }),
      ],
    }),
  });
};

Object.assign(globalThis, { update_dnd });
