return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    triggers = { "<leader>" },
    delay = 1000, -- 1000ms = 1 second delay before showing which-key
  },
  keys = {
    { "<leader>?", function() require("which-key").show() end, desc = "Show all keymaps (which-key)" },
    { "<leader>b?", function() require("which-key").show({ mode = "n", prefix = "<leader>b" }) end, desc = "Buffer keymaps (which-key)" },
  },
}
