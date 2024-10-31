# autosave.nvim

autosave.nvim is a Neovim plugin that provides automatic saving functionality. It allows you to toggle autosave on and off, check the current autosave status, and customize the plugin's behavior.

## Installation

To install autosave.nvim, you can use your favorite plugin manager. For example, using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
require("lazy").setup({
    {
        "brianhuster/autosave.nvim",
        event="InsertEnter",
        opts = {} -- Configuration here
    },
})
```

You can also install the plugin from [luarocks](https://github.com/) [rocks.nvim](https://github.com/nvim-neorocks/rocks.nvim) to install autosave.nvim:

```vim
:Rocks install autosave.nvim
```

## Usage

### Enabling and Disabling Autosave

To toggle autosave on and off, you can use the `:AutoSave toggle` command. This command will enable autosave if it's currently disabled, and disable it if it's currently enabled.

### Checking Autosave Status

To check the current autosave status, you can use the `:AutoSave status` command. This command will display a notification indicating whether autosave is currently enabled or disabled.

### Customizing Autosave

You can customize the behavior of autosave.nvim by providing a configuration table when calling the `setup` function. The following options are available:

- `enabled` (boolean, default: true): Whether autosave is enabled by default when the plugin is loaded.


## Contributing

If you encounter any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request on this GitHub repository. Goodbye and see you next time!


