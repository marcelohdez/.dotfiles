import { CLASS_NAME_MODULE } from "consts";

const audio = await Service.import("audio");

const CMD = "pavucontrol";

const getIcon = () => {
  const icons = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  };

  const idx = audio.speaker.is_muted
    ? 0
    : [101, 67, 34, 1, 0].find((t) => t <= audio.speaker.volume * 100)!;

  return `audio-volume-${icons[idx]}-symbolic`;
};

const Volume = () => {
  const label = Widget.Label();
  const icon = Widget.Icon({
    icon: getIcon(),
  });

  return Widget.Button({
    classNames: [CLASS_NAME_MODULE, "volume"],
    tooltipText: audio.bind("speaker").as((speaker) => speaker.description!),
    onClicked: () =>
      Utils.execAsync(`pkill ${CMD}`).catch(() => Utils.execAsync(CMD)),
    onSecondaryClick: () => (audio.speaker.is_muted = !audio.speaker.is_muted),
    setup: (self) =>
      self.hook(audio.speaker, () => {
        icon.icon = getIcon();
        const value = Math.round(audio.speaker.volume * 100) || 0;
        label.label = audio.speaker.is_muted ? "" : `${value}%`;
        self.toggleClassName("muted", audio.speaker.is_muted || false);
      }),
    child: Widget.Box({
      children: [icon, label],
    }),
  });
};

export default Volume;
