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
- **Statusline**: vscode_colored theme with round separators
- **LSP**: gopls, pyright, rust_analyzer, terraformls, yamlls, dockerls, ts_ls, and more
- **Semantic Highlighting**: IntelliJ-like coloring for types, structs, functions, parameters
- **Formatters**: black, golines, goimports, rustfmt, stylua, prettier, yamlfmt
- **Rainbow Brackets**: Colored matching brackets via rainbow-delimiters
- **Rainbow Indents**: Colored indent guides via indent-blankline
- **Modern Folding**: Treesitter-based folding with preview via nvim-ufo
- **Fancy UI**: Command popup and notifications via noice.nvim

## Plugins

### Core (NvChad)

| Plugin | Description |
|--------|-------------|
| [NvChad/NvChad](https://github.com/NvChad/NvChad) | Base configuration framework |
| [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility functions |
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
| [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git integration |
| [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion |
| [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/DAP/Linter installer |
| [NvChad/base46](https://github.com/NvChad/base46) | Theming system |
| [NvChad/ui](https://github.com/NvChad/ui) | UI components (statusline, tabufline) |

### LSP & Formatting

| Plugin | Description |
|--------|-------------|
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration |
| [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | Formatter integration |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |

### Visual Enhancements

| Plugin | Description |
|--------|-------------|
| [HiPhish/rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) | Rainbow brackets |
| [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Rainbow indent guides |
| [folke/noice.nvim](https://github.com/folke/noice.nvim) | Fancy cmdline & notifications |
| [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) | Notification manager |
| [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight TODO/FIXME/HACK |
| [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) | Modern folding with preview |

### Productivity

| Plugin | Description |
|--------|-------------|
| [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua) | GitHub Copilot |
| [folke/flash.nvim](https://github.com/folke/flash.nvim) | Fast navigation |
| [folke/trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics panel |
| [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon) | Quick file switching |
| [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff viewer & 3-way merge |
| [akinsho/git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim) | Inline merge conflict resolution |
| [nvim-pack/nvim-spectre](https://github.com/nvim-pack/nvim-spectre) | Search & replace |
| [simrat39/symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim) | Code outline |

### Editing

| Plugin | Description |
|--------|-------------|
| [max397574/better-escape.nvim](https://github.com/max397574/better-escape.nvim) | Better escape sequences |
| [m4xshen/autoclose.nvim](https://github.com/m4xshen/autoclose.nvim) | Auto-close brackets |

### Debugging

| Plugin | Description |
|--------|-------------|
| [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client |
| [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | UI for nvim-dap |
| [theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) | Inline variable values |
| [jay-babu/mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) | Mason DAP integration |

## Keymaps

**Leader key**: `<Space>`

### General

| Key | Mode | Action |
|-----|------|--------|
| `;` | n | Enter command mode |
| `jk` | i | Escape to normal mode |
| `<Esc>` | n | Clear search highlights |
| `<C-s>` | n | Save file |
| `<leader>w` | n | Save file |
| `<C-a>` | n | Select all |
| `<leader>cp` | n | Copy absolute file path to clipboard |

### Window Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<C-h>` | n | Go to left window |
| `<C-j>` | n | Go to lower window |
| `<C-k>` | n | Go to upper window |
| `<C-l>` | n | Go to right window |
| `<leader>sv` | n | Split vertical |
| `<leader>sh` | n | Split horizontal |

### Window Resize

| Key | Mode | Action |
|-----|------|--------|
| `<C-Up>` | n | Increase height |
| `<C-Down>` | n | Decrease height |
| `<C-Left>` | n | Decrease width |
| `<C-Right>` | n | Increase width |

### Buffer Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<Tab>` | n | Next buffer |
| `<S-Tab>` | n | Previous buffer |
| `<S-l>` | n | Next buffer |
| `<S-h>` | n | Previous buffer |
| `<C-w>` | n | Close buffer |
| `<leader>x` | n | Close buffer (NvChad) |

### Line Movement & Editing

| Key | Mode | Action |
|-----|------|--------|
| `J` | v | Move selected lines down |
| `K` | v | Move selected lines up |
| `<C-d>` | n | Scroll down (centered) |
| `<C-u>` | n | Scroll up (centered) |
| `n` | n | Next search result (centered) |
| `N` | n | Previous search result (centered) |
| `<leader>p` | x | Paste without yanking |

### File Explorer (nvim-tree)

| Key | Mode | Action |
|-----|------|--------|
| `<C-n>` | n | Toggle file explorer |
| `<leader>e` | n | Focus file explorer |

### Telescope (Fuzzy Finder)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | n | Find files |
| `<leader>fa` | n | Find all files (including hidden) |
| `<leader>fw` | n | Live grep (search in files) |
| `<leader>fb` | n | Find buffers |
| `<leader>fh` | n | Help tags |
| `<leader>fo` | n | Old files (recent) |
| `<leader>fz` | n | Find in current buffer |
| `<leader>cm` | n | Git commits |
| `<leader>gt` | n | Git status |
| `<leader>ma` | n | Bookmarks |
| `<leader>th` | n | Theme switcher |
| `<leader>ch` | n | Cheatsheet |
| `<leader>fk` | n | Find keymaps |

### LSP

| Key | Mode | Action |
|-----|------|--------|
| `gd` | n | Go to definition |
| `gD` | n | Go to declaration |
| `gi` | n | Go to implementation |
| `gr` | n | Show references |
| `K` | n | Hover documentation |
| `<leader>ca` | n | Code action |
| `<leader>ra` | n | Rename symbol |
| `<leader>D` | n | Go to type definition |
| `<leader>ls` | n | Signature help |
| `<leader>lf` | n | LSP formatting |
| `[d` | n | Previous diagnostic |
| `]d` | n | Next diagnostic |
| `<leader>q` | n | Diagnostic loclist |
| `<leader>wa` | n | Add workspace folder |
| `<leader>wr` | n | Remove workspace folder |
| `<leader>wl` | n | List workspace folders |

### Formatting

| Key | Mode | Action |
|-----|------|--------|
| `<leader>fm` | n | Format buffer (conform) |
| `<leader>gg` | n | Run golines |
| `<leader>bb` | n | Run black |

### Flash (Fast Navigation)

| Key | Mode | Action |
|-----|------|--------|
| `s` | n, x, o | Flash jump |
| `S` | n, x, o | Flash treesitter select |

### Harpoon (Quick Files)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>a` | n | Add file to harpoon |
| `<C-e>` | n | Toggle harpoon menu |
| `<leader>1` | n | Go to harpoon file 1 |
| `<leader>2` | n | Go to harpoon file 2 |
| `<leader>3` | n | Go to harpoon file 3 |
| `<leader>4` | n | Go to harpoon file 4 |

### Trouble (Diagnostics)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>xx` | n | Toggle diagnostics |
| `<leader>xd` | n | Buffer diagnostics |
| `<leader>xl` | n | LSP references |

### Git

| Key | Mode | Action |
|-----|------|--------|
| `<leader>gd` | n | Open diffview |
| `<leader>gh` | n | File git history |
| `<leader>gc` | n | Close diffview |
| `<leader>gm` | n | 3-way merge view |
| `]c` | n | Next git hunk |
| `[c` | n | Previous git hunk |
| `<leader>rh` | n | Reset hunk |
| `<leader>ph` | n | Preview hunk |
| `<leader>gb` | n | Blame line |
| `<leader>td` | n | Toggle deleted |

### Merge Conflicts

| Key | Mode | Action |
|-----|------|--------|
| `<leader>co` | n | Choose ours (current) |
| `<leader>ct` | n | Choose theirs (incoming) |
| `<leader>cb` | n | Choose both |
| `<leader>cn` | n | Choose none |
| `[x` | n | Previous conflict |
| `]x` | n | Next conflict |
| `<leader>cq` | n | List all conflicts |

### Search & Replace (Spectre)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>sr` | n | Open search & replace |
| `<leader>sw` | n | Search word under cursor |

### Code Outline

| Key | Mode | Action |
|-----|------|--------|
| `<leader>so` | n | Toggle symbols outline |

### Folding (nvim-ufo)

| Key | Mode | Action |
|-----|------|--------|
| `zR` | n | Open all folds |
| `zM` | n | Close all folds |
| `zK` | n | Peek fold preview |
| `za` | n | Toggle fold |
| `zo` | n | Open fold |
| `zc` | n | Close fold |

### TODO Comments

| Key | Mode | Action |
|-----|------|--------|
| `]t` | n | Next TODO comment |
| `[t` | n | Previous TODO comment |
| `<leader>td` | n | Search TODOs (Telescope) |

### Copilot

| Key | Mode | Action |
|-----|------|--------|
| `<Tab>` | i | Accept suggestion |
| `<M-]>` | i | Next suggestion |
| `<M-[>` | i | Previous suggestion |
| `<C-]>` | i | Dismiss suggestion |
| `<M-CR>` | i | Open copilot panel |
| `[[` | n | Previous panel suggestion |
| `]]` | n | Next panel suggestion |
| `<CR>` | n | Accept panel suggestion |
| `gr` | n | Refresh panel |

### Debugging (DAP)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>db` | n | Toggle breakpoint |
| `<leader>dB` | n | Conditional breakpoint |
| `<leader>dl` | n | Log point |
| `<leader>dc` | n | Continue |
| `<leader>di` | n | Step into |
| `<leader>do` | n | Step over |
| `<leader>dO` | n | Step out |
| `<leader>dr` | n | Toggle REPL |
| `<leader>ds` | n | Session info |
| `<leader>dt` | n | Terminate |
| `<leader>du` | n | Toggle DAP UI |
| `<leader>de` | n, v | Eval expression |
| `<F5>` | n | Continue (IDE style) |
| `<F10>` | n | Step over (IDE style) |
| `<F11>` | n | Step into (IDE style) |
| `<F12>` | n | Step out (IDE style) |

### Terminal

| Key | Mode | Action |
|-----|------|--------|
| `<leader>h` | n | Horizontal terminal |
| `<leader>v` | n | Vertical terminal |
| `<A-h>` | t | Toggle horizontal terminal |
| `<A-v>` | t | Toggle vertical terminal |
| `<A-i>` | t | Toggle floating terminal |

### Comments (NvChad)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>/` | n | Toggle comment |
| `<leader>/` | v | Toggle comment (selection) |

### WhichKey

| Key | Mode | Action |
|-----|------|--------|
| `<leader>wK` | n | Show all keymaps |
| `<leader>wk` | n | Query keymap |

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

### Change Statusline Style

Edit `lua/chadrc.lua`:

```lua
M.ui = {
  statusline = {
    theme = "vscode_colored",  -- options: default, vscode, vscode_colored, minimal
    separator_style = "round", -- options: default, round, block, arrow
  },
}
```

### Change Semantic Token Colors

Edit `lua/chadrc.lua` and modify the `hl_override` section for `@lsp.type.*` groups.

## Debugging

This config includes full debugging support via DAP (Debug Adapter Protocol) for Go, Python, JavaScript/TypeScript, and Rust.

### Supported Languages

| Language | Debug Adapter | Install Command |
|----------|---------------|-----------------|
| Go | Delve | `:MasonInstall delve` |
| Python | debugpy | `:MasonInstall debugpy` |
| JavaScript/TypeScript | js-debug-adapter | `:MasonInstall js-debug-adapter` |
| Rust | codelldb | `:MasonInstall codelldb` |

### Quick Start

1. **Set a breakpoint**: Navigate to a line and press `<leader>db`
2. **Start debugging**: Press `<F5>` or `<leader>dc`
3. **Select configuration**: Choose the appropriate debug config for your file
4. **Step through code**: Use `<F10>` (step over), `<F11>` (step into), `<F12>` (step out)
5. **Inspect variables**: The DAP UI opens automatically showing scopes, breakpoints, and call stack
6. **Evaluate expressions**: Press `<leader>de` to eval expression under cursor
7. **Stop debugging**: Press `<leader>dt` to terminate

### Breakpoint Types

| Key | Type | Description |
|-----|------|-------------|
| `<leader>db` | Regular | Stops execution at this line |
| `<leader>dB` | Conditional | Stops only when condition is true |
| `<leader>dl` | Log point | Logs message without stopping |

### DAP UI Layout

When debugging starts, the UI automatically opens with:

```
+------------------+---------------------------+
|    Scopes        |                           |
+------------------+                           |
|   Breakpoints    |       Source Code         |
+------------------+                           |
|    Stacks        |                           |
+------------------+                           |
|    Watches       |                           |
+------------------+---------------------------+
|     REPL         |        Console            |
+------------------+---------------------------+
```

Toggle the UI manually with `<leader>du`.

### Debug Configurations

#### Go

- **Debug**: Debug current file
- **Debug Package**: Debug entire package
- **Debug test**: Debug test file
- **Debug test (go.mod)**: Debug tests relative to go.mod

#### Python

- **Launch file**: Debug current file
- **Launch file with args**: Debug with command-line arguments

#### JavaScript/TypeScript

- **Launch file**: Debug current file with Node.js

#### Rust

- **Launch**: Debug compiled binary (prompts for path)

### Tips

- Install debug adapters via Mason: `:Mason` then search for the adapter
- Use `:DapShowLog` to view debug logs if something goes wrong
- Add watches by pressing `a` in the watches window
- Hover over variables in the code to see their values (virtual text)
