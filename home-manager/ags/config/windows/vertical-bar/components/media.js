import { mpris } from "../../../utils/services.js";

const FALLBACK_ICON = "audio-x-generic-symbolic";
const PLAY_ICON = "media-playback-start-symbolic";
const PAUSE_ICON = "media-playback-pause-symbolic";
const PREV_ICON = "media-skip-backward-symbolic";
const NEXT_ICON = "media-skip-forward-symbolic";

export const Media = () =>
  Widget.Box({
    class_name: "media",
    vertical: true,
    children: [
      Widget.Button({
        class_name: "media-previous",
        on_clicked: () => mpris.getPlayer("")?.previous(),
        child: Widget.Icon(PREV_ICON),
      }),
      Widget.Button({
        class_name: "media-play-pause",
        on_clicked: () => {
          mpris.getPlayer("")?.playPause();
          console.log(mpris);
        },
        child: Widget.Icon().hook(mpris, (self) => {
          if (mpris.players[0].playBackStatus == "Playing") {
            return (self.icon = PAUSE_ICON);
          }
          return (self.icon = PLAY_ICON);
        }),
      }),
      Widget.Button({
        class_name: "media-next",
        on_clicked: () => mpris.getPlayer("")?.next(),
        child: Widget.Icon(NEXT_ICON),
      }),
      Widget.Button({
        on_clicked: () => showMediaCenter(),
        child: Widget.Icon().hook(mpris, (self) => {
          const name = `${mpris.players[0].entry}`;
          self.icon = Utils.lookUpIcon(name) ? name : FALLBACK_ICON;
        }),
      }),
    ],
  });
