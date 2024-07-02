import { CLASS_NAME_MODULE } from "consts";
import MediaPlayers from "popups/MediaPlayers";

const mpris = await Service.import("mpris");

const Mpris = () =>
  Widget.Button({
    tooltipText: "Media players",
    visible: mpris.bind("players").as((players) => players.length > 0),
    classNames: [CLASS_NAME_MODULE, "mediaplayer"],
    onClicked: () => {
      if (App.getWindow("mediaplayers")) {
        App.removeWindow("mediaplayers");
      } else {
        App.addWindow(MediaPlayers());
      }
    },
    child: Widget.Icon({ icon: "folder-music-symbolic" }),
  });

export default Mpris;
