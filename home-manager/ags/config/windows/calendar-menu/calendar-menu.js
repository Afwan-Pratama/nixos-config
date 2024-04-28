const calendarBox = Widget.Calendar({
  showDayNames: true,
  showDetails: true,
  showHeading: true,
  showWeekNumbers: true,
  // detail: (self, y, m, d) => {
  //   return `<span color="white">${y}. ${m}. ${d}.</span>`;
  // },
  onDaySelected: ({ date: [y, m, d] }) => {
    print(`${y}. ${m}. ${d}.`);
  },
});

const calendarRevealer = Widget.Revealer({
  transition: "slide_right",
  transitionDuration: 700,
  child: Widget.Box({
    child: calendarBox,
  }),
});

globalThis.showCalendarMenu = () =>
  (calendarRevealer.revealChild = !calendarRevealer.revealChild);

export const CalendarMenu = () =>
  Widget.Window({
    name: "calendar_menu",
    anchor: ["left"],
    margins: [0, 0, 0, 13],
    css: "background-color: transparent",
    layer: "overlay",
    child: Widget.Box({
      css: `
            min-width: 2px;
                 `,
      child: calendarRevealer,
    }),
  });
