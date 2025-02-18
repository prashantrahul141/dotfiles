{ config, ... }:
{

  programs.waybar = {
    enable = true;
    style = ''
      * {
      	/* `otf-font-awesome` is required to be installed for icons */
      	font-family: FiraCode Nerd Font;
      	font-size: 14px;
      	font-weight: 600;
      }

      tooltip {
        background: #${config.colorScheme.palette.base00};
        color: #${config.colorScheme.palette.base07};
        border: 2px solid #${config.colorScheme.palette.base02};
        border-radius: 1px;
      }

      window#waybar {
      	color: #${config.colorScheme.palette.base06};
      	background-color: #${config.colorScheme.palette.base00};
      }

      window#waybar.hidden {
      	opacity: 0.2;
      }

      #workspaces button {
      	padding: 5px 8px;
      	box-shadow: inset 0 -3px transparent;
      	border: none;
      	color: #${config.colorScheme.palette.base03};
      	border-radius: 2px;
      }

      #workspaces button:hover {
      	box-shadow: inherit;
      	text-shadow: inherit;
      	color: #${config.colorScheme.palette.base07};
      	background: #${config.colorScheme.palette.base02};
      	background-color: #${config.colorScheme.palette.base02};
      }

      #workspaces button.active {
      	color: #${config.colorScheme.palette.base07};
      	background: #${config.colorScheme.palette.base02};
      	background-color: #${config.colorScheme.palette.base02};
      }

      #workspaces button.urgent {
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }


      #clock,
      #battery,
      #cpu,
      #memory,
      #backlight,
      #network,
      #pulseaudio,
      #custom-media,
      #tray,
      #mpd {
      	padding: 0 10px;
      	color: #${config.colorScheme.palette.base06};
      	border-radius: 2px;
      }

      #window,
      #workspaces {
      	margin: 0 2px;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left>widget:first-child>#workspaces {
      	margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right>widget:last-child>#workspaces {
      	margin-right: 0;
      }

      #battery {
      	color: #${config.colorScheme.palette.base06};
      }

      #battery.charging,
      #battery.plugged {
      	color: #${config.colorScheme.palette.base0B};
      }

      @keyframes blink {
      	to {
      		color: #${config.colorScheme.palette.base01};
      		background-color: #${config.colorScheme.palette.base08};
      	}
      }

      #battery.critical:not(.charging) {
      	background-color: #${config.colorScheme.palette.base02};
      	color: #${config.colorScheme.palette.base08};
      	animation-name: blink;
      	animation-duration: 0.5s;
      	animation-timing-function: linear;
      	animation-iteration-count: infinite;
      	animation-direction: alternate;
      }

      label:focus {
      	background-color: #000000;
      }

      #backlight {
      	color: #${config.colorScheme.palette.base0D};
      }

      #memory {
      	color: #${config.colorScheme.palette.base0B};
      }

      #network {
      	color: #${config.colorScheme.palette.base08};
      }

      #network.disconnected {
      	color: #${config.colorScheme.palette.base08};
      	background-color: #${config.colorScheme.palette.base01};
      }

      #pulseaudio {
      	color: #${config.colorScheme.palette.base09};
      }

      #pulseaudio.muted {
      	color: #${config.colorScheme.palette.base08};
      	background-color: #${config.colorScheme.palette.base01};
      }

      #tray {}

      #tray>.needs-attention {
      	background-color: #${config.colorScheme.palette.base07};
      	color: #${config.colorScheme.palette.base01};
      }

      #custom-media {
      	background-color: #66cc99;
      	color: #2a5c45;
      	min-width: 100px;
      }
    '';

    settings = [
      {
        mode = "dock";
        layer = "top";
        position = "top";
        passtrough = false;
        exclusive = true;
        spacing = 0;
        margin-top = 3;
        margin-right = 3;
        margin-left = 3;
        margin-bottom = 0;

        modules-left = [
          "hyprland/workspaces"
          "custom/paddc"
          "cpu"
          "custom/paddc"
          "memory"
          "custom/paddc"
          "battery"
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "tray"
          "custom/paddc"
          "custom/notifications"
          "custom/paddc"
          "network"
          "custom/paddc"
          "backlight"
          "custom/paddc"
          "pulseaudio"
          "pulseaudio#microphone"
          "custom/paddc"
          "clock#date"
          "clock#time"
        ];
        "hyprland/window" = {
          format = "{class}";
          max-length = 20;
          rewrite = {
            "" = "<span foreground= '#${config.colorScheme.palette.base05}'></span> hyprland";
          };
        };
        battery = {
          format = "󰁹 {}%";
        };
        cpu = {
          interval = 10;
          format = "󰻠 {}%";
          max-length = 10;
          on-click = "";
        };
        memory = {
          interval = 30;
          format = "  {}%";
          format-alt = " {used:0.1f}G";
          max-length = 10;
        };
        backlight = {
          format = "󰖨 {}";
          device = "acpi_video0";
          on-scroll-up = "brightnessctl s 1+";
          on-scroll-down = "brightnessctl s 1-";
          scroll-step = 1;
        };
        tray = {
          icon-size = 15;
          tooltip = true;
          spacing = 8;
        };
        network = {
          format = "󰖩 {essid}";
          format-disconnected = "󰖪 disconnected";
        };
        "clock#date" = {
          format = "<span color='#${config.colorScheme.palette.base05}'>󰃭 </span>{:%a, %d %b}";
          tooltip-format = "<tt>{calendar}</tt>";

          calendar = {
            mode = "month";
            mode-mon-col = 6;
            on-click-right = "mode";

            format = {
              months = "<span color='#${config.colorScheme.palette.base05}'><b>{}</b></span>";
              weekdays = "<span color='#${config.colorScheme.palette.base03}'>{}</span>";
              today = "<span color='#${config.colorScheme.palette.base0B}'><b>{}</b></span>";
            };
          };

          actions = {
            on-click = "mode";
            on-click-right = "mode";
          };

          min-length = 8;
          max-length = 20;
        };

        "clock#time" = {
          format = "<span color='#${config.colorScheme.palette.base07}'>󱑂 </span>{:%R}";
          tooltip = false;
          # tooltip-format = "Standard Time: {:%I:%M %p}";
          min-length = 8;
          max-length = 12;
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          tooltip = false;
          format-muted = " Muted";
          on-click = "pamixer -t";
          on-click-right = "pavucontrol";
          on-scroll-up = "pamixer -i 1";
          on-scroll-down = "pamixer -d 1";
          scroll-step = 1;
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
        };
        "pulseaudio#microphone" = {
          format = "{format_source}";
          tooltip = false;
          format-source = "󰍬 {volume}%";
          format-source-muted = "  Muted";
          on-click = "pamixer --default-source -t";
          on-scroll-up = "pamixer --default-source -i 1";
          on-scroll-down = "pamixer --default-source -d 1";
          scroll-step = 1;
        };
        "custom/paddc" = {
          format = " ";
          tooltip = false;
        };

        "custom/notifications" = {
          format = "{icon}{}";
          rotate = 0;
          format-icons = {
            email-notification = "󱅫 ";
            chat-notification = "󱅫 ";
            warning-notification = "󱅫 ";
            error-notification = "󱅫 ";
            network-notification = "󱅫 ";
            battery-notification = "󱅫 ";
            update-notification = "󱅫 ";
            music-notification = "󱅫 ";
            volume-notification = "󱅫 ";
            notification = "󱅫 ";
            dnd = "󰂛 ";
            none = " ";
          };
          return-type = "json";
          exec-if = "which dunstctl";
          exec = "${builtins.path { path = ./notifications.py; }}";
          on-scroll-down = "sleep 0.1 && dunstctl history-pop";
          on-click = "dunstctl set-paused toggle";
          on-click-middle = "dunstctl history-clear";
          on-click-right = "dunstctl close-all";
          interval = 1;
          tooltip = true;
          escape = true;
        };

      }
    ];
  };

}
