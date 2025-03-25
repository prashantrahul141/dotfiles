{ lib, ... }:
{
  programs.nixvim = {

    keymaps =
      [

        # terminal
        {
          mode = "n";
          key = "<c-t>";
          action = ":FloatermToggle<CR>";
          options = {
            silent = true;
            desc = "Terminal";
          };
        }

        # flash:
        {
          mode = [
            "n"
            "x"
            "o"
          ];
          key = "s";
          action = "function() require(\"flash\").jump() end";
          lua = true;
          options = {
            silent = true;
            desc = "Flash";
          };
        }

        # flash: Treesitter
        {
          mode = [
            "n"
            "x"
            "o"
          ];
          key = "S";
          action = "function() require(\"flash\").treesitter() end";
          lua = true;
          options = {
            silent = true;
            desc = "Flash Treesitter";
          };
        }

        # oil mapping for file tree
        {
          action = ":Oil<CR>";
          key = "<leader>o";
          options = {
            silent = true;
            noremap = true;
            desc = "Oil Mapping";
          };
        }
        {
          action = "<cmd>CHADopen<CR>";
          key = "<C-n>";
          options = {
            silent = true;
          };
        }

        # go to definition
        {
          action = ":lua vim.lsp.buf.definition()<CR>";
          key = "<leader>gd";
          options = {
            silent = true;
            noremap = true;
            desc = "Go to definition";
          };
        }

        # Go to references
        {
          action = ":lua vim.lsp.buf.references()<CR>";
          key = "<leader>gr";
          options = {
            silent = true;
            noremap = true;
            desc = "Go to references";
          };
        }

        # Telescope search (live grep)
        {
          action = ":Telescope live_grep<CR>";
          key = "<leader>fw";
          options = {
            silent = true;
            noremap = true;
            desc = "Search grep";
          };
        }
        # Telescope undo tree
        {
          action = ":Telescope undo<CR>";
          key = "<leader>u";
          options = {
            silent = true;
            noremap = true;
            desc = "Undo tree";
          };
        }

        {
          action = ":Telescope diagnostics<CR>";
          key = "<leader>fd";
          options = {
            silent = true;
            noremap = true;
            desc = "Diagnostics";
          };
        }

        {
          mode = [
            "n"
            "x"
            "o"
          ];
          key = "<leader>ca";
          action = "function() vim.lsp.buf.code_action() end";
          lua = true;
          options = {
            silent = true;
            desc = "Accept code action";
          };
        }

        # Telescope diagnostics
        {
          action = ":Telescope diagnostics<CR>";
          key = "<leader>fd";
          options = {
            silent = true;
            noremap = true;
            desc = "Diagnostics";
          };
        }
        # Telescope quickfixlist
        {
          action = ":Telescope quickfix<CR>";
          key = "<leader>q";
          options = {
            silent = true;
            noremap = true;
            desc = "Quickfix list";
          };
        }

        # Telescope search files
        {
          action = ":Telescope find_files<CR>";
          key = "<leader>ff";
          options = {
            silent = true;
            noremap = true;
            desc = "Search files";
          };
        }

        # Telescope search commands
        {
          action = ":Telescope command_history<CR>";
          key = "<leader>fc";
          options = {
            silent = true;
            noremap = true;
            desc = "Search commands";
          };
        }

        # Telescope buffer
        {
          action = ":Telescope current_buffer_fuzzy_find<CR>";
          key = "<leader>fb";
          options = {
            silent = true;
            noremap = true;
            desc = "Search current buffer";
          };
        }
        {
          action = "q";
          key = "q";
          options = {
            silent = true;
            noremap = true;
            desc = "record macro";
          };
        }

        # Mapping Ctrl+V for block visual mode
        {
          action = "<C-v>";
          key = "<C-v>";
          options = {
            silent = true;
            noremap = true;
            desc = "visual block mode";
          };
        }

        # Buffers
        {
          action = ":BufferNext<CR>";
          key = "<C-Tab>";
          options = {
            silent = true;
            noremap = true;
            desc = "Next buffer";
          };
        }

        {
          action = ":BufferPrevious<CR>";
          key = "<S-Tab>";
          options = {
            silent = true;
            noremap = true;
            desc = "Prev buffer";
          };
        }

        {
          action = "::";
          key = "<S-Tab>";
          options = {
            silent = true;
            noremap = true;
            desc = "Prev buffer";
          };
        }

        # comment: line
        {
          mode = [
            "n"
          ];
          key = "<leader>/";
          action = "function() require(\"Comment.api\").toggle.linewise.current() end";
          lua = true;
          options = {
            silent = true;
            desc = "comment line";
          };
        }
        # comment: block
        {
          mode = [
            "v"
          ];
          key = "<leader>/";
          action = "function() require(\"Comment.api\").toggle.linewise(vim.fn.visualmode()) end";
          lua = true;
          options = {
            silent = true;
            desc = "comment lines in visual";
          };
        }

        # force reformat
        {
          mode = [
            "n"
          ];
          key = "<leader>fm";
          action = "function() vim.lsp.buf.format { async = true } end";
          lua = true;
          options = {
            silent = true;
            desc = "format";
          };
        }

      ]
      ++
        lib.mapAttrsToList
          (key: action: {
            mode = "n";
            options = {
              silent = true;
              desc =
                let
                  descriptions = {
                    "<Space>" = "No operation";
                    "<esc>" = "Esc to clear search results";
                    "Y" = "Fix Y behaviour to yank to the end of the line";
                    "<C-c>" = "Back and forth between the two most recent files";
                    "<C-x>" = "Close the current window";
                    "<C-s>" = "Save the current file";
                    "<C-h>" = "Navigate to the left window";
                    "<C-l>" = "Navigate to the right window";
                    "<C-Up>" = "Resize the current window upwards";
                    "<C-Down>" = "Resize the current window downwards";
                    "<C-Left>" = "Resize the current window to the left";
                    "<C-Right>" = "Resize the current window to the right";
                    "<leader>tr" = "Open file manager";
                    "<leader>tl" = "Open lazygit";
                  };
                in
                descriptions.${key} or "No description";
            };
            inherit action key;
          })
          {
            "<Space>" = "<NOP>";
            "<esc>" = ":noh<CR>";
            "Y" = "y$";
            "<C-c>" = ":b#<CR>";
            "<C-x>" = ":close<CR>";
            "<C-s>" = ":w<CR>";
            "<C-h>" = "<C-w>h";
            "<C-l>" = "<C-w>l";
            "<C-Up>" = ":resize -2<CR>";
            "<C-Down>" = ":resize +2<CR>";
            "<C-Left>" = ":vertical resize +2<CR>";
            "<C-Right>" = ":vertical resize -2<CR>";
            "j" = ''gj'';
            "k" = ''gk'';
            "<Up>" = ''gk'';
            "<Down>" = ''gj'';
            "<leader>tr" = ":FloatermNew yazi<CR>";
            "<leader>tl" = ":FloatermNew lazygit<CR>";
          }
      ++
        lib.mapAttrsToList
          (key: action: {
            mode = "v";
            options = {
              silent = true;
              desc =
                let
                  descriptions = {
                    ">" = "Indent selected text to the right";
                    "<" = "Indent selected text to the left";
                    "<TAB>" = "Indent selected text to the right";
                    "<S-TAB>" = "Indent selected text to the left";
                    "K" = "Move selected line/block of text up";
                    "J" = "Move selected line/block of text down";
                  };
                in
                descriptions.${key} or "No description";
            };
            inherit action key;
          })
          {
            ">" = ">gv";
            "<" = "<gv";
            "<TAB>" = ">gv";
            "<S-TAB>" = "<gv";
            "K" = ":m '<-2<CR>gv=gv";
            "J" = ":m '>+1<CR>gv=gv";
            "p" = ''p:let @+=@0<CR>:let @"=@0<CR>'';

          };
  };
}
