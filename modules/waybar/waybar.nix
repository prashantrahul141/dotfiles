{ colorScheme, ... }:
{

  programs.waybar = {
    enable = true;
    style = ''
      * {
      	/* `otf-font-awesome` is required to be installed for icons */
      	font-family: FiraCode Nerd Font;
        font-size: 13px;
      	font-weight: 600;
      }

      tooltip {
        background: #${colorScheme.palette.base00};
        color: #${colorScheme.palette.base07};
        border: 2px solid #${colorScheme.palette.base02};
        border-radius: 1px;
      }

      tooltip label {
        color: #${colorScheme.palette.base04};
      }


      #workspaces button {
        padding: 5px 12px;
      	box-shadow: inset 0 -3px transparent;
      	border: none;
      	color: #${colorScheme.palette.base05};
        background-color: #${colorScheme.palette.base00};
        border-radius: 0px 0px 0px 0px;
      }

      #workspaces button:first-child {
         border-radius: 6px 0 0 6px;
      }

      #workspaces button:hover {
      	box-shadow: inherit;
      	text-shadow: inherit;
      	color: #${colorScheme.palette.base07};
      	background: #${colorScheme.palette.base02};
      	background-color: #${colorScheme.palette.base02};
      }

      #workspaces button.active {
      	color: #${colorScheme.palette.base00};
      	background: #${colorScheme.palette.base02};
      	background-color: #${colorScheme.palette.base0B};
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
      #tray,
      #custom-notifications {
      	padding: 8px 13px;
        color: #${colorScheme.palette.base06};
        background-color: #${colorScheme.palette.base00};
      }

      #clock.time {
        border-radius: 0 6px 6px 0;
      }

      #tray {
         border-radius: 6px 0 0 6px;
      }

      #window{
      	padding: 4px 14px;
        color: #${colorScheme.palette.base06};
        background-color: #${colorScheme.palette.base00};
      	border-radius: 6px;
      }

      window#waybar {
        color: #${colorScheme.palette.base06};
        border-radius: 2px;
        background-color: rgba(0,0,0,0);
      }

      window#waybar.hidden {
      	opacity: 0.2;
      }

      #battery {
      	color: #${colorScheme.palette.base06};
      }

      #battery.charging,
      #battery.plugged {
      	color: #${colorScheme.palette.base0B};
      }

      @keyframes blink {
      	to {
      		color: #${colorScheme.palette.base01};
      		background-color: #${colorScheme.palette.base08};
      	}
      }

      #battery.critical:not(.charging) {
      	background-color: #${colorScheme.palette.base02};
      	color: #${colorScheme.palette.base08};
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
        color: #${colorScheme.palette.base0D};
        border-radius: 0 6px 6px 0;
      }

      #memory {
      	color: #${colorScheme.palette.base0B};
      }

      #cpu {
      	color: #${colorScheme.palette.base09};
      }

      #network {
      	color: #${colorScheme.palette.base08};
      }

      #network.disconnected {
      	color: #${colorScheme.palette.base08};
      	background-color: #${colorScheme.palette.base01};
      }

      #pulseaudio {
      	color: #${colorScheme.palette.base09};
      }

      #pulseaudio.muted {
      	color: #${colorScheme.palette.base08};
      	background-color: #${colorScheme.palette.base01};
      }

      #tray {
      }

      #tray>.needs-attention {
      	background-color: #${colorScheme.palette.base07};
      	color: #${colorScheme.palette.base01};
      }

      #custom-notifications {
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
        margin-top = 8;
        margin-right = 12;
        margin-left = 12;
        margin-bottom = 0;

        modules-left = [
          "hyprland/workspaces"
          "cpu"
          "memory"
          "battery"
          "backlight"
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "tray"
          "custom/notifications"
          "network"
          "pulseaudio"
          "pulseaudio#microphone"
          "clock#date"
          "clock#time"
        ];
        "hyprland/window" = {
          format = "{title}";
          max-length = 35;
          rewrite = {
            "" = " hyprland";
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
          scroll-step = 2;
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
          format = "<span color='#${colorScheme.palette.base05}'>󰃭 </span>{:%a, %d %b}";
          tooltip-format = "<tt>{calendar}</tt>";

          calendar = {
            mode = "month";
            mode-mon-col = 6;
            on-click-right = "mode";

            format = {
              months = "<span color='#${colorScheme.palette.base05}'><b>{}</b></span>";
              weekdays = "<span color='#${colorScheme.palette.base03}'>{}</span>";
              today = "<span color='#${colorScheme.palette.base08}'><b><u>{}</u></b></span>";
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
          format = "<span color='#${colorScheme.palette.base07}'>󱑂 </span>{:%R}";
          tooltip = false;
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
