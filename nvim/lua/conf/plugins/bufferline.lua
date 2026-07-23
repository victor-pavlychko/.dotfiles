return {
  'akinsho/bufferline.nvim',
  version = "*",
  
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    "nvim-mini/mini.bufremove",
  },

  opts = function()
    local function safe_delete(bufnr)
      require("mini.bufremove").delete(bufnr, false)
    end

    return {
      options = {
        mode = "buffers",
        themable = true,
        always_show_bufferline = true,

        -- diagnostics = "nvim_lsp",
        -- separator_style = "none",
        -- show_buffer_close_icons = true,
        -- show_close_icon = false,

        -- Avoid bufferline's default force-delete behavior.
        close_command = safe_delete,
        right_mouse_command = safe_delete,
        middle_mouse_command = safe_delete,

        -- Leave an explorer-sized gap above Neo-tree instead of
        -- drawing file tabs across the top of the sidebar.
        offsets = {
          {
            filetype = "neo-tree",
            -- text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
            separator = true,
          },
        },

        -- custom_areas = {
        --   right = require("visual_studio_code").get_bufferline_right(),
        -- },

        -- diagnostics_indicator = function(count, level)
        --   local icon = level:match("error") and " "
        --     or level:match("warning") and " "
        --     or " "
        --
        --   return " " .. icon .. count
        -- end,
      },
    }
  end,
}
