return {
  {
    "rmagatti/goto-preview",
    event = "BufEnter",
    config = function()
      require("goto-preview").setup({
        width = 120, -- Largura da janela flutuante
        height = 25, -- Altura da janela flutuante
        default_mappings = false, -- Não vincular mapeamentos padrão
        debug = false, -- Desativar informações de depuração
        opacity = nil, -- Opacidade da janela flutuante (0-100)
        post_open_hook = nil, -- Função executada após abrir a janela
      })
    end,
  },
}
