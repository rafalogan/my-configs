return {
  {
    "nvimtools/none-ls.nvim",
    event = "LazyFile",
    dependencies = { "mason.nvim" },
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.root_dir = opts.root_dir
        or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.prettier,
        nls.builtins.diagnostics.eslint,
        nls.builtins.diagnostics.flake8,
        nls.builtins.formatting.black,
        nls.builtins.formatting.shfmt,
      })
    end,
  },
}
