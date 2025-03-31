return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    priority = 1000,
    config = function()
      require("nvim-web-devicons").setup({
        default = true,
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFile" },
    keys = {
      { "<C-n>", function()
          vim.cmd("NvimTreeToggle")
          -- Refresh icons after using control key
          require("nvim-web-devicons").refresh()
        end,
        desc = "Toggle NvimTree"
      },
      { "<leader>eo", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false,
        },
        git = {
          enable = true,
          ignore = false,
        },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          local function map(key, action, desc)
            vim.keymap.set('n', key, action, { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true })
          end
          map('o', api.node.open.edit, "Open")
          map('<CR>', api.node.open.edit, "Open")
          map('<BS>', api.node.navigate.parent_close, "Close Directory")
          map('a', api.fs.create, "Create")
          map('d', api.fs.remove, "Delete")
          map('r', api.fs.rename, "Rename")
          map('y', api.fs.copy.node, "Copy")
          map('p', api.fs.paste, "Paste")
          map('x', api.fs.cut, "Cut")
          map('c', api.fs.copy.filename, "Copy Name")
          map('q', api.tree.close, "Close")
          map('R', api.tree.reload, "Refresh")
        end,
      })
    end,
  }
}
