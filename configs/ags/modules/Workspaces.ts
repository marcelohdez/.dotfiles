import { CLASS_NAME_CONTAINER, CLASS_NAME_MODULE } from "util/consts";
import sway from "services/sway";

const switchTo = (ws: number) => sway.msg(`workspace ${ws}`);
const MAX_WS = 10;

export const NewWorkspace = () =>
  Widget.Button({
    label: "+",
    visible: sway.bind("workspaces").as((list) => {
      if (list.length > MAX_WS) return false;

      const active = list.find(
        (ws, _i) => ws["id"] === sway.active.workspace["id"],
      )!;

      const nodes: object[] = active["nodes"];
      const floating: object[] = active["floating_nodes"];
      return nodes.length + floating.length > 0;
    }),
    onClicked: () =>
      Utils.execAsync("sh -c ~/.config/sway/scripts/new_workspace.sh"),
  });

export const Workspaces = (monitor: number) => {
  const btnList = Array.from({ length: MAX_WS }, (_, i) => i + 1).map((i) =>
    Widget.Button({
      attribute: i,
      label: `${i}`,
      onClicked: () => switchTo(i),
    }),
  );

  return Widget.Box({
    classNames: [CLASS_NAME_MODULE, CLASS_NAME_CONTAINER, "workspaces"],
    tooltipText: "Workspaces",
    children: [...btnList, NewWorkspace()],
    setup: (self) =>
      self.hook(sway, () => {
        if (sway.monitors.length <= monitor + 1) return;

        const currentOutput: string = sway.monitors[monitor + 1]["name"];

        btnList.forEach((btn) => {
          const ws = sway.workspaces.find(
            (ws, _i) => ws["num"] === btn.attribute,
          );

          btn.visible = ws != undefined && ws["output"] === currentOutput;
          btn.toggleClassName("urgent", ws != undefined && ws["urgent"]);

          btn.toggleClassName(
            "active",
            ws != undefined && sway.active.workspace["id"] === ws["id"],
          );
        });
      }),
  });
};
