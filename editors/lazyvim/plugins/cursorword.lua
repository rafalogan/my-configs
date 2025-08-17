return {
  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    init = function()
      vim.api.nvim_create_augroup("user_plugin_cursorword", { clear = true })
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = "user_plugin_cursorword",
        pattern = { "NvimTree", "lspsagafinder", "dashboard", "vista" },
        callback = function()
          vim.b.cursorword = false
        end,
      })
      vim.api.nvim_create_autocmd({ "WinEnter" }, {
        group = "user_plugin_cursorword",
        callback = function()
          if vim.wo.diff or vim.wo.previewwindow then
            vim.b.cursorword = false
          end
        end,
      })
      vim.api.nvim_create_autocmd({ "InsertEnter" }, {
        group = "user_plugin_cursorword",
        callback = function()
          vim.b.cursorword = false
        end,
      })
      vim.api.nvim_create_autocmd({ "InsertLeave" }, {
        group = "user_plugin_cursorword",
        callback = function()
          vim.b.cursorword = true
        end,
      })
    end,
  },
}
