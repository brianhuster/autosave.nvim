local nvim = require('autosave.nvim')
local bool = nvim.bool

local M = {}

local function hasFileName()
	local filename = nvim.buf_get_name()
	return filename ~= "" or filename ~= "[No Name]"
end

function M.save()
	local buftype = nvim.eval('&buftype')
	local modified = bool(nvim.eval('&modified'))
	local modifiable = bool(nvim.eval('&modifiable'))
	if buftype ~= "" then
		return
	end
	if bool(vim.g.autosave_enabled) and hasFileName and modifiable and modified then
		nvim.exec2('silent! write')
	end
end

function M.toggle()
	vim.g.autosave_enabled = not bool(vim.g.autosave_enabled)
	if bool(vim.g.autosave_enabled) then
		print("Autosave enabled")
	else
		print("Autosave disabled")
	end
end

function M.status()
	if bool(vim.g.autosave_enabled) then
		print("Autosave is currently enabled")
	else
		print("Autosave is currently disabled")
	end
end

function M.setup(user_config)
	if not bool(vim.fn.has('nvim')) then
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
