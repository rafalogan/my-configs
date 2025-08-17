return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs({ "javascript", "typescript", "json", "yaml", "markdown" }) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        table.insert(opts.formatters_by_ft[ft], "prettier")
      end
      opts.formatters = opts.formatters or {}
      opts.formatters.prettier = {
        condition = function(_, ctx)
          return vim.fn.filereadable(vim.fn.findfile(".prettierrc", ctx.bufname)) == 1
        end,
      }
    end,
  },
}
