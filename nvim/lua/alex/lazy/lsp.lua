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
        local util = require("lspconfig.util")
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "ts_ls", "gopls", "zls", "denols" },
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
                ["ts_ls"] = function ()
                    require("lspconfig").ts_ls.setup {
                        root_dir = util.root_pattern("tsconfig.json", "package.json", ".git"),
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
                        filetypes = {"typescript", "typescriptreact"}
                    }
                end,
                ["html"] = function ()
                    require("lspconfig").html.setup {
                        filetypes = {"html", "templ"},
                    }
                end,
                ["htmx"] = function ()
                    require("lspconfig").htmx.setup {
                        filetypes = {"html", "templ"},
                    }
                end,
                ["tailwindcss"] = function ()
                    require("lspconfig").tailwindcss.setup {
                        autostart = false,
                        filetypes = {"html", "templ", "javascript", "typescript", "react", "typescriptreact"},
                        init_options = { userLanguages = { templ = "html" } },
                    }
                end,
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
                vim.keymap.set("n", "<leader>gr", function()
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

        -- Define custom LSP modes
        local lsp_modes = {
            deno = {
                ts_ls = {
                    autostart = false,
                    filetypes = {"typescript", "typescriptreact"}
                },
                denols = {
                    autostart = true,
                    filetypes = {"typescript", "typescriptreact"}
                }
            },
            node = {
                ts_ls = {
                    autostart = true,
                    filetypes = {"typescript", "typescriptreact"}
                },
                denols = {
                    autostart = false,
                    filetypes = {"typescript", "typescriptreact"}
                }
            }
        }
        -- Function to toggle LSP server on or off
        local function toggle_lsp(mode)
            for server, config in pairs(lsp_modes[mode]) do
                require("lspconfig")[server].setup(config)
                print("Started LSP servers in mode:", mode)
            end
        end

        -- Key mappings for each server toggle
        vim.keymap.set("n", "<leader>ld", function() toggle_lsp("deno") end, { noremap = true, silent = true, desc = "Set LSP mode = deno" })
        vim.keymap.set("n", "<leader>ln", function() toggle_lsp("node") end, { noremap = true, silent = true, desc = "Set LSP mode = node" })
    end,
}
