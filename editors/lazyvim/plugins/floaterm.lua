return {
  "voldikss/vim-floaterm",
  cmd = { "FloatermNew", "FloatermToggle", "FloatermKill", "FloatermNext", "FloatermPrev" },
  keys = {
    { "<C-\\>", "<cmd>FloatermToggle<CR>", mode = { "n", "t" }, desc = "Alternar Floaterm" },
    { "<C-d>", "<cmd>FloatermKill<CR>", mode = { "n", "t" }, desc = "Fechar Floaterm" },
    { "<C-l>", "<cmd>FloatermNext<CR>", mode = { "n", "t" }, desc = "Próximo Floaterm" },
    { "<C-k>", "<cmd>FloatermPrev<CR>", mode = { "n", "t" }, desc = "Floaterm Anterior" },
  },
  init = function()
    vim.g.floaterm_position = "center"
    vim.g.floaterm_width = 0.9
    vim.g.floaterm_height = 0.8
    vim.g.floaterm_title = "Terminal ($1/$2)"
    vim.g.floaterm_autoclose = 1
  end,
}
