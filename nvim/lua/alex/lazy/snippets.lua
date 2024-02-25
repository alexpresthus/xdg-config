return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local ls = require("luasnip")
            ls.config.setup()
            vim.tbl_map(
                function(type)
                    require("luasnip.loaders.from_" .. type).lazy_load()
                end,
                { "vscode", "snipmate", "lua" }
            )
            -- friendly-snippets - enable standardized comments snippets
            ls.filetype_extend("typescript", { "tsdoc" })
            ls.filetype_extend("javascript", { "jsdoc" })

            vim.keymap.set("i", "<C-K>", function () ls.expand() end, { silent = true })
            vim.keymap.set({"i", "s"}, "<leader>,", function () ls.jump(1) end, { silent = true })
            vim.keymap.set({"i", "s"}, "<leader>;", function () ls.jump(-1) end, { silent = true })
            vim.keymap.set({"i", "s"}, "<leader>.", function ()
                if ls.choice_active then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function ()
            require("neogen").setup {
                snippet_engine = "luasnip",
            }
            local opts = { noremap = true, silent = true }
            vim.keymap.set("n", "<leader>ngf", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
            vim.keymap.set("n", "<leader>ngc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
            vim.keymap.set("n", "<leader>ngt", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)
        end
    }
}
