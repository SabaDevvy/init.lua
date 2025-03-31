return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require('telescope').setup({})
        local builtin = require('telescope.builtin')

        -- Helper function to refresh icons after telescope is used
        local function use_telescope(telescope_function, opts)
            return function()
                telescope_function(opts or {})
                vim.defer_fn(function()
                    require("nvim-web-devicons").refresh()
                end, 50)
            end
        end
        -- Use the helper function for all keymaps
        vim.keymap.set('n', '<leader>pf', use_telescope(builtin.find_files), {})
        vim.keymap.set('n', '<C-p>', use_telescope(builtin.git_files), {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
            vim.defer_fn(function()
                require("nvim-web-devicons").refresh()
            end, 50)
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
            vim.defer_fn(function()
                require("nvim-web-devicons").refresh()
            end, 50)
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
            vim.defer_fn(function()
                require("nvim-web-devicons").refresh()
            end, 50)
        end)
        vim.keymap.set('n', '<leader>vh', use_telescope(builtin.help_tags), {})
        -- Also create an autocmd for when telescope buffers are created
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "TelescopePrompt",
            callback = function()
                vim.defer_fn(function()
                    require("nvim-web-devicons").refresh()
                end, 50)
            end,
        })
    end
}

