return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },
    opts = function()
      local icons = LazyVim.config.icons

      local function full_path()
        return vim.fn.expand("%:p")
      end

      local function os_icon()
        local icons = {
          unix = "", -- e712
          dos = "", -- e70f
          mac = "", -- e711
        }
        if vim.fn.has("mac") == 1 then
          return icons.mac
        elseif vim.fn.has("win32") == 1 then
          return icons.dos
        else
          return icons.unix
        end
      end

      return {
        options = {
          theme = "horizon",
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          icons_enabled = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = {
            "lsp_client_name",
            "encoding",
            os_icon,
            {
              "copilot",
              symbols = {
                enabled = " ",
                disabled = " ",
              },
              show_colors = true,
            },
            "filetype",
          },
          lualine_y = { "location", "progress" },
          lualine_z = {},
        },
        inactive_sections = {
          lualine_c = { "filename" },
          lualine_x = { full_path },
        },
      }
    end,
  },
}
