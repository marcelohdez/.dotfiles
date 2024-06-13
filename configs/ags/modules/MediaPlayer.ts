const mpris = await Service.import("mpris");

function MediaPlayer() {
  const label = Utils.watch("", mpris, "player-changed", () => {
    if (mpris.players[0]) {
      const { track_title } = mpris.players[0];
      return `${track_title}`;
    } else {
      return "";
    }
  });

  return Widget.Button({
    class_name: "mediaplayer",
    on_primary_click: () => mpris.getPlayer("")?.playPause(),
    on_secondary_click: () => mpris.getPlayer("")?.next(),
    on_middle_click: () => mpris.getPlayer("")?.previous(),
    child: Widget.Label({ label }),
  });
}

export default MediaPlayer();
