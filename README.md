# autosave.nvim

autosave.nvim is a Neovim plugin that provides automatic saving functionality. It allows you to toggle autosave on and off, check the current autosave status, and customize the plugin's behavior.

## Installation

To install autosave.nvim, you can use your favorite plugin manager. For example, using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
require("lazy").setup({
    {
        "brianhuster/autosave.nvim",
    },
})
require('autosave').setup()
```

## Usage

### Enabling and Disabling Autosave

To toggle autosave on and off, you can use the `:AutoSave toggle` command. This command will enable autosave if it's currently disabled, and disable it if it's currently enabled.

### Checking Autosave Status

To check the current autosave status, you can use the `:AutoSave status` command. This command will display a notification indicating whether autosave is currently enabled or disabled.

### Customizing Autosave

You can customize the behavior of autosave.nvim by providing a configuration table when calling the `setup` function. The following options are available:

- `command` (string, default: "AutoSave"): The base command name for autosave.nvim. You can change this if you prefer a different command name.
- `toggle_arg` (string, default: "toggle"): The argument to toggle autosave. You can change this if you prefer a different argument name.
- `status_arg` (string, default: "status"): The argument to check autosave status. You can change this if you prefer a different argument name.

Here's an example of how to customize autosave.nvim:

```lua
require('autosave').setup({
    command = "MyAutoSave",
    toggle_arg = "toggleautosave",
    status_arg = "autosavestatus",
})
```

## Contributing

If you encounter any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request on this GitHub repository.
