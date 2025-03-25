{ starship, ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";

    settings = {
      manager = {
        show_hidden = true;
        ratio = [
          1
          2
          2
        ];
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };

    theme = (import  ./theme.nix {} );

    keymap = {
      manager.prepend_keymap = [
        {
           on   = "<Esc>";
           run  = "close";
           desc = "Cancel input";
        }
        {
          on = "!";
          run = ''shell --interactive "$SHELL" --block'';
          desc = "Open shell here";
        }
        {
          on = "q";
          run = "close";
          desc = "Close the current tab, or quit if it's last";
        }
        {
          on = "T";
          run = "plugin toggle-pane max-preview";
          desc = "Maximize or restore the preview pane";
        }
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
      ];
    };
  };
}
