return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },
    lazy = false,
    priority = 999,
    config = function()
        require("fidget").setup()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "tsserver", "eslint" },
            handlers = {
                function(server_name)
                    local cmp_lsp = require("cmp_nvim_lsp")
                    local capabilities = vim.tbl_deep_extend(
                        "force",
                        {},
                        vim.lsp.protocol.make_client_capabilities(),
                        cmp_lsp.default_capabilities())
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["lua_ls"] = function ()
                    require("lspconfig").lua_ls.setup {
                        settings = {
                            Lua = {
                                runtime = {
                                    version = 'LuaJIT'
                                },
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME
                                    }
                                }
                            }
                        }
                    }
                end,
                ["denols"] = function ()
                    require("lspconfig").denols.setup {
                        autostart = false,
                        filetypes = {"typescript"}
                    }
                end
            }
        })
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("AlexLspGroup", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gd", function()
                    vim.lsp.buf.definition()
                end, opts)
                vim.keymap.set("n", "K", function()
                    vim.lsp.buf.hover()
                end, opts)
                vim.keymap.set("n", "<leader>vws", function()
                    vim.lsp.buf.workspace_symbol()
                end, opts)
                vim.keymap.set("n", "<leader>vd", function()
                    vim.diagnostic.open_float()
                end, opts)
                vim.keymap.set("n", "<leader>vca", function()
                    vim.lsp.buf.code_action()
                end, opts)
                vim.keymap.set("n", "<leader>vrr", function()
                    vim.lsp.buf.references()
                end, opts)
                vim.keymap.set("n", "<leader>vrn", function()
                    vim.lsp.buf.rename()
                end, opts)
                vim.keymap.set("i", "<C-h>", function()
                    vim.lsp.buf.signature_help()
                end, opts)
            end,
        })


        local cmp = require'cmp'

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['C-p'] = cmp.mapping.select_prev_item(),
                ['C-n'] = cmp.mapping.select_next_item(),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })
        vim.diagnostic.config({
            update_in_insert = true
        })
    end,
}
