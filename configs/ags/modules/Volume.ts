const audio = await Service.import("audio");

function Volume() {
  function getIcon() {
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
  }

  const icon = Widget.Icon({
    setup: (self) =>
      self.hook(audio.speaker, () => {
        self.icon = getIcon();
      }),
  });

  return Widget.Box({
    className: "volume",
    children: [
      icon,
      Widget.Label({
        setup: (self) =>
          self.hook(audio.speaker, () => {
            const value = Math.round(audio.speaker.volume * 100) || 0;
            self.label = audio.speaker.is_muted ? "" : `${value}%`;
          }),
      }),
    ],
  });
}

export default Volume();
