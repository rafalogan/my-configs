return {
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        hint_enable = true,
        handler_opts = {
          border = "rounded",
        },
        floating_window = true,
        hint_prefix = " ",
        hint_scheme = "String",
        hi_parameter = "Search",
      })
    end,
  },
}
