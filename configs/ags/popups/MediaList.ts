import { DirectionType } from "types/@girs/gtk-3.0/gtk-3.0.cjs";
import { EllipsizeMode } from "types/@girs/pango-1.0/pango-1.0.cjs";
import { MprisPlayer } from "types/service/mpris";
import { SPACING_LARGE } from "util/consts";
import { MyUtils } from "util/utils";

const mpris = await Service.import("mpris");
export const MEDIALIST_NAME = "medialist";

const lenToStr = (len: number) => {
  len = Math.max(len, 0);
  const HR_SEC = 60 * 60;

  const min = Math.floor(len / 60);
  const sec = Math.floor(len % 60);
  const sec0 = sec < 10 ? "0" : "";

  if (len > HR_SEC) {
    const hr = Math.floor(len / HR_SEC);
    const minr = min % 60;
    const min0 = minr < 10 ? "0" : "";
    return `${hr}:${min0}${minr}:${sec0}${sec}`;
  }

  return `${min}:${sec0}${sec}`;
};

const MediaCard = (player: MprisPlayer) => {
  const img = Widget.Box({
    className: "img",
    vpack: "start",
    css: player
      .bind("track_cover_url")
      .as((url) => `background-image: url('${url}');`),
  });

  const title = Widget.Label({
    className: "title",
    ellipsize: EllipsizeMode.END,
    hpack: "start",
    label: player.bind("track_title"),
    tooltipText: player.bind("track_title"),
  });

  const artist = Widget.Label({
    className: "artist",
    ellipsize: EllipsizeMode.END,
    hpack: "start",
    label: player.bind("track_artists").as((a) => a.join(", ")),
  });

  const playingOn = Widget.Label({
    className: "playing-on",
    hpack: "end",
    hexpand: true,
    label: player.bind("name"),
  });

  const positionSlider = Widget.Slider({
    className: "position-slider",
    drawValue: false,
    onChange: ({ value }) => (player.position = value * player.length),
    visible: player.bind("length").as((l) => l > 0),
    setup: (self) => {
      const update = () => {
        const value = player.position / player.length;
        self.value = value > 0 ? value : 0;
      };
      self.hook(player, update);
      self.hook(player, update, "position");
      self.poll(1000, update);
    },
  });

  const positionLabel = Widget.Label({
    className: "position",
    hpack: "start",
    setup: (self) => {
      const update = (_ignore?: any, time?: number) => {
        self.label = lenToStr(time || player.position);
        self.visible = player.length > 0;
      };

      self.hook(player, update, "position");
      self.poll(1000, update);
    },
  });

  const lengthLabel = Widget.Label({
    className: "length",
    hpack: "end",
    visible: player.bind("length").as((l) => l > 0),
    label: player.bind("length").as(lenToStr),
  });

  const playPause = Widget.Button({
    className: "play-pause",
    onClicked: () => player.playPause(),
    visible: player.bind("can_play"),
    child: Widget.Icon({
      icon: player.bind("play_back_status").transform((s) => {
        switch (s) {
          case "Playing":
            return "media-playback-pause-symbolic";
          case "Paused":
          case "Stopped":
            return "media-playback-start-symbolic";
        }
      }),
    }),
  });

  const prev = Widget.Button({
    className: "prev",
    onClicked: () => player.previous(),
    visible: player.bind("can_go_prev"),
    child: Widget.Icon("media-skip-backward-symbolic"),
  });

  const next = Widget.Button({
    className: "next",
    onClicked: () => player.next(),
    visible: player.bind("can_go_next"),
    child: Widget.Icon("media-skip-forward-symbolic"),
  });

  return Widget.Box(
    {
      className: "card",
      canFocus: true,
      setup: (self) => {
        self.keybind("h", () => prev.activate());
        self.keybind("l", () => next.activate());
        self.keybind("space", () => playPause.activate());
      },
    },
    img,
    Widget.Box(
      { className: "contents", vertical: true, hexpand: true },
      Widget.Box([artist, playingOn]),
      Widget.Box({ vexpand: true }),
      title,
      Widget.Box({ vexpand: true }),
      positionSlider,
      Widget.CenterBox({
        startWidget: positionLabel,
        centerWidget: Widget.Box([prev, playPause, next]),
        endWidget: lengthLabel,
      }),
    ),
  );
};

export const MediaList = () => {
  return Widget.Window({
    name: MEDIALIST_NAME,
    className: MEDIALIST_NAME,
    anchor: ["top"],
    keymode: "exclusive",
    layer: "overlay",
    child: Widget.Box({
      className: "list",
      spacing: SPACING_LARGE,
      vertical: true,
      children: mpris
        .bind("players")
        .as((list) => MyUtils.sortPlayers(list).map(MediaCard)),
    }),
    setup: (self) => {
      self.keybind("j", () => self.child_focus(DirectionType.DOWN));
      self.keybind("k", () => self.child_focus(DirectionType.UP));
      self.keybind("Escape", () => App.removeWindow(self.name!));
    },
  });
};
