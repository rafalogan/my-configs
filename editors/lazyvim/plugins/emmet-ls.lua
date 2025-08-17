return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {
          filetypes = {
            "html",
            "css",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "eruby",
            "svelte",
            "vue",
            "twig",
            "ejs",
            "scss",
            "less",
            "hbs",
          },
          init_options = {
            html = {
              options = {
                ["bem.enabled"] = true,
              },
            },
          },
        },
      },
    },
  },
}
