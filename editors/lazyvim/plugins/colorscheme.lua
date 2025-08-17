return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "storm", -- Opções: "storm", "moon", "night", "day"
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "storm",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
