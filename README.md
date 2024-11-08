# autosave.nvim

[![LuaRocks](https://img.shields.io/luarocks/v/brianhuster/autosave.nvim?logo=lua&color=purple)](https://luarocks.org/modules/brianhuster/autosave.nvim)

autosave.nvim is a Neovim and Vim plugin that provides automatic saving functionality. It allows you to toggle autosave on and off, check the current autosave status, and customize the plugin's behavior.

# Installation

This plugin requires Vim >= 8.2.3288 with `+lua` or Neovim >= 0.9

<details>
<summary>Using lazy.nvim (recommended) 💤</summary>

```lua
require("lazy").setup({
    {
        "brianhuster/autosave.nvim",
        event="InsertEnter",
        opts = {} -- Configuration here
    },
})
```

</details>

<details>
<summary>rocks.nvim 🪨</summary>

```vim
:Rocks install live-preview.nvim
```
</details>

<details>
<summary>vim-plug 🔌</summary>

```vim
Plug 'brianhuster/autosave.nvim' 
```

</details>

<details>
<summary>Native package (without a plugin manager) 📦</summary>

* Neovim

```sh
git clone --depth 1 https://github.com/brianhuster/live-preview.nvim ~/.local/share/nvim/site/pack/brianhuster/start/live-preview.nvim
```

* Vim

```sh
git clone --depth 1 https://github.com/brianhuster/live-preview.nvim ~/.vim/pack/brianhuster/start/live-preview.nvim
```
</details>

# Usage

To enable autosave
```vim
:Autosave on
```

To disable autosave
```vim
:Autosave off
```

To toggle autosave
```vim
:Autosave toggle
```

To check the current autosave status
```vim
:Autosave status
```

## Configuration

* Vimscript

```vim
g:autosave_enabled = v:true " Enable autosave when the plugin is loaded. Set to v:false to disable autosave, and only enable it when you run the :AutoSave toggle command.
g:autosave_disable_inside_paths = [] " A list of paths inside which autosave should be disabled. In Neovim, it is recommended to set this to [stdpath('config')] to disable autosave for files inside your Neovim configuration directory, so that Neovim doesn't reload whenever you type inside your configuration files.
```

* Lua (only available in Neovim)

```lua
require("autosave").setup({
    enabled = true, -- Enable autosave when the plugin is loaded. Set to false to disable autosave, and only enable it when you run the :AutoSave toggle command.
    disable_inside_paths = {}, -- A list of paths inside which autosave should be disabled. In Neovim, it is recommended to set this to {vim.fn.stdpath('config')} to disable autosave for files inside your Neovim configuration directory, so that Neovim doesn't reload whenever you type inside your configuration files.
})
```

# Contributing

If you encounter any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request on this GitHub repository. 


