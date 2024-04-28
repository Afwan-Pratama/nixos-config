import App from "resource:///com/github/Aylur/ags/app.js";
import { VerticalBar } from "./windows/vertical-bar/vertical-bar.js";
import { notificationPopup } from "./windows/notification-popups/notificationPopups.js";
import { volumeMenu } from "./windows/audio-menu/audio-menu.js";
import { mediaPlayer } from "./windows/media-player/media-player.js";
import { NotificationsCenter } from "./windows/notification-center/notification-center.js";
import { CalendarMenu } from "./windows/calendar-menu/calendar-menu.js";

App.config({
  style: "./style.css",
  windows: [
    VerticalBar(),
    notificationPopup,
    mediaPlayer,
    volumeMenu(),
    NotificationsCenter(),
    CalendarMenu(),
  ],
});
