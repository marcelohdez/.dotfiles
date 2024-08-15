import { MprisPlayer } from "types/service/mpris";

export class MyUtils {
  static sortPlayers = (list: MprisPlayer[]) =>
    list.sort((a, b) => {
      function get_score(player: MprisPlayer) {
        let score = player.name === "kdeconnect" ? 1 : 0;
        score -= player.play_back_status === "Playing" ? 2 : 0;
        return score;
      }

      return get_score(a) - get_score(b);
    });
}
