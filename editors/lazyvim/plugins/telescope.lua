return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        initial_mode = "insert",
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "bottom",
          width = 0.95,
          preview_cutoff = 75,
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      -- Carregar extensões após o setup
      pcall(telescope.load_extension, "frecency")
      pcall(telescope.load_extension, "neoclip")
      pcall(telescope.load_extension, "fzf")
    end,
  },
}
