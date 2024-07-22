import { CLASS_NAME_MODULE } from "consts";

const audio = await Service.import("audio");

const BIN = "pavucontrol";

const changeVolume = (amount: number) =>
  Utils.exec(["sh", "-c", `~/.local/share/fn-scripts/vol_change.sh ${amount}`]);

const toggleMute = () => {
  audio.speaker.is_muted = !audio.speaker.is_muted;
  changeVolume(0);
};

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
  const icon = Widget.Icon({
    icon: getIcon(),
  });

  return Widget.Button({
    classNames: [CLASS_NAME_MODULE, "volume"],
    onClicked: () =>
      Utils.execAsync(`pkill ${BIN}`).catch(() =>
        Utils.execAsync(`${BIN} -t 3`),
      ),
    onSecondaryClick: () => toggleMute(),
    onScrollUp: () => changeVolume(5),
    onScrollDown: () => changeVolume(-5),
    setup: (self) =>
      self.hook(audio.speaker, () => {
        const speaker = audio.speaker;

        icon.icon = getIcon();
        self.toggleClassName("muted", speaker.is_muted || false);

        const value = speaker.volume * 100;
        self.tooltip_text = `${speaker.description}\n${value.toFixed(0)}%`;
      }),
    child: Widget.Box({
      child: icon,
    }),
  });
};

export default Volume;
