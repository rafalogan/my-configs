return {
  "NStefan002/visual-surround.nvim",
  event = "VeryLazy",
  config = function()
    require("visual-surround").setup({
      use_default_keymaps = true, -- ativa o comportamento padrão
      surround_chars = { "{", "}", "[", "]", "(", ")", "'", '"', "`", "<", ">" },
      exit_visual_mode = true,
    })
  end,
}
