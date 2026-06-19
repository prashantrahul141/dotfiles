{
  pkgs,
  lib,
  ...
}:
let
  lua = lib.generators.mkLuaInline;
  dsp = {
    exec = cmd: lua ''hl.dsp.exec_cmd("uwsm app -- ${cmd}")'';
    close = lua "hl.dsp.window.close()";
    float = lua ''hl.dsp.window.float({ action = "toggle" })'';
    fullscreen = lua "hl.dsp.window.fullscreen()";
    pseudo = lua "hl.dsp.window.pseudo()";
    layout = msg: lua ''hl.dsp.layout("${msg}")'';
    focus = dir: lua ''hl.dsp.focus({ direction = "${dir}" })'';
    swap = dir: lua ''hl.dsp.window.swap({ direction = "${dir}" })'';
    toggleSpecial = name: lua ''hl.dsp.workspace.toggle_special("${name}")'';
    moveToSpecial = name: lua ''hl.dsp.window.move({ workspace = "special:${name}" })'';
    focusWorkspace = ws: lua ''hl.dsp.focus({ workspace = "${toString ws}" })'';
    moveToWorkspace = ws: lua ''hl.dsp.window.move({ workspace = "${toString ws}" })'';
    drag = lua "hl.dsp.window.drag()";
    resize = lua "hl.dsp.window.resize()";
    resizeBy =
      x: y:
      lua ''
        hl.dsp.window.resize({
          x = ${toString x},
          y = ${toString y},
          relative = true,
        })
      '';
    sendshortcut = mod: key: lua ''hl.dsp.send_shortcut({ mods = "${mod}", key = "${key}" })'';
  };
  bind = keys: dispatcher: {
    _args = [
      keys
      dispatcher
    ];
  };
  bindOpts = keys: dispatcher: opts: {
    _args = [
      keys
      dispatcher
      opts
    ];
  };
  workspaceBinds = lib.concatMap (
    i:
    let
      key = toString (lib.mod i 10);
    in
    [
      (bind "SUPER + ${key}" (dsp.focusWorkspace i))
      (bind "SUPER + SHIFT + ${key}" (dsp.moveToWorkspace i))
    ]
  ) (lib.range 1 10);

