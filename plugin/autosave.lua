require('autosave').setup()

vim.filetype.add({
	pattern = {
		[".*/autosave%.nvim/doc/.+%.txt"] = "help",
	},
})
