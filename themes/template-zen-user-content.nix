{ colors }:
#css
''
  @media (prefers-color-scheme: dark) {

      /* Common variables affecting all pages */
      @-moz-document url-prefix("about:") {
          :root {
              --in-content-page-color: #${colors.base04} !important;
              --color-accent-primary: #${colors.base0D} !important;
              --color-accent-primary-hover: #${colors.base0B} !important;
              --color-accent-primary-active: #${colors.base0C} !important;
              background-color: #${colors.base00} !important;
              --in-content-page-background: #${colors.base00} !important;
          }
      }

      /* Variables and styles specific to about:newtab and about:home */
      @-moz-document url("about:newtab"), url("about:home") {
          :root {
              --newtab-background-color: #${colors.base00} !important;
              --newtab-background-color-secondary: #${colors.base01} !important;
              --newtab-element-hover-color: #${colors.base01} !important;
              --newtab-text-primary-color: #${colors.base04} !important;
              --newtab-wordmark-color: #${colors.base04} !important;
              --newtab-primary-action-background: #${colors.base0D} !important;
          }

          .icon {
              color: #${colors.base0D} !important;
          }

          .search-wrapper .logo-and-wordmark .logo {
              background: url("https://raw.githubusercontent.com/IAmJafeth/zen-browser/main/themes/Mocha/Blue/zen-logo-mocha.svg") no-repeat center !important;
              display: inline-block !important;
              height: 82px !important;
              width: 82px !important;
              background-size: 82px !important;
          }

          @media (max-width: 609px) {
              .search-wrapper .logo-and-wordmark .logo {
                  background-size: 64px !important;
                  height: 64px !important;
                  width: 64px !important;
              }
          }

          .card-outer:is(:hover, :focus, .active):not(.placeholder) .card-title {
              color: #${colors.base0D} !important;
          }

          .top-site-outer .search-topsite {
              background-color: #${colors.base0D} !important;
          }

          .compact-cards .card-outer .card-context .card-context-icon.icon-download {
              fill: #${colors.base0B} !important;
          }
      }

      /* Variables and styles specific to about:preferences */
      @-moz-document url-prefix("about:preferences") {
          :root {
              --zen-colors-tertiary: #${colors.base01} !important;
              --in-content-text-color: #${colors.base04} !important;
              --link-color: #${colors.base0D} !important;
              --link-color-hover: #${colors.base0C} !important;
              --zen-colors-primary: #${colors.base01} !important;
              --in-content-box-background: #${colors.base01} !important;
              --zen-primary-color: #${colors.base0D} !important;
          }

          groupbox,
          moz-card {
              background: #${colors.base00} !important;
          }

          button,
          groupbox menulist {
              background: #${colors.base01} !important;
              color: #${colors.base04} !important;
          }

          .main-content {
              background-color: #${colors.base00} !important;
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

      /* Variables and styles specific to about:addons */
      @-moz-document url-prefix("about:addons") {
          :root {
              --zen-dark-color-mix-base: #${colors.base01} !important;
              --background-color-box: #${colors.base00} !important;
          }
      }

      /* Variables and styles specific to about:protections */
      @-moz-document url-prefix("about:protections") {
          :root {
              --zen-primary-color: #${colors.base00} !important;
              --social-color: #${colors.base0E} !important;
              --coockie-color: #${colors.base0C} !important;
              --fingerprinter-color: #${colors.base0A} !important;
              --cryptominer-color: #${colors.base0E} !important;
              --tracker-color: #${colors.base0B} !important;
              --in-content-primary-button-background-hover: #${colors.base02} !important;
              --in-content-primary-button-text-color-hover: #${colors.base04} !important;
              --in-content-primary-button-background: #${colors.base03} !important;
              --in-content-primary-button-text-color: #${colors.base04} !important;
          }

          .card {
              background-color: #${colors.base01} !important;
          }
      }
  }
''
