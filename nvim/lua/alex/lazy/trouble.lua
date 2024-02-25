return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        action_keys = { -- key mappings for actions in the trouble list
            -- map to {} to remove a mapping, for example:
            -- close = {},
            close = "q", -- close the list
            cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
            refresh = "r", -- manually refresh
            jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
            open_split = { "<c-x>" }, -- open buffer in new split
            open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
            open_tab = { "<c-t>" }, -- open buffer in new tab
            jump_close = {"o"}, -- jump to the diagnostic and close the list
            toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
            switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
            toggle_preview = "P", -- toggle auto_preview
            hover = "K", -- opens a small popup with the full multiline message
            preview = "p", -- preview the diagnostic location
            previous = "k", -- previous item
            next = "j", -- next item
            help = "?", -- help menu
        },
    },
    config = function ()
       vim.keymap.set("n", "<leader>tt", function() require("trouble").toggle() end)
       vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end)
       vim.keymap.set("n", "<leader>tn", function()
           require("trouble").next({
               skip_groups = true,
               jump = true
           })
       end)
       vim.keymap.set("n", "<leader>tp", function()
           require("trouble").previous({
               skip_groups = true,
               jump = true
           })
       end)
       vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
 end,
}
