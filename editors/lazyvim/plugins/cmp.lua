return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.completion = opts.completion or {}
      opts.completion.keyword_length = 2

      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "cmp_tabnine",
        group_index = 1,
        priority = 100,
      })

      opts.formatting = opts.formatting or {}
      local format = opts.formatting.format
      opts.formatting.format = function(entry, item)
        if entry.source.name == "cmp_tabnine" then
          item.menu = ""
        end
        if format then
          return format(entry, item)
        end
        return item
      end
    end,
  },
}
