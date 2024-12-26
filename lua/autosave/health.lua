local M = {}

local health = vim.health
local bool = require('autosave.nvim').bool

M.min_vim = '8.2.3288'
M.min_nvim = '0.9.0'

M.compatible = function()
	local compatible = false
	if bool(vim.fn.has('nvim-' .. M.min_nvim)) then
		compatible = true
	end
	if bool(vim.fn.has("patch-" .. M.min_vim)) and bool(vim.fn.has("lua")) then
		compatible = true
	end
	return compatible
end

M.check = function()
	if vim.fn.has('nvim') == 0 then
		print("`:checkhealth` is only supported in Neovim")
		return
	end
	health.start('Check requirements')
	local vimver = string.format('%s.%s.%s', vim.version().major, vim.version().minor, vim.version().patch)
	if not M.compatible() then
		health.error("Neovim version is too old", ("Update to Neovim 0.9 or later"):format(M.min_nvim))
	else
		health.ok(("Neovim %s is compatible with with autosave.nvim"):format(vimver))
	end

	health.start('Check configuration')
	health.info('g:autosave_enabled = ' .. tostring(bool(vim.g.autosave_enabled)))
	health.info('g:disable_inside_paths = ' .. vim.inspect(vim.g.disable_inside_paths))
end

return M
