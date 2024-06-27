import { CLASS_NAME_CONTAINER, CLASS_NAME_MODULE } from "consts";
import sway from "services/sway";

const switchTo = (ws) => sway.msg(`workspace ${ws}`);

const Workspaces = (monitor = 0) =>
  Widget.Box({
    classNames: [CLASS_NAME_MODULE, CLASS_NAME_CONTAINER, "workspaces"],
    tooltipText: "Workspaces",
    children: Array.from({ length: 10 }, (_, i) => i + 1).map((i) =>
      Widget.Button({
        attribute: i,
        label: `${i}`,
        onClicked: () => switchTo(i),
      }),
    ),
    setup: (self) =>
      self.hook(sway, () => {
        const currentOutput: string = sway.monitors[monitor + 1]["name"];

        self.children.forEach((btn) => {
          const ws = sway.workspaces.find(
            (ws, _i) => ws["num"] === btn.attribute,
          );

          btn.visible = ws != undefined && ws["output"] === currentOutput;
          btn.toggleClassName(
            "active",
            ws != undefined && sway.active.workspace["id"] === ws["id"],
          );
          btn.toggleClassName("urgent", ws != undefined && ws["urgent"]);
        });
      }),
  });

export default Workspaces;
