import { notifications } from "../../utils/services.js";

const categoryingApps = (v) => {
  let appsName = [];
  for (let i = 0; v.length > i; i++) {
    if (appsName.includes(v[i].appName)) {
      appsName.splice(appsName.indexOf(v[i].appName), 1);
      appsName.push(v[i].appName);
    } else {
      appsName.push(v[i].appName);
    }
  }
  return appsName;
};

const managingGroup = (v) => {
  let notVisible = v;
  let visible = notVisible.shift();
  return { notVisible, visible };
};

const notificationIcon = ({ app_entry, app_icon, image }) => {
  if (image) {
    return Widget.Box({
      css: `
                background-image: url("${image}");
                background-size: contain;
                background-repeat: no-repeat;
                background-position: center;
            `,
    });
  }

  let icon = "dialog-information-symbolic";
  if (Utils.lookUpIcon(app_icon)) icon = app_icon;

  if (app_entry && Utils.lookUpIcon(app_entry)) icon = app_entry;

  return Widget.Icon(icon);
};

const notificationContainer = (n) => {
  const icon = Widget.Box({
    vpack: "start",
    class_name: "icon",
    child: notificationIcon(n),
  });

  const title = Widget.Label({
    class_name: "title",
    xalign: 0,
    justification: "left",
    hexpand: true,
    max_width_chars: 24,
    truncate: "end",
    wrap: true,
    label: n.summary,
    use_markup: true,
  });

  const body = Widget.Label({
    class_name: "body",
    hexpand: true,
    use_markup: true,
    xalign: 0,
    justification: "left",
    label: n.body,
    wrap: true,
  });

  const actions = Widget.Box({
    class_name: "actions",
    children: n.actions.map(({ id, label }) =>
      Widget.Button({
        class_name: "action-button",
        on_clicked: () => n.invoke(id),
        hexpand: true,
        child: Widget.Label(label),
      }),
    ),
  });

  const close = Widget.Button({
    child: Widget.Icon("preview-close-symbolic"),
    onClicked: () => n.close(),
  });

  return Widget.EventBox({
    child: Widget.Box({
      class_name: `notification ${n.urgency}`,
      children: [
        Widget.Box({
          children: [
            icon,
            Widget.Box({
              vertical: true,
              children: [title, body],
            }),
          ],
        }),
        actions,
        close,
      ],
    }),
  });
};

// const notificationsBox = Widget.Box({
//   vertical: true,
//   children: notificationsBinding.as((notification) =>
//     notification.map(notificationContainer),
//   ),
// });

const toggleGroup = Variable(false);

const notificationGroup = (v) => {
  const filterNotifications = notifications.notifications
    .filter((a) => a.appName == v)
    .reverse();

  const filterGroups = managingGroup(filterNotifications);

  const groupRevealer = Widget.Revealer({
    revealChild: toggleGroup.bind().as((a) => a),
    transition: "slide_down",
    transitionDuration: 500,
    child: Widget.Box({
      vertical: true,
      children: filterGroups.notVisible.map(notificationContainer),
    }),
  });

  return Widget.EventBox({
    onHover: () => toggleGroup.setValue(true),
    onHoverLost: () => toggleGroup.setValue(false),
    child: Widget.Box({
      class_name: "notifications-group",
      vertical: true,
      children: [
        Widget.Box({
          class_name: "header",
          children: [
            Widget.Label({
              hexpand: true,
              hpack: "start",
              class_name: "h2",
              label: v,
            }),
            Widget.Label({
              hexpand: true,
              hpack: "end",
              justification: "right",
              class_name: "h2",
              label: `+${filterGroups.notVisible.length}`,
            }).hook(
              notifications,
              (self) => (self.visible = filterGroups.notVisible.length > 0),
            ),
          ],
        }),
        notificationContainer(filterGroups.visible),
        groupRevealer,
        // Widget.Box({
        //   vertical: true,
        //   children: notificationsBinding.as((notif) =>
        //     notif
        //       .filter((a) => a.appName == v)
        //       .reverse()
        //       .map(notificationContainer),
        //   ),
        // }),
      ],
    }),
  });
};

const notificationsBox = Widget.Box({
  vertical: true,
}).hook(notifications, (self) => {
  self.children = categoryingApps(notifications.notifications).map(
    notificationGroup,
  );
});

const notificationsHeader = Widget.Box({
  css: "margin-bottom: 10px",
  children: [
    Widget.Label({
      class_name: "h1",
      hexpand: true,
      hpack: "center",
      label: "Notification Center",
    }),
    Widget.Button({
      visible: notifications.bind("notifications").as((a) => a.length > 0),
      onClicked: () => notifications.clear(),
      css: "margin-right: 10px",
      child: Widget.Icon("edit-delete-symbolic"),
    }),
    Widget.Box({
      children: [
        Widget.Icon("notification-disabled-symbolic"),
        Widget.Switch({
          onActivate: () => (notifications.dnd = !notifications.dnd),
        }),
      ],
    }),
  ],
});

const notificationsMenu = Widget.Box({
  class_name: "notifications-menu",
  vertical: true,
  children: [
    notificationsHeader,
    Widget.Scrollable({
      hscroll: "never",
      vscroll: "automatic",
      minContentHeight: 600,
      child: notificationsBox,
    }),
  ],
});

const notificationReveal = Widget.Revealer({
  transitionDuration: 700,
  transition: "slide_right",
  child: notificationsMenu,
});

globalThis.showNotificationsCenter = () =>
  (notificationReveal.revealChild = !notificationReveal.revealChild);

export const NotificationsCenter = () =>
  Widget.Window({
    name: "notifications_center",
    anchor: ["bottom", "left"],
    margins: [0, 0, 0, 13],
    css: "background-color: transparent",
    child: Widget.Box({
      css: "min-width: 2px",
      child: notificationReveal,
    }),
  });
