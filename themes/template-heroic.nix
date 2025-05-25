{ colors }:
#css
''
  body.stylix {
    --text-default: #${colors.base05};
    --text-secondary: #${colors.base04};
    --text-tertiary: #${colors.base00};

    --background: #${colors.base01};
    --background-darker: #${colors.base00};
    --background-lighter: #${colors.base02};
    --body-background: #${colors.base01};
    --gradient-body-background: #${colors.base01};
    --input-background: #${colors.base02};
    --controller-hints-background: transparent;
    --current-background: #${colors.base01};
    --modal-background: #${colors.base00};
    --modal-border: #${colors.base0D};
    --osk-background: #${colors.base01};
    --osk-button-background: #${colors.base02};
    --osk-button-border: #${colors.base00};
    --search-bar-background: #${colors.base02};
    --search-bar-border: #${colors.base02};

    --action-icon: #${colors.base05};
    --action-icon-hover: #${colors.base0E};
    --action-icon-active: #${colors.base0D};
    --icons-background: #${colors.base01};

    --primary-button: #${colors.base0D};
    --primary-button-overlay: #${colors.base0C};
    --secondary-button: #${colors.base0E};
    --secondary-button-overlay: #${colors.base0F};
    --tertiary-button: #${colors.base0A};
    --tertiary-button-overlay: #${colors.base09};
    --success-button: #${colors.base0B};
    --disabled-button: #${colors.base00};
    --disabled-button-overlay: #${colors.base00};

    --navbar-active: #${colors.base0D};
    --navbar-inactive: #${colors.base05};
    --navbar-active-background: #${colors.base02};
    --navbar-accent: #${colors.base0E};
    --navbar-background: #${colors.base00};
    --divider: #${colors.base00};

    --success: #${colors.base0B};
    --success-hover: #${colors.base0B};
    --danger: #${colors.base0A};
    --danger-hover: #${colors.base09};

    --primary: #${colors.base0D};
    --secondary: #${colors.base0E};
    --accent: #${colors.base0D};

    --status-success: #${colors.base0B};
    --status-warning: #${colors.base0A};
    --status-danger: #${colors.base08};
    --status-info: #${colors.base0D};

    --neutral-01: #${colors.base00};
    --neutral-02: #${colors.base01};
    --neutral-03: #${colors.base02};
    --neutral-04: #${colors.base04};
    --neutral-05: #${colors.base05};
    --neutral-06: #${colors.base05};
  }

  body.stylix select,
  body.stylix input {
    box-shadow: none !important;
  }
''
