import { EllipsizeMode } from "types/@girs/pango-1.0/pango-1.0.cjs";
import { MprisPlayer } from "types/service/mpris";

const mpris = await Service.import("mpris");

const lenToStr = (len: number) => {
  const min = Math.floor(len / 60);
  const sec = Math.floor(len % 60);
  const sec0 = sec < 10 ? "0" : "";
  return `${min}:${sec0}${sec}`;
};

const PlayerCard = (player: MprisPlayer) => {
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
    { className: "card" },
    img,
    Widget.Box(
      { className: "contents", vertical: true, hexpand: true },
      Widget.Box([artist, playingOn]),
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

const MediaPlayers = () => {
  return Widget.Window({
    name: "mediaplayers",
    className: "mediaplayers",
    anchor: ["top", "right"],
    child: Widget.Box({
      className: "list",
      spacing: 10,
      vertical: true,
      children: mpris.bind("players").as((p) => p.map(PlayerCard)),
    }),
  });
};

export default MediaPlayers;
