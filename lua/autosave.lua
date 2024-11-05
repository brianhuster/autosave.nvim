local compat = require('autosave.compat')
local vim_bool = compat.vim_bool
local vim_not = compat.vim_not

local M = {}

local function hasFileName()
	local filename = compat.bufname()
	return filename ~= "" or filename ~= "[No Name]"
end

function M.save()
	local buftype = compat.bo('buftype')
	local modified = vim_bool(compat.bo('modified'))
	local modifiable = vim_bool(compat.bo('modifiable'))
	if buftype ~= "" then
		return
	end
	if vim_bool(vim.g.autosave_enabled) and hasFileName and modifiable and modified then
		compat.cmd('silent! write')
	end
end

function M.toggle()
	vim.g.autosave_enabled = vim_not(vim.g.autosave_enabled)
	if vim_bool(vim.g.autosave_enabled) then
		print("Autosave enabled")
	else
		print("Autosave disabled")
	end
end

function M.status()
	if vim_bool(vim.g.autosave_enabled) then
		print("Autosave is currently enabled")
	else
		print("Autosave is currently disabled")
	end
end

function M.setup(user_config)
	if not vim_bool(vim.fn.has('nvim')) then
		print("require('autosave').setup() is only supported in Neovim")
		return
	end

	local default_config = {
		enabled = true
	}

	local config = vim.tbl_deep_extend("force", default_config, user_config or {})
	vim.g.autosave_enabled = config.enabled
end

return M
