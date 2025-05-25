{ colors }:
#css
''
  @media (prefers-color-scheme: dark) {
    :root {
      --zen-colors-primary: #${colors.base01} !important;
      --zen-primary-color: #${colors.base0D} !important;
      --zen-colors-secondary: #${colors.base01} !important;
      --zen-colors-tertiary: #${colors.base01} !important;
      --zen-colors-border: #${colors.base0D} !important;
      --toolbarbutton-icon-fill: #${colors.base0D} !important;
      --lwt-text-color: #${colors.base04} !important;
      --toolbar-field-color: #${colors.base04} !important;
      --tab-selected-textcolor: #${colors.base0B} !important;
      --toolbar-field-focus-color: #${colors.base04} !important;
      --toolbar-color: #${colors.base04} !important;
      --newtab-text-primary-color: #${colors.base04} !important;
      --arrowpanel-color: #${colors.base04} !important;
      --arrowpanel-background: #${colors.base02} !important;
      --sidebar-text-color: #${colors.base04} !important;
      --lwt-sidebar-text-color: #${colors.base04} !important;
      --lwt-sidebar-background-color: #${colors.base02} !important;
      --toolbar-bgcolor: #${colors.base01} !important;
      --newtab-background-color: #${colors.base02} !important;
      --zen-themed-toolbar-bg: #${colors.base01} !important;
      --zen-main-browser-background: #${colors.base01} !important;
      --toolbox-bgcolor-inactive: #${colors.base01} !important;
    }

    #permissions-granted-icon {
      color: #${colors.base01} !important;
    }

    .sidebar-placesTree {
      background-color: #${colors.base02} !important;
    }

    #zen-workspaces-button {
      background-color: #${colors.base02} !important;
    }

    #TabsToolbar {
      background-color: #${colors.base01} !important;
    }

    #urlbar-background {
      background-color: #${colors.base02} !important;
    }

    .content-shortcuts {
      background-color: #${colors.base02} !important;
      border-color: #${colors.base0D} !important;
    }

    .urlbarView-url {
      color: #${colors.base0D} !important;
    }

    #zenEditBookmarkPanelFaviconContainer {
      background: #${colors.base02} !important;
    }

    toolbar .toolbarbutton-1 {
      &:not([disabled]) {
        &:is([open], [checked])
          > :is(
            .toolbarbutton-icon,
            .toolbarbutton-text,
            .toolbarbutton-badge-stack
          ) {
          fill: #${colors.base02};
        }
      }
    }

    .identity-color-blue {
      --identity-tab-color: #${colors.base0D} !important;
      --identity-icon-color: #${colors.base0D} !important;
    }

    .identity-color-turquoise {
      --identity-tab-color: #${colors.base0C} !important;
      --identity-icon-color: #${colors.base0C} !important;
    }

    .identity-color-green {
      --identity-tab-color: #${colors.base0B} !important;
      --identity-icon-color: #${colors.base0B} !important;
    }

    .identity-color-yellow {
      --identity-tab-color: #${colors.base0A} !important;
      --identity-icon-color: #${colors.base0A} !important;
    }

    .identity-color-orange {
      --identity-tab-color: #${colors.base09} !important;
      --identity-icon-color: #${colors.base09} !important;
    }

    .identity-color-red {
      --identity-tab-color: #${colors.base08} !important;
      --identity-icon-color: #${colors.base08} !important;
    }

    .identity-color-pink {
      --identity-tab-color: #${colors.base0F} !important;
      --identity-icon-color: #${colors.base0F} !important;
    }

    .identity-color-purple {
      --identity-tab-color: #${colors.base0E} !important;
      --identity-icon-color: #${colors.base0E} !important;
    }
  }
''
