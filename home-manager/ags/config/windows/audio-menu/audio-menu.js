import { audio } from "../../utils/services.js";

const apps = audio.bind("apps");

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

const volumeSlider = (v) =>
  Widget.Slider({
    hexpand: true,
    draw_value: false,
    on_change: ({ value }) => (v.volume = value),
    setup: (self) =>
      self.hook(v, () => {
        self.value = v.volume || 0;
      }),
  });

const volumePercent = (v) =>
  Widget.Label().hook(v, (self) => {
    self.label = `${Math.floor(v.volume * 100).toString()}%`;
  });

const audioName = (v) =>
  Widget.Label().hook(v, (self) => {
    self.label = v.description;
  });

const audioIcon = (v) =>
  Widget.Icon({
    css: "margin-right: 10px;",
  }).hook(v, (self) => {
    const name = `${v.iconName}`;
    self.icon = Utils.lookUpIcon(name) ? name : "audio-speakers-symbolic";
  });

const audioBox = (v) =>
  Widget.Box({
    class_name: "containers half",
    vertical: true,
    children: [
      Widget.Box({
        children: [audioIcon(v), audioName(v)],
      }),
      Widget.Box({
        children: [volumeIcon(v), volumeSlider(v), volumePercent(v)],
      }),
    ],
  });

const audioFullBox = (v) =>
  Widget.Box({
    class_name: "containers full",
    css: "margin: 5px",
    vertical: true,
    children: [
      Widget.Box({
        children: [audioIcon(v), audioName(v)],
      }),
      Widget.Box({
        children: [volumeIcon(v), volumeSlider(v), volumePercent(v)],
      }),
    ],
  });

const audioDeviceBox = Widget.Box({
  class_name: "containers half",
  css: "margin-bottom: 10px;",
  vertical: true,
  children: [
    Widget.Box({
      css: "margin-bottom: 10px;",
      vertical: true,
      children: [
        Widget.Label({
          class_name: "h2 title-containers",
          justification: "center",
          label: "Output",
        }),
        audioBox(audio.speaker),
      ],
    }),
    Widget.Box({
      vertical: true,
      children: [
        Widget.Label({
          class_name: "h2 title-containers",
          justification: "center",
          label: "Input",
        }),
        audioBox(audio.microphone),
      ],
    }),
  ],
});

const audioAppsBox = Widget.Box({
  vertical: true,
  css: `
        border-radius: 0 0 10px 10px;
        border: 1px solid #cdd6f4;
        padding: 5px;`,
  children: apps.as((app) => app.map(audioFullBox)),
});

const audioAppsRevealer = Widget.Revealer({
  transitionDuration: 500,
  transition: "slide_down",
  child: audioAppsBox,
});

const volumeBox = Widget.Box({
  class_name: "volume-box",
  vertical: true,
  children: [
    Widget.Label({
      class_name: "h1 title-containers",
      label: "Device Mixer",
    }),
    audioDeviceBox,
    Widget.Button({
      class_name: "h1 title-containers",
      onClicked: () =>
        (audioAppsRevealer.revealChild = !audioAppsRevealer.revealChild),
      child: Widget.Label({
        label: "App Mixer",
      }),
    }),
    audioAppsRevealer,
  ],
});

const volumeMenuRevealer = Widget.Revealer({
  transitionDuration: 700,
  transition: "slide_right",
  child: volumeBox,
});

globalThis.showVolumeMenu = () =>
  (volumeMenuRevealer.revealChild = !volumeMenuRevealer.revealChild);

export const volumeMenu = () =>
  Widget.Window({
    name: "volume_menu",
    anchor: ["bottom", "left"],
    margins: [0, 0, 0, 13],
    layer: "overlay",
    css: "background-color: transparent;",
    child: Widget.Box({
      css: "min-width: 2px;",
      child: volumeMenuRevealer,
    }),
  });
