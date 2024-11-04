local M = {}

function M.cmd(command)
	if vim.fn.has('nvim') then
		vim.cmd(command)
	else
		vim.command(command)
	end
end

function M.check(value)
	if value == 0 or not value then
		return false
	else
		return true
	end
end

function M.vim_not(value)
	if M.check(value) then
		return false
	else
		return true
	end
end

function M.bufname()
	if vim.fn.has('nvim') then
		return vim.api.nvim_buf_get_name(0)
	else
		return vim.buffer().name
	end
end

function M.bo(key)
	if vim.fn.has('nvim') then
		return vim.bo[key]
	else
		return vim.eval('&' .. key)
	end
end

return M
