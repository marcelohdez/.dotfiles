import { MprisPlayer } from "types/service/mpris";
const mpris = await Service.import("mpris");

export class MyUtils {
  static sortedPlayers = () =>
    mpris.bind("players").as((list) =>
      list.sort((a, b) => {
        function get_score(player: MprisPlayer) {
          let score = player.name === "kdeconnect" ? 1 : 0;
          score -= player.play_back_status === "Playing" ? 2 : 0;
          return score;
        }

        return get_score(a) - get_score(b);
      }),
    );
}
