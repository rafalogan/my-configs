return {
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Próximo comentário TODO",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Comentário TODO anterior",
      },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Abrir TODOs no Trouble" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Filtrar TODO/FIX/FIXME no Trouble" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Abrir TODOs no Telescope" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Filtrar TODO/FIX/FIXME no Telescope" },
    },
  },
}
