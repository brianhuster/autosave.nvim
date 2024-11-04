# autosave.nvim

[![LuaRocks](https://img.shields.io/luarocks/v/brianhuster/autosave.nvim?logo=lua&color=purple)](https://luarocks.org/modules/brianhuster/autosave.nvim)

autosave.nvim is a Neovim and Vim plugin that provides automatic saving functionality. It allows you to toggle autosave on and off, check the current autosave status, and customize the plugin's behavior.

## Installation

This plugin requires Neovim or Vim >=8.2 compiled with Lua support. You can check if your version of Vim supports Lua by running `:echo has("lua")` in the editor.

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

## Usage

### Enabling and Disabling Autosave

To toggle autosave on and off, you can use the `:AutoSave toggle` command. This command will enable autosave if it's currently disabled, and disable it if it's currently enabled.

### Checking Autosave Status

To check the current autosave status, you can use the `:AutoSave status` command. This command will display a notification indicating whether autosave is currently enabled or disabled.

### Customizing Autosave

`vim.g.autosave_enabled` (default : `v:true`) : Set to `v:true` to enable autosave by default, or `v:false` to disable autosave by default.

## Contributing

If you encounter any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request on this GitHub repository. Goodbye and see you next time!


