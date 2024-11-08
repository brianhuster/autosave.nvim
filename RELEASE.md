## New features

New configuration options :

`g:autosave_disable_inside_paths` or `opts.disable_inside_paths` : A list of paths inside which autosave should be disabled. In Neovim, it is recommended to set this to [stdpath('config')] to disable autosave for files inside your Neovim configuration directory, so that Neovim doesn't reload whenever you type inside your configuration files.
