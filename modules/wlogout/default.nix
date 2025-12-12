{ colorScheme, ... }:
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        "label" = "lock";
        "action" = "hyprlock --immediate";
        "text" = "  Lock (L)  ";
        "keybind" = "l";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = " Reboot (R) ";
        "keybind" = "r";
      }
      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = "Shutdown (S)";
        "keybind" = "s";
      }
      {
        "label" = "logout";
        "action" = "uwsm stop";
        "text" = " Logout (E) ";
        "keybind" = "e";
      }
      {
        "label" = "suspend";
        "action" = "systemctl suspend -i; hyprlock --immediate";
        "text" = " Suspend (Z)";
        "keybind" = "z";
      }
    ];

    style =
      let
        lock = builtins.path { path = ./lock.png; };
        lock-hover = builtins.path { path = ./lock-hover.png; };

        logout = builtins.path { path = ./logout.png; };

        logout-hover = builtins.path { path = ./logout-hover.png; };

        power = builtins.path { path = ./power.png; };

        power-hover = builtins.path { path = ./power-hover.png; };

        restart = builtins.path { path = ./restart.png; };

        restart-hover = builtins.path { path = ./restart-hover.png; };

        sleep = builtins.path { path = ./sleep.png; };

        sleep-hover = builtins.path { path = ./sleep-hover.png; };

        windows = builtins.path { path = ./windows.png; };

        windows-hover = builtins.path { path = ./windows-hover.png; };
      in
      ''
        window {
            font-family: FiraCode Nerd Font;
            color: #fff;
            font-size: 12pt;
            background-color: #${colorScheme.palette.base00};
        }

        button:hover {
            background-color: #${colorScheme.palette.base07};
            color: #${colorScheme.palette.base00};
        }

        button:focus {
            background-color: #${colorScheme.palette.base07};
            color: #${colorScheme.palette.base00};
        }

        button {
            background-repeat: no-repeat;
            background-position: center;
            background-size: 20%;
            border-style: solid;
            border-radius: 4px;
            border-width: 2px;
            border-color: #${colorScheme.palette.base07};
            background-color: #${colorScheme.palette.base00};
            margin: 10px;
            text-shadow: none;
            color: #${colorScheme.palette.base07};
            transition:
                box-shadow 0.3s ease-in-out,
                background-color 0.3s ease-in-out,
                color 0.3s ease-in-out;
        }


        #lock {
            background-image: image(url("${lock}"));
        }

        #lock:focus {
            background-image: image(url("${lock-hover}"));
        }

        #lock:hover {
            background-image: image(url("${lock-hover}"));
        }

        #logout {
            background-image: image(url("${logout}"));
        }

        #logout:focus {
            background-image: image(url("${logout-hover}"));
        }

        #logout:hover {
            background-image: image(url("${logout-hover}"));
        }

        #suspend {
            background-image: image(url("${sleep}"));
        }

        #suspend:focus {
            background-image: image(url("${sleep-hover}"));
        }

        #suspend:hover {
            background-image: image(url("${sleep-hover}"));
        }

        #shutdown {
            background-image: image(url("${power}"));
        }

        #shutdown:focus {
            background-image: image(url("${power-hover}"));
        }

        #shutdown:hover {
            background-image: image(url("${power-hover}"));
        }

        #reboot {
            background-image: image(url("${restart}"));
        }

        #reboot:focus {
            background-image: image(url("${restart-hover}"));
        }

        #reboot:hover {
            background-image: image(url("${restart-hover}"));
        }

        #windows {
            background-image: image(url("${windows}"));
        }

        #windows:focus {
            background-image: image(url("${windows-hover}"));
        }

        #windows:hover {
            background-image: image(url("${windows-hover}"));
        }
      '';
  };
}
