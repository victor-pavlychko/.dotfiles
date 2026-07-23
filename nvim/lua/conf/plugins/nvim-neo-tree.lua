return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = false,

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    sources = {
      "filesystem",
      "buffers",
      "git_status",
    },

    source_selector = {
      winbar = false,
      statusline = true,
    },

    window = {
      position = "left",
      width = 40,
    },

    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },

      -- Automatically notice files created outside Neovim.
      use_libuv_file_watcher = true,

      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_hidden = false,
      },

      window = {
        mappings = {
          ["<cr>"] = "open",
          -- ["l"] = "open",
          -- ["h"] = "close_node",
          -- ["v"] = "open_vsplit",
          -- ["s"] = "open_split",
          -- ["t"] = "open_tabnew",
          -- ["a"] = "add",
          -- ["A"] = "add_directory",
          -- ["d"] = "delete",
          -- ["r"] = "rename",
          -- ["y"] = "copy_to_clipboard",
          -- ["x"] = "cut_to_clipboard",
          -- ["p"] = "paste_from_clipboard",
          -- ["H"] = "toggle_hidden",
          ["R"] = "refresh",
          ["?"] = "show_help",
        },
      },
    },
  },
}
