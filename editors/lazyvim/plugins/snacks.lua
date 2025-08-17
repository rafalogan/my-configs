return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true, -- Exibe arquivos ocultos (dotfiles)
          ignored = true, -- Exibe arquivos/pastas ignorados pelo Git
        },
      },
    },
  },
}
