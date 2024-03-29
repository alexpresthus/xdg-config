return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup {
            pickers = {
                find_files = {
                    theme = "dropdown",
                    preview = false,
                    previewer = false,
                },
                git_files = {
                    theme = "dropdown",
                    preview = false,
                    previewer = false,
                },
                grep_string = {
                    layout_config = {
                    }
                },
            }
        }
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pi', function() builtin.find_files{ no_ignore = true } end, {})
        vim.keymap.set('n', '<C-f>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags)
    end
}
