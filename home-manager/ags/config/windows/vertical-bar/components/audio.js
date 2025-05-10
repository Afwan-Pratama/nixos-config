import { audio } from "../../../utils/services.js";

const volumeIcon = (v) =>
  Widget.Icon().hook(v, (self) => {
    const category = {
      101: "overamplified",
      67: "high",
      34: "medium",
      1: "low",
      0: "muted",
    };
    const icon = v.is_muted
      ? 0
      : [101, 67, 34, 1, 0].find((threshold) => threshold <= v.volume * 100);

    self.icon = `audio-volume-${category[icon]}-symbolic`;
  });

const volumeRevealer = Widget.Revealer({
  transition: "slide_up",
  transitionDuration: 300,
  child: Widget.Label().hook(audio.speaker, (self) => {
    self.label = Math.floor(audio.speaker.volume * 100).toString();
  }),
});

export const Volume = () =>
  Widget.Box({
    vertical: true,
    class_name: "volume",
    children: [
      volumeRevealer,
      Widget.Button({
        child: volumeIcon(audio.speaker),
        onClicked: () => showVolumeMenu(),
        onHover: () => (volumeRevealer.revealChild = true),
        onHoverLost: () => (volumeRevealer.revealChild = false),
        onScrollUp: () => (audio.speaker.volume += 0.01),
        onScrollDown: () => (audio.speaker.volume -= 0.01),
      }),
    ],
  });
