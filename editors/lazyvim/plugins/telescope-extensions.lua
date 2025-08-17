return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "tami5/sqlite.lua" },
    lazy = true,
  },
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("neoclip").setup()
    end,
    lazy = true,
  },
}
