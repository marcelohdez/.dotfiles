import sway from "services/sway";

const switchTo = (num) => sway.msg(`workspace ${num}`);

const Workspaces = () =>
  Widget.EventBox({
    child: Widget.Box({
      children: Array.from({ length: 10 }, (_, i) => i + 1).map((i) =>
        Widget.Button({
          attribute: i,
          label: `${i}`,
          onClicked: () => switchTo(i),
        }),
      ),
      setup: (self) =>
        self.hook(sway, () =>
          self.children.forEach((btn) => {
            btn.visible = sway.workspaces.some((ws) => ws.id === btn.attribute);
          }),
        ),
    }),
  });

export default Workspaces();
