return {
  "nvim-pack/nvim-spectre",
  event = "BufRead",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("spectre").setup()
  end,
}
