return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = "CopilotChat",
    build = "make tiktoken", -- Apenas no macOS ou Linux
    dependencies = {
      { "github/copilot.vim" }, -- ou zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        auto_insert_mode = true,
        question_header = "  " .. user .. " ",
        answer_header = "  Copilot ",
        window = {
          width = 0.4,
        },
        model = "gpt-3.5-turbo", -- Define o modelo padrão
      }
    end,
    keys = {
      {
        "<leader>aa",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "Alternar CopilotChat",
        mode = { "n", "v" },
      },
      {
        "<leader>ax",
        function()
          require("CopilotChat").reset()
        end,
        desc = "Limpar CopilotChat",
        mode = { "n", "v" },
      },
      {
        "<leader>aq",
        function()
          vim.ui.input({ prompt = "Pergunta Rápida: " }, function(input)
            if input ~= "" then
              require("CopilotChat").ask(input)
            end
          end)
        end,
        desc = "Pergunta Rápida (CopilotChat)",
        mode = { "n", "v" },
      },
    },
  },
}
