return {
  "nacro90/numb.nvim",
  event = "BufRead",
  config = function()
    require("numb").setup({
      show_numbers = true, -- Ativa a exibição de números de linha durante a visualização
      show_cursorline = true, -- Destaca a linha do cursor durante a visualização
    })
  end,
}
