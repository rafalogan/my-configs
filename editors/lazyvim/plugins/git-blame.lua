return {
  "f-person/git-blame.nvim",
  event = "BufRead",
  opts = {
    enabled = true,
    message_template = " <summary> • <date> • <author> • <<sha>>",
    date_format = "%m-%d-%Y %H:%M",
    virtual_text_column = 1,
  },
  config = function(_, opts)
    require("gitblame").setup(opts)
    vim.cmd("highlight default link gitblame SpecialComment")
  end,
}
