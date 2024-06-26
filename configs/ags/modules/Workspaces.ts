import { CLASS_NAME_MODULE } from "consts";
import sway from "services/sway";

const switchTo = (ws) => sway.msg(`workspace ${ws}`);

const Workspaces = () =>
  Widget.EventBox({
    classNames: [CLASS_NAME_MODULE, "workspaces"],
    tooltipText: "Workspaces",
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
            const ws = sway.workspaces.find(
              (ws, _i) => ws["num"] === btn.attribute,
            );

            btn.visible = ws != undefined;
            btn.toggleClassName(
              "active",
              ws != undefined && sway.active.workspace["id"] === ws["id"],
            );
          }),
        ),
    }),
  });

export default Workspaces;
