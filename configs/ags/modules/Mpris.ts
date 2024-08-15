import { CLASS_NAME_MODULE, SPACING_NORMAL } from "util/consts";
import { MediaList, MEDIALIST_NAME } from "popups/MediaList";
import { MyUtils } from "util/utils";
import { EllipsizeMode } from "types/@girs/pango-1.0/pango-1.0.cjs";
const mpris = await Service.import("mpris");

const toggleMediaList = () => {
  if (App.getWindow(MEDIALIST_NAME)) {
    App.removeWindow(MEDIALIST_NAME);
  } else {
    App.addWindow(MediaList());
  }
};

export const Mpris = () => {
  const PLAYING_ICON = "folder-music-symbolic";
  const PAUSED_ICON = "go-up-symbolic";

  const playing_icon = Widget.Icon({ icon: PLAYING_ICON });
  const paused_icon = Widget.Icon({ icon: PAUSED_ICON });
  const label = Widget.Label({
    ellipsize: EllipsizeMode.END,
    maxWidthChars: 30,
  });

  const stack = Widget.Stack({
    children: {
      playing: Widget.Box({ spacing: SPACING_NORMAL }, playing_icon, label),
      paused: paused_icon,
    },
  });

  return Widget.Button({
    visible: mpris.bind("players").as((players) => players.length > 0),
    classNames: [CLASS_NAME_MODULE, "mpris"],
    onPrimaryClick: () => toggleMediaList(),
    onSecondaryClick: () => MyUtils.sortPlayers(mpris.players).shift()?.next(),
    onMiddleClick: () => MyUtils.sortPlayers(mpris.players).shift()?.previous(),
    child: stack,
    setup: (self) =>
      self.hook(mpris, () => {
        const topPlayer = MyUtils.sortPlayers(mpris.players).shift();
        const available = topPlayer && topPlayer.play_back_status == "Playing";

        label.set_text(available ? topPlayer.track_title : "");
        stack.shown = available ? "playing" : "paused";
        self.tooltip_markup = available
          ? `<b>${topPlayer.track_title}</b>\nby ${topPlayer.track_artists}\n<i>${topPlayer.name}</i>`.replace(
              "&",
              "&amp;",
            )
          : "Media players";
      }),
  });
};

Object.assign(globalThis, { toggleMediaList });
