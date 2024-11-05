local compat = require('autosave.compat')
local check = compat.bool

local M = {}

local function hasFileName()
	local filename = compat.bufname()
	return filename ~= "" or filename ~= "[No Name]"
end

function M.save()
	local buftype = compat.option('buftype')
	local modified = check(compat.option('modified'))
	local modifiable = check(compat.option('modifiable'))
	if buftype ~= "" then
		return
	end
	if check(vim.g.autosave_enabled) and hasFileName and modifiable and modified then
		compat.cmd('silent! write')
	end
end

function M.toggle()
	vim.g.autosave_enabled = not bool(vim.g.autosave_enabled)
	if compat.bool(vim.g.autosave_enabled) then
		print("Autosave enabled")
	else
		print("Autosave disabled")
	end
end

function M.status()
	if check(vim.g.autosave_enabled) then
		print("Autosave is currently enabled")
	else
		print("Autosave is currently disabled")
	end
end

function M.setup(user_config)
	if not check(vim.fn.has('nvim')) then
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
