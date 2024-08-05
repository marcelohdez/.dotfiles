import { CLASS_NAME_MODULE } from "util/consts";
import { MediaList, MEDIALIST_NAME } from "popups/MediaList";
import { MprisPlayer } from "types/service/mpris";

const mpris = await Service.import("mpris");
const toggleMediaList = () => {
  if (App.getWindow(MEDIALIST_NAME)) {
    App.removeWindow(MEDIALIST_NAME);
  } else {
    App.addWindow(MediaList());
  }
};

export const Mpris = () =>
  Widget.Button({
    tooltipText: "Media players",
    visible: mpris.bind("players").as((players) => players.length > 0),
    classNames: [CLASS_NAME_MODULE, "mpris"],
    onClicked: () => toggleMediaList(),
    child: Widget.Icon({ icon: "folder-music-symbolic" }),
  });

Object.assign(globalThis, { toggleMediaList });