in
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd.enable = false; # only required if uwsm is used.

    settings = {
      config = {
        general = {
          gaps_in = 4;
          gaps_out = 10;
          border_size = 2;
          resize_on_border = true;
          hover_icon_on_border = true;
          extend_border_grab_area = true;
          no_focus_fallback = true;
          allow_tearing = false;
        };

        # https://wiki.hyprland.org/Configuring/Variables/#decoration
        decoration = {
          rounding = 0;
          active_opacity = 0.97;
          inactive_opacity = 0.93;

          blur = {
            enabled = true;
            size = 8;
            passes = 1;
            vibrancy = 0.12;
          };
        };

        animations = {
          enabled = true;
        };

        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        dwindle = {
          force_split = 2; # always on right
          preserve_split = true; # You probably want this
          smart_split = false;
          precise_mouse_move = true;

        };

        # https://wiki.hyprland.org/Configuring/Variables/#misc
        misc = {
          focus_on_activate = true;
          disable_splash_rendering = true;
          force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
          disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
        };

        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_options = "";
          kb_rules = "";
          repeat_rate = 35;
          repeat_delay = 350;
          follow_mouse = 1;
          sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
          touchpad = {
            natural_scroll = true;
            scroll_factor = 0.25;
          };
        };

        gestures = {
          # workspace_swipe_distance = 300;
          workspace_swipe_touch = true;
        };
      };

      # MANAGED USING UWSM NOW.
      # MOVED TO home/$USER/files.nix
      #    "env" = [
      #    ];
      #

      # Multi Monitor setup
      #      workspace = [
      #        "1,monitor:eDP-1"
      #        "2,monitor:eDP-1"
      #        "5,monitor:eDP-1"
      #        "3,monitor:HDMI-A-1"
      #        "4,monitor:HDMI-A-1"
      #      ];

      #      binds = {
      #        scroll_event_delay = 0;
      #      };
      #
      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      #    master = {
      #      new_status = "master";
      #    };

      gesture = [
        {
          _args = [
            {
              fingers = 3;
              direction = "horizontal";
              action = "workspace";
            }
          ];
        }
      ];

      curve = [
        {
          _args = [
            "md3_standard"
            {
              type = "bezier";
              points = lua "{ {0.2, 0}, {0, 1} }";
            }
          ];
        }

        {
          _args = [
            "md3_decel"
            {
              type = "bezier";
              points = lua "{ {0.05, 0.7}, {0.1, 1} }";
            }
          ];
        }

        {
          _args = [
            "md3_accel"
            {
              type = "bezier";
              points = lua "{ {0.3, 0}, {0.8, 0.15} }";
            }
          ];
        }

        {
          _args = [
            "overshot"
            {
              type = "bezier";
              points = lua "{ {0.05, 0.8}, {0.1, 1.02} }";
            }
          ];
        }

        {
          _args = [
            "crazyshot"
            {
              type = "bezier";
              points = lua "{ {0.1, 1.0}, {0.76, 0.92} }";
            }
          ];
        }

        {
          _args = [
            "hyprnostretch"
            {
              type = "bezier";
              points = lua "{ {0.05, 0.9}, {0.1, 1.0} }";
            }
          ];
        }

        {
          _args = [
            "menu_decel"
            {
              type = "bezier";
              points = lua "{ {0.1, 1}, {0, 1} }";
            }
          ];
        }

        {
          _args = [
            "menu_accel"
            {
              type = "bezier";
              points = lua "{ {0.38, 0.04}, {1, 0.07} }";
            }
          ];
        }

        {
          _args = [
            "easeInOutCirc"
            {
              type = "bezier";
              points = lua "{ {0.85, 0}, {0.15, 1} }";
            }
          ];
        }

        {
          _args = [
            "easeOutCirc"
            {
              type = "bezier";
              points = lua "{ {0, 0.55}, {0.45, 1} }";
            }
          ];
        }

        {
          _args = [
            "easeOutExpo"
            {
              type = "bezier";
              points = lua "{ {0.16, 1}, {0.3, 1} }";
            }
          ];
        }

        {
          _args = [
            "softAcDecel"
            {
              type = "bezier";
              points = lua "{ {0.26, 0.26}, {0.15, 1} }";
            }
          ];
        }

        {
          _args = [
            "md2"
            {
              type = "bezier";
              points = lua "{ {0.4, 0}, {0.2, 1} }";
            }
          ];
        }

        {
          _args = [
            "gentle_spring"
            {
              type = "bezier";
              points = lua "{ {0.3, 1.1}, {0.4, 1} }";
            }
          ];
        }

        {
          _args = [
            "easeoutexpo"
            {
              type = "bezier";
              points = lua "{ {0.16, 1}, {0.3, 1} }";
            }
          ];
        }
      ];

      animation = [
        {
          leaf = "windows";
          enabled = true;
          speed = 3.6;
          bezier = "gentle_spring";
          style = "popin 60%";
        }

        {
          leaf = "windowsIn";
          enabled = true;
          speed = 3.6;
          bezier = "gentle_spring";
          style = "popin 60%";
        }

        {
          leaf = "windowsOut";
          enabled = true;
          speed = 7;
          bezier = "easeoutexpo";
          style = "popin 50%";
        }

        {
          leaf = "border";
          enabled = true;
          speed = 10;
          bezier = "default";
        }

        {
          leaf = "fade";
          enabled = true;
          speed = 3.6;
          bezier = "md3_decel";
        }

        {
          leaf = "layers";
          enabled = true;
          speed = 2.6;
          bezier = "md3_decel";
          style = "slide";
        }

        {
          leaf = "layersIn";
          enabled = true;
          speed = 3.6;
          bezier = "menu_decel";
          style = "slide";
        }

        {
          leaf = "layersOut";
          enabled = true;
          speed = 2.2;
          bezier = "menu_accel";
        }

        {
          leaf = "fadeLayersIn";
          enabled = true;
          speed = 2.6;
          bezier = "gentle_spring";
        }

        {
          leaf = "fadeLayersOut";
          enabled = true;
          speed = 1.1;
          bezier = "menu_accel";
        }

        {
          leaf = "workspaces";
          enabled = true;
          speed = 3.1;
          bezier = "softAcDecel";
          style = "slide";
        }

        {
          leaf = "workspaces";
          enabled = true;
          speed = 5.6;
          bezier = "menu_decel";
        }

        {
          leaf = "specialWorkspace";
          enabled = true;
          speed = 3.6;
          bezier = "gentle_spring";
          style = "slidefadevert 15%";
        }

        {
          leaf = "specialWorkspace";
          enabled = true;
          speed = 3.6;
          bezier = "gentle_spring";
          style = "slidevert";
        }
      ];

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      device = [
        {
          name = "razer-razer-deathadder-essential";
          sensitivity = -1.0;
        }
        {
          name = "razer-razer-deathadder-essential-1";
          sensitivity = -1.0;
        }
      ];

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = [
        (bind "SUPER + RETURN" (dsp.exec "wezterm"))
        (bind "SUPER + E" (dsp.exec "wezterm yazi"))

        # (bind "SUPER + B" (dsp.exec "brave --password-store=gnome-libsecret"))
        (bind "SUPER + B" (dsp.exec "firefox"))

        (bind "SUPER + SPACE" (dsp.exec "wofi --show drun"))

        # Window management
        (bind "SUPER + Q" dsp.close)
        (bind "SUPER + T" dsp.float)
        (bind "SUPER + F" dsp.fullscreen)
        (bind "SUPER + SHIFT + T" (dsp.layout "togglesplit"))

        # Move focus with mainMod + arrow keys
        (bind "SUPER + left" (dsp.focus "left"))
        (bind "SUPER + H" (dsp.focus "left"))
        (bind "SUPER + right" (dsp.focus "right"))
        (bind "SUPER + L" (dsp.focus "right"))
        (bind "SUPER + up" (dsp.focus "up"))
        (bind "SUPER + K" (dsp.focus "up"))
        (bind "SUPER + down" (dsp.focus "down"))
        (bind "SUPER + J" (dsp.focus "down"))

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        (bind "SUPER + SHIFT + 1" (dsp.moveToWorkspace "1"))
        (bind "SUPER + SHIFT + 2" (dsp.moveToWorkspace "2"))
        (bind "SUPER + SHIFT + 3" (dsp.moveToWorkspace "3"))
        (bind "SUPER + SHIFT + 4" (dsp.moveToWorkspace "4"))
        (bind "SUPER + SHIFT + 5" (dsp.moveToWorkspace "5"))
        (bind "SUPER + SHIFT + 6" (dsp.moveToWorkspace "6"))
        (bind "SUPER + SHIFT + 7" (dsp.moveToWorkspace "7"))
        (bind "SUPER + SHIFT + 8" (dsp.moveToWorkspace "8"))
        (bind "SUPER + SHIFT + 9" (dsp.moveToWorkspace "9"))
        (bind "SUPER + SHIFT + 0" (dsp.moveToWorkspace "10"))

        # Screenshot a monitor
        (bind "PRINT" (dsp.exec "uwsm app -- hyprshot -z -m output"))

        # Screenshot a window
        (bind "SUPER + PRINT" (dsp.exec "uwsm app -- hyprshot -z -m window"))

        # Screenshot a region with hyprshot
        (bind "SUPER + SHIFT + PRINT" (dsp.exec "uwsm app -- hyprshot -z -m region"))

        # Screenshot a region using flameshot
        (bind "SUPER + SHIFT + s" (
          dsp.exec "uwsm app -- flameshot gui -r --path ~/Pictures/Screenshots | wl-copy"
        ))

        # clipboard
        (bind "SUPER + V" (dsp.exec "uwsm app -- cliphist list | wofi --dmenu | cliphist decode | wl-copy"))

        # logout menu
        (bind "SUPER + ESCAPE" (dsp.exec "uwsm app -- wlogout"))

        # wallpaper
        (bind "SUPER + W" (
          dsp.exec "uwsm app -- bash ${builtins.path { path = ../hyprpaper/switch-wallpaper.sh; }}"
        ))

        # Mouse move/resize
        (bindOpts "SUPER + mouse:272" dsp.drag { mouse = true; })
        (bindOpts "SUPER + mouse:273" dsp.resize { mouse = true; })

        # resize active window with super + shift + h/j/k/l
        (bindOpts "SUPER + SHIFT + h" (dsp.resizeBy (-40) 0) { repeating = true; })
        (bindOpts "SUPER + SHIFT + l" (dsp.resizeBy 40 0) { repeating = true; })
        (bindOpts "SUPER + SHIFT + j" (dsp.resizeBy 0 40) { repeating = true; })
        (bindOpts "SUPER + SHIFT + k" (dsp.resizeBy 0 (-40)) { repeating = true; })

        # Laptop multimedia keys for volume and LCD brightness
        (bind "XF86AudioRaiseVolume" (dsp.exec "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
        (bind "XF86AudioLowerVolume" (dsp.exec "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"))
        (bind "XF86AudioMute" (dsp.exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
        (bind "XF86AudioMicMute" (dsp.exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
        (bind "XF86MonBrightnessUp" (dsp.exec "brightnessctl s 5%+"))
        (bind "XF86MonBrightnessDown" (dsp.exec "brightnessctl s 5%-"))

      ]
      ++ workspaceBinds;

      window_rule = [
        {
          match = {
            class = ".*";
          };

          suppress_event = "maximize";
        }

        {
          match = {
            class = "openrgb";
          };
          float = true;
        }

        {
          match = {
            class = "brave-nngceckbapebfimnlniiiahkandclblb-Default";
          };
          float = true;
        }

        {
          match = {
            title = "Open Files";
          };
          float = true;
        }

        {
          match = {
            class = "xdg-desktop-portal-gtk";
          };
          float = true;
        }

        {
          match = {
            class = "nwg-*";
          };
          float = true;
        }

        {
          match = {
            class = "qemu";
          };
          float = true;
        }

        {
          match = {
            class = "swayimg";
          };
          float = true;
        }

        {
          match = {
            title = "marked-floating";
          };
          float = true;
        }

        {
          match = {
            title = "Select what to share";
          };
          float = true;
        }
        {
          match = {
            class = "^$";
            title = "^$";
            xwayland = 1;
            float = 1;
            fullscreen = 0;
            pin = 0;
          };
          no_focus = true;
        }

      ];

      # hl.exec_cmd("uwsm app -- foot --server")
      # hl.exec_cmd("uwsm app -- fcitx5")
      # hl.exec_cmd("uwsm app -- openrgb --device 1 --mode static --brightness 0 --color ACB5FB")
      on = {
        _args = [
          "hyprland.start"
          (lua ''
            function()
              hl.exec_cmd("systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
              hl.exec_cmd("uwsm app -- dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
              hl.exec_cmd("uwsm app -- dunst")
              hl.exec_cmd("uwsm app -- ${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent")
              hl.exec_cmd("uwsm app -- wl-paste --watch cliphist store")
              hl.exec_cmd("uwsm app -- nm-applet --indicator")
              hl.exec_cmd("uwsm app -- blueman-applet")
              hl.exec_cmd("uwsm app -- udiskie")
              hl.exec_cmd("uwsm app -- waybar")
            end
          '')
        ];
      };
    };

    # PLEASE MAKE SURE YOU GENERATE THESE FILES USING NWG-DISPLAYS
    # BEFORE SOURCING THEM, TILL THEN USE NORMAL MONITOR CONFIG
    extraConfig = ''
      require("monitors")
      require("workspaces")

      --# Zoom
      local function zoomfunction(value)
          local zoomvalue = hl.get_config("cursor:zoom_factor")
          if (zoomvalue + value) > 3.0 then
              hl.config({ cursor = { zoom_factor = 3.0 } })
          elseif (zoomvalue + value) < 1.0 then
              hl.config({ cursor = { zoom_factor = 1.0 } })
          else
              hl.config({ cursor = { zoom_factor = zoomvalue + value } })
          end
      end
      hl.bind("SUPER + mouse_up", function() zoomfunction(-0.6) end, { description = "Screen: Zoom out" })
      hl.bind("SUPER + mouse_down", function() zoomfunction(0.6) end, { description = "Screen: Zoom in" })
    '';
  };
}
