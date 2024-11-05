local M = {}

function M.cmd(command)
	if M.vim_bool(vim.fn.has('nvim')) then
		vim.cmd(command)
	else
		vim.command(command)
	end
end

function M.vim_bool(value)
	if value == 0 or not value then
		return false
	else
		return true
	end
end

function M.vim_not(value)
	if M.vim_bool(value) then
		return false
	else
		return true
	end
end

function M.bufname()
	if M.vim_bool(vim.fn.has('nvim')) then
		return vim.api.nvim_buf_get_name(0)
	else
		return vim.buffer().name
	end
end

function M.bo(key)
	if M.vim_bool(vim.fn.has('nvim')) then
		return vim.bo[key]
	else
		return vim.eval('&' .. key)
	end
end

return M
