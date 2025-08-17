return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      always_show_bufferline = true,
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}
