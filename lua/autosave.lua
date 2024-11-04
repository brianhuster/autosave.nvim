local compat = require('autosave.compat')
local check = compat.check
local vim_not = compat.vim_not

local M = {}
if not vim.g.autosave_enabled then
	vim.g.autosave_enabled = true
end

local function hasFileName()
	local filename = compat.bufname()
	return filename ~= "" or filename ~= "[No Name]"
end

function M.save()
	local buftype = compat.bo('buftype')
	local modified = check(compat.bo('modified'))
	local modifiable = check(compat.bo('modifiable'))
	if buftype ~= "" then
		return
	end
	if vim.g.autosave_enabled and hasFileName and modifiable and modified then
		compat.cmd('silent! write')
	end
end

function M.toggle()
	vim.g.autosave_enabled = vim_not(vim.g.autosave_enabled)
	if compat.check(vim.g.autosave_enabled) then
		print("Autosave enabled")
	else
		print("Autosave disabled")
	end
end

function M.status()
	if vim.g.autosave_enabled then
		print("Autosave is currently enabled")
	else
		print("Autosave is currently disabled")
	end
end

function M.setup(user_config)
	if vim.fn.has('nvim') == 0 then
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
