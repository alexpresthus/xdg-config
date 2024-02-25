vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

-- fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- window nav
vim.keymap.set("n", "<leader>w1", "1<C-w>w")
vim.keymap.set("n", "<leader>w2", "2<C-w>w")
vim.keymap.set("n", "<leader>w3", "3<C-w>w")
vim.keymap.set("n", "<leader>w4", "4<C-w>w")

-- copilot
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

