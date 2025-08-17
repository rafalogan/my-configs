return {
  "echasnovski/mini.files",
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 30,
    },
    options = {
      use_as_default_explorer = false,
    },
  },
  keys = {
    {
      "<leader>fm",
      function()
        local mini_files = require("mini.files")
        mini_files.open(vim.api.nvim_buf_get_name(0), true)
        mini_files.refresh({ content = {
          filter = function()
            return true
          end,
        } })
      end,
      desc = "Abrir mini.files (Diretório do Arquivo Atual)",
    },
    {
      "<leader>fM",
      function()
        local mini_files = require("mini.files")
        mini_files.open(vim.uv.cwd(), true)
        mini_files.refresh({ content = {
          filter = function()
            return true
          end,
        } })
      end,
      desc = "Abrir mini.files (cwd)",
    },
  },
  config = function(_, opts)
    local mini_files = require("mini.files")
    mini_files.setup(opts)

    local show_dotfiles = true
    local filter_show = function(_)
      return true
    end
    local filter_hide = function(fs_entry)
      return not vim.startswith(fs_entry.name, ".")
    end

    local toggle_dotfiles = function()
      show_dotfiles = not show_dotfiles
      local new_filter = show_dotfiles and filter_show or filter_hide
      mini_files.refresh({ content = { filter = new_filter } })
    end

    local map_split = function(buf_id, lhs, direction, close_on_file)
      local rhs = function()
        local new_target_window
        local cur_target_window = mini_files.get_explorer_state().target_window
        if cur_target_window ~= nil then
          vim.api.nvim_win_call(cur_target_window, function()
            vim.cmd("belowright " .. direction .. " split")
            new_target_window = vim.api.nvim_get_current_win()
          end)

          mini_files.set_target_window(new_target_window)
          mini_files.go_in({ close_on_file = close_on_file })
        end
      end

      local desc = "Abrir em divisão " .. direction
      if close_on_file then
        desc = desc .. " e fechar"
      end
      vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
    end

    local files_set_cwd = function()
      local cur_entry_path = mini_files.get_fs_entry().path
      local cur_directory = vim.fs.dirname(cur_entry_path)
      if cur_directory ~= nil then
        vim.fn.chdir(cur_directory)
      end
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local buf_id = args.data.buf_id

        vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id, desc = "Alternar arquivos ocultos" })
        vim.keymap.set("n", "gc", files_set_cwd, { buffer = buf_id, desc = "Definir cwd" })

        map_split(buf_id, "<C-w>s", "horizontal", false)
        map_split(buf_id, "<C-w>v", "vertical", false)
        map_split(buf_id, "<C-w>S", "horizontal", true)
        map_split(buf_id, "<C-w>V", "vertical", true)
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesActionRename",
      callback = function(event)
        if Snacks and Snacks.rename then
          Snacks.rename.on_rename_file(event.data.from, event.data.to)
        end
      end,
    })
  end,
}
