return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
      -- Desativa os mapeamentos padrão
      vim.g.VM_default_mappings = 0

      -- Define mapeamentos personalizados
      vim.g.VM_maps = {
        ["Select Cursor Up"] = "<C-M-Up>", -- Ctrl + Option + Up
        ["Select Cursor Down"] = "<C-M-Down>", -- Ctrl + Option + Down
        ["Find Under"] = "<C-d>", -- Ctrl + d
        ["Find Subword Under"] = "<C-d>", -- Ctrl + d
      }
    end,
  },
}
