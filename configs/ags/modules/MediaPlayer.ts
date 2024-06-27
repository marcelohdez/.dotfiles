import { CLASS_NAME_MODULE } from "consts";
import { MprisPlayer } from "types/service/mpris";

const mpris = await Service.import("mpris");

function MediaPlayer() {
  let player: MprisPlayer | undefined = undefined;

  const label = Utils.watch("", mpris, "player-changed", () => {
    return `${player ? player.track_title : ""}`;
  });

  const icon = Utils.watch("", mpris, "player-changed", () => {
    if (!player) return "";

    return player.play_back_status == "Playing"
      ? "media-playback-pause"
      : "media-playback-start";
  });

  const tooltipText = Utils.watch("", mpris, "player-changed", () => {
    if (!player) return "";

    return `${player.track_title}\n${player.track_artists}\n(Playing on ${player.name})`;
  });

  return Widget.Button({
    tooltipMarkup: tooltipText,
    classNames: [CLASS_NAME_MODULE, "mediaplayer"],
    on_primary_click: () => (player ? player.playPause() : {}),
    on_secondary_click: () => (player ? player.next() : {}),
    on_middle_click: () => (player ? player.previous() : {}),
    child: Widget.Box({
      children: [Widget.Icon({ icon }), Widget.Label({ label })],
    }),
    setup: (self) =>
      self.hook(mpris, () => {
        const list = mpris.players;
        player = list.find((p) => p == player);
        if (!player && list.length > 0 && list[0].name != "playerctld")
          player = list[0];
      }),
  });
}

export default MediaPlayer;
