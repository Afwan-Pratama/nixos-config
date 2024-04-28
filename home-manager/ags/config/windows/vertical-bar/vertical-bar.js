import { Media } from "./components/media.js";
import { Volume } from "./components/audio.js";
import { systemtray } from "../../utils/services.js";
import { Workspaces } from "./components/workspaces.js";
import { NotificationButton } from "./components/notification.js";

const hour = Variable("", {
  poll: [1000, 'date "+%I"'],
});

const minute = Variable("", {
  poll: [1000, 'date "+%M"'],
});

// widgets can be only assigned as a child in one container
// so to make a reuseable widget, make it a function
// then you can simply instantiate one by calling it

const ApplicationMenu = () =>
  Widget.Label({
    css: `padding: 5px 0 0 4px;
          font-size: 15px;
          `,
    label: " ",
  });

const Clock = () =>
  Widget.EventBox({
    onPrimaryClick: () => showCalendarMenu(),
    child: Widget.Box({
      class_name: "clock",
      vertical: true,
      children: [
        Widget.Label({
          justification: "center",
          label: hour.bind(),
        }),
        Widget.Label({
          justification: "center",
          angle: 90,
          label: ":",
        }),
        Widget.Label({
          justification: "center",
          label: minute.bind(),
        }),
      ],
    }),
  });

const SysTray = () =>
  Widget.Box({
    vertical: true,
    children: systemtray.bind("items").as((items) =>
      items.map((item) =>
        Widget.Button({
          child: Widget.Icon({ icon: item.bind("icon") }),
          on_primary_click: (_, event) => item.activate(event),
          on_secondary_click: (_, event) => item.openMenu(event),
          tooltip_markup: item.bind("tooltip_markup"),
        }),
      ),
    ),
  });

// layout of the bar
const Left = () =>
  Widget.Box({
    vertical: true,
    spacing: 8,
    children: [ApplicationMenu(), Workspaces()],
  });

const Center = () =>
  Widget.Box({
    vertical: true,
    spacing: 8,
    children: [Clock(), Media()],
  });

const Right = () =>
  Widget.Box({
    vpack: "end",
    vertical: true,
    spacing: 8,
    children: [Volume(), NotificationButton(), SysTray()],
  });

export const VerticalBar = (monitor = 0) =>
  Widget.Window({
    name: `bar-${monitor}`, // name has to be unique
    class_name: "bar",
    monitor,
    margins: [13, 0, 13, 13],
    anchor: ["left", "top", "bottom"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      vertical: true,
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });
