# Neovim Config

Personal Neovim configuration based on [NvChad v2.5](https://github.com/NvChad/NvChad).

## Installation

```bash
# Clone the config
git clone https://github.com/PatrickKoss/nvim-config ~/.config/nvim

# Start Neovim (first run will install plugins automatically)
nvim
```

First run will automatically install all plugins via lazy.nvim. Wait for the installation to complete.

## Requirements

- Neovim >= 0.11
- Git
- Node.js (for copilot, some LSP servers)
- ripgrep (for telescope)
- A C compiler (gcc/clang) for treesitter parsers

### macOS

```bash
brew install neovim node ripgrep
```

### Ubuntu/Debian

```bash
# Neovim 0.11+ (use latest from GitHub releases or snap)
sudo snap install nvim --classic

sudo apt install nodejs npm ripgrep build-essential
```

## Updating

### Update Plugins

Open Neovim and run:

```vim
:Lazy update
```

Or use the keyboard shortcut `<leader>` then type `:Lazy update`.

### Update NvChad Base

NvChad is loaded as a plugin, so it updates with `:Lazy update`. To update to a specific version:

```vim
:Lazy update NvChad
```

### Update Treesitter Parsers

```vim
:TSUpdate
```

### Sync Everything (Clean Install)

If you encounter issues, you can do a clean sync:

```bash
# Remove plugin cache
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/share/nvim/base46
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# Restart Neovim
nvim
```

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point, lazy.nvim bootstrap
└── lua/
    ├── chadrc.lua           # NvChad UI/theme config
    ├── mappings.lua         # Custom keymaps
    ├── options.lua          # Vim options
    ├── autocmds.lua         # Autocommands + semantic highlights
    ├── configs/
    │   ├── conform.lua      # Formatter configuration
    │   ├── lazy.lua         # Lazy.nvim settings
    │   └── lspconfig.lua    # LSP server configuration
    └── plugins/
        └── init.lua         # Plugin specifications
```

## Features

- **Theme**: oceanic-next (with one_light toggle via `<leader>th`)
- **LSP**: gopls, pyright, rust_analyzer, terraformls, yamlls, dockerls, ts_ls, and more
- **Semantic Highlighting**: IntelliJ-like coloring for types, structs, functions, parameters
- **Formatters**: black, golines, goimports, rustfmt, stylua, prettier, yamlfmt
- **Rainbow Brackets**: Colored matching brackets via rainbow-delimiters
- **Rainbow Indents**: Colored indent guides via indent-blankline
- **Plugins**: copilot.lua, better-escape, autoclose, conform.nvim

## Custom Keymaps

| Key | Mode | Action |
|-----|------|--------|
| `;` | n | Enter command mode |
| `jk` | i | Escape |
| `<C-w>` | n | Close buffer |
| `<leader>gg` | n | Run golines |
| `<leader>bb` | n | Run black |

### LSP Keymaps

| Key | Mode | Action |
|-----|------|--------|
| `gd` | n | Go to definition |
| `gD` | n | Go to declaration |
| `gi` | n | Go to implementation |
| `gr` | n | Show references |
| `K` | n | Hover documentation |
| `<leader>ca` | n | Code action |
| `<leader>ra` | n | Rename |
| `<leader>D` | n | Go to type definition |

## Adding New Plugins

Edit `lua/plugins/init.lua` and add your plugin spec:

```lua
{
  "author/plugin-name",
  event = "BufRead",  -- lazy load on event
  config = function()
    require("plugin-name").setup({})
  end,
},
```

Then restart Neovim or run `:Lazy sync`.

## Adding New LSP Servers

1. Install the server via Mason: `:MasonInstall <server-name>`
2. Add it to the servers list in `lua/configs/lspconfig.lua`
3. Run `vim.lsp.enable("<server-name>")`

## Customization

### Change Theme

Edit `lua/chadrc.lua`:

```lua
M.base46 = {
  theme = "your-theme-name",
}
```

Available themes: Run `:Telescope themes` or check [NvChad themes](https://nvchad.com/themes).

### Change Semantic Token Colors

Edit `lua/autocmds.lua` and modify the `nvim_set_hl` calls for `@lsp.type.*` groups.
