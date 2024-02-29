return {
	"folke/which-key.nvim",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "github/copilot.vim",
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    {
        "alexpresthus/julian.nvim",
        opts = {}
    },
    {
        "ThePrimeagen/vim-apm",
        lazy = false,
        config = function()
            local apm = require("vim-apm")
            apm:setup({})
            vim.keymap.set("n", "<leader>apm", function()
               apm:toggle_monitor()
            end)
        end
    },
    {
        "sudormrfbin/cheatsheet.nvim",
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim'
        },
        opts = {
            bundled_cheatsheets = {
                -- only show the default cheatsheet
                enabled = { "default" },
            },
        },
    }
}
