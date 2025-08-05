# autosave.nvim

[![LuaRocks](https://img.shields.io/luarocks/v/brianhuster/autosave.nvim?logo=lua&color=purple)](https://luarocks.org/modules/brianhuster/autosave.nvim)

autosave.nvim is a Neovim and Vim plugin that provides automatic saving functionality. It allows you to toggle autosave on and off, check the current autosave status, and customize the plugin's behavior.

> [!NOTE]
> This plugin will be deprecated because I no longer use it. Also `autosave` can easily be implemented in user side like below, so you shouldn't need this plugin.
> ```vim
> set autowriteall
> au InsertLeavePre,TextChanged,TextChangedP * if &modifiable && !&readonly | silent! update | endif
> ```


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

```vim
" Legacy Vimscript
let g:autosave_enabled = v:true " Enable autosave when the plugin is loaded. Set to v:false to disable autosave, and only enable it when you run the :AutoSave toggle command.
let g:autosave_disable_inside_paths = [] " A list of paths inside which autosave should be disabled. 
```
If you use Lua to configure the plugin, you can use |vim.g| to set these variables. 

If you use Neovim, you can run `:checkhealth autosave` to check your configuration.

## FAQ

### When editing Neovim config files, a message saying "Config changed" keeps appearing. 

This is likely because your package manager (such as `lazy.nvim`) would automatically reload your config when it detects change there. To prevent this, you can disable that behavior of your plugin manager, or just disable autosave when editing your config files.

Using Vimscript: 

```vim
let g:autosave_disable_inside_paths = [ stdpath('config') ]
```

Using Lua:

```lua
vim.g.autosave_disable_inside_paths = { vim.fn.stdpath('config') }
```

# Contributing

If you encounter any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request on this GitHub repository. 
