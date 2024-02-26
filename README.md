# Neovim config

For nvim version >0.9.5.

Neovim AppImage installation -> [github.com/neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md#appimage-universal-linux-package)

## Plugins

### Plugin Manager
    - [folke/lazy]("")

### Theme and appearnce
    - [rose-pine/neovim]("")
    - [nvim-treesitter/treesitter]("")

### Search and navigation
    - [folke/which-key]("")
    - [nvim-telescope/telescope]("")
    - [ThePrimaegen/harpoon]("")
    - [tpope/vim-fugitive]("")
    - [mbbill/undotree]("")

### LSP and auto-complete
    - [neovim/nvim-lspconfig]("")
    - [williamboman/mason.nvim]("")
    - [williamboman/mason-lspconfig.nvim]("")
    - [hrsh7th/cmp-nvim-lsp]("")
    - [hrsh7th/cmp-buffer]("")
    - [hrsh7th/cmp-path]("")
    - [hrsh7th/cmp-cmdline]("")
    - [hrsh7th/nvim-cmp]("")
    - [saadparwaiz1/cmp_luasnip]("")
    - [j-hui/fidget.nvim]("")

### Snippets
    - [L3MON4D3/LuaSnip]("")
    - [rafamadriz/friendly-snippets]("")
    - [danymat/neogen]("")


# Tmux config

Configured for tmux 3.3a.

Tmux AppImage installation -> [github.com/nelsonenzo/tmux-appimage](https://github.com/nelsonenzo/tmux-appimage)

Install TPM (tmux plugin manager)
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Plugins
    - [tmux-plugins/tpm]("")
    - [tmux-plugins/tmux-sensible]("")
    - [rose-pine/tmux]("")

# Zsh config

Configured for zsh 5.8.

Install zsh
```
sudo apt install zsh
```

Install  oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install plugins
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Create symlink for .zshrc
```
ln -s ~/.config/zsh/.zshrc ~/.zshrc
```

