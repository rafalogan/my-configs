return {
  {
    "tzachar/cmp-tabnine",
    build = {
      "./install.sh",
      ":CmpTabnineHub",
    },
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opts = {
      max_lines = 1000,
      max_num_results = 3,
      sort = true,
    },
    config = function(_, opts)
      require("cmp_tabnine.config"):setup(opts)
    end,
  },
}
