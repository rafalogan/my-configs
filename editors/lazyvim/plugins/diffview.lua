return {
  "sindrets/diffview.nvim",
  event = "BufRead",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
  config = function()
    require("diffview").setup({})
  end,
}
