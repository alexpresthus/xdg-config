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
}
