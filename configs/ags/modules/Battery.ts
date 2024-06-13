const battery = await Service.import("battery");

function Battery() {
  const icon = battery.bind("icon_name");

  return Widget.Box({
    class_name: "battery",
    visible: battery.bind("available"),
    children: [
      Widget.Icon({ icon }),
      Widget.Label({
        setup: (self) =>
          self.hook(battery, () => {
            self.label = `${battery.percent}%`;
          }),
      }),
    ],
  });
}

export default Battery();
