return {
    -- Commented personal plugins that aren't publicly available
    --[[
    {
        "ThePrimeagen/vim-guys",
        dir = "~/personal/vim-guys",
        config = function() end,
    },
    {
        "ThePrimeagen/cockpit",
        dir = "~/personal/cockpit",
        config = function()
            require("cockpit")
            vim.keymap.set("n", "<leader>ct", "<cmd>CockpitTest<CR>")
            vim.keymap.set("n", "<leader>cr", "<cmd>CockpitRefresh<CR>")
        end,
    },
    {
        "ThePrimeagen/streamer",
        dir = "~/personal/eleven-streamer",
        dependencies = {
            "livinglogic-nl/ws.nvim"
        },
        config = function() end
    },
    {
        "ThePrimeagen/caleb",
        dir = "~/personal/caleb",
        config = function() end
    },
    {
        "ThePrimeagen/vim-with-me",
        dir = "~/personal/vim-with-me",
        config = function() end
    },
    --]]

    -- Public plugins with proper import format
    {
        "ThePrimeagen/harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        branch = "harpoon2", -- Using harpoon2 branch as the config is for v2
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()
            vim.keymap.set("n", "<leader>A", function() harpoon:list():prepend() end)
            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-l>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<leader><C-1>", function() harpoon:list():replace_at(1) end)
            vim.keymap.set("n", "<leader><C-2>", function() harpoon:list():replace_at(2) end)
            vim.keymap.set("n", "<leader><C-3>", function() harpoon:list():replace_at(3) end)
            vim.keymap.set("n", "<leader><C-4>", function() harpoon:list():replace_at(4) end)
        end
    },
    {
        "ThePrimeagen/vim-apm",
        config = function()
            local apm = require("vim-apm")
            apm:setup({})
            vim.keymap.set("n", "<leader>qapm", function() apm:toggle_monitor() end)
        end
    },
}
