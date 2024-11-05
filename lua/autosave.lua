require('autosave.compat')

local M = {}

local function hasFileName()
	local filename = vim.api.nvim_buf_get_name(0)
	return filename ~= "" or filename ~= "[No Name]"
end

function M.save()
	local buftype = vim.api.nvim_get_option_value('buftype', {})
	local modified = vim.bool(vim.api.nvim_get_option_value('modified', {}))
	local modifiable = vim.bool(vim.api.nvim_get_option_value('modifiable', {}))
	if buftype ~= "" then
		return
	end
	if vim.bool(vim.g.autosave_enabled) and hasFileName and modifiable and modified then
		vim.cmd('silent! write')
	end
end

function M.toggle()
	vim.g.autosave_enabled = not vim.bool(vim.g.autosave_enabled)
	if vim.bool(vim.g.autosave_enabled) then
		print("Autosave enabled")
	else
		print("Autosave disabled")
	end
end

function M.status()
	if vim.bool(vim.g.autosave_enabled) then
		print("Autosave is currently enabled")
	else
		print("Autosave is currently disabled")
	end
end

function M.setup(user_config)
	if not vim.bool(vim.fn.has('nvim')) then
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
