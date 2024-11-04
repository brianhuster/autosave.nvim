local M = {}
if not vim.g.autosave_enabled then
	vim.g.autosave_enabled = true
end

if not vim.cmd then
	vim.cmd = vim.command
end

local function hasFileName()
	local filename = vim.fn.expand("%:t")
	return filename ~= "" or filename ~= "[No Name]"
end

function M.save()
	local buftype = vim.fn.has('nvim') == 1 and vim.bo.buftype or vim.eval("&buftype")
	if buftype ~= "" then
		return
	end
	local modified = vim.fn.has('nvim') == 1 and vim.bo.modified or vim.eval("&modified")
	if vim.g.autosave_enabled and hasFileName and modified and modified ~= 0 then
		vim.cmd('silent! write')
	end
end

function M.toggle()
	vim.g.autosave_enabled = not vim.g.autosave_enabled
	if vim.g.autosave_enabled then
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
