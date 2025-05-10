import { notifications } from "../../../utils/services.js";

const notificationIcon = Widget.Icon().hook(notifications, (self) => {
  if (notifications.dnd) {
    return (self.icon = "notification-disabled-symbolic");
  }
  if (notifications.notifications.length > 0) {
    if (notifications.dnd) {
      return (self.icon = "notification-disabled-new-symbolic");
    }
    return (self.icon = "notification-new-symbolic");
  }
  return (self.icon = "notification-symbolic");
});

const notificationsRevealer = Widget.Revealer({
  transition: "slide_up",
  transitionDuration: 300,
  child: Widget.Label().hook(
    notifications,
    (self) => (self.label = notifications.notifications.length.toString()),
  ),
});

export const NotificationButton = () =>
  Widget.Box({
    vertical: true,
    children: [
      notificationsRevealer,
      Widget.Button({
        onClicked: () => {
          showNotificationsCenter();
        },
        onHover: () => (notificationsRevealer.revealChild = true),
        onHoverLost: () => (notificationsRevealer.revealChild = false),
        child: notificationIcon,
      }),
    ],
  });
