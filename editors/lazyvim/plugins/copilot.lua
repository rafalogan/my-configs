return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Aceitar sugestão com <Tab>
      vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
    end,
  },
  { "AndreM222/copilot-lualine" },
}
