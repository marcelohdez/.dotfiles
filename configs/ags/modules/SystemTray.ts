import { CLASS_NAME_CONTAINER, CLASS_NAME_MODULE } from "util/consts";

const systemtray = await Service.import("systemtray");

export const SystemTray = () => {
  const items = systemtray.bind("items").as((items) =>
    items.map((item) =>
      Widget.Button({
        child: Widget.Icon({ icon: item.bind("icon") }),
        on_primary_click: (_, e) => item.activate(e),
        on_secondary_click: (_, e) => item.openMenu(e),
        tooltip_markup: item.bind("tooltip_markup"),
      }),
    ),
  );

  return Widget.Box({
    classNames: [CLASS_NAME_MODULE, CLASS_NAME_CONTAINER, "tray"],
    children: items,
  });
};
