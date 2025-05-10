import { hyprland } from "../../../utils/services.js";

const dispatch = (ws) => hyprland.messageAsync(`dispatch workspace ${ws}`);
const activeWorkspace = hyprland.active.workspace;

export const Workspaces = () =>
  Widget.EventBox({
    onScrollUp: () => dispatch("-1"),
    onScrollDown: () => dispatch("+1"),
    child: Widget.Box({
      vertical: true,
      class_name: "workspaces",
      children: Array.from({ length: 9 }, (_, i) => i + 1).map((i) =>
        Widget.Button({
          onClicked: () => {
            dispatch(i);
          },
          child: Widget.Label().hook(activeWorkspace, (self) => {
            if (i == activeWorkspace.id) {
              self.css = `
                          background: #cdd6f4;
                          border-radius: 10px;
                          transition-property: background;
                          transition-duration: 1s;
                          `;
              self.label = "";
            } else {
              self.label = "O";
              self.css = `
                          border-radius: 10px;
                          background: #1e1e2e;
                          transition-property: background;
                          transition-duration: 700ms;`;
            }
          }),
        }),
      ),
    }),
  });
