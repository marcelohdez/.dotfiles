import { CLASS_NAME_MODULE } from "consts";

const CLASS_NAME = "idleinhibitor";
const inhibited = Variable(false);
let firstRun = true;

function toggle() {
  Utils.execAsync("matcha -t -b waybar").then((output) => {
    const enabled = output.match("Enabled");
    inhibited.setValue(enabled != null);

    if (firstRun) {
      firstRun = false;
      toggle();
    }
  });
}

/**
 * Requires [matcha](https://codeberg.org/QuincePie/matcha) to be installed
 */
function IdleInhibitor() {
  const icon = inhibited
    .bind()
    .as((state) =>
      state ? "system-lock-screen-symbolic" : "weather-clear-night-symbolic",
    );
  const tooltipText = inhibited.bind().as((state) => {
    const verb = state ? "cannot" : "can";
    return `System ${verb} sleep.`;
  });

  return Widget.Button({
    tooltipText,
    classNames: inhibited
      .bind()
      .as((state) => [CLASS_NAME_MODULE, CLASS_NAME, `${CLASS_NAME}-${state}`]),
    onClicked: () => toggle(),
    setup: () => toggle(),
    child: Widget.Icon({ icon }),
  });
}

export default IdleInhibitor;
