if vim.fn.has('nvim') == 0 then
	print("`:checkhealth` is only supported in Neovim")
	return
end

local M = {}

local health = vim.health

M.check = function()
	health.start('Check requirements')
	local vimver = string.format('%s.%s.%s', vim.version().major, vim.version().minor, vim.version().patch)
	if vim.fn.has('nvim-0.9') == 0 then
		health.error('Neovim version is too old', 'Update to Neovim 0.9 or later')
	else
		health.ok('Neovim %s is compatible with with autosave.nvim', vimver)
	end
end

return M