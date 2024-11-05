local M = {}

function M.cmd(command)
	if M.bool(vim.fn.has('nvim')) then
		vim.cmd(command)
	else
		vim.command(command)
	end
end

function M.bool(value)
	if value == 0 or not value then
		return false
	else
		return true
	end
end

function M.bufname()
	if M.bool(vim.fn.has('nvim')) then
		return vim.api.nvim_buf_get_name(0)
	else
		return vim.buffer().fname
	end
end

function M.option(key)
	if M.bool(vim.fn.has('nvim')) then
		return vim.o[key]
	else
		return vim.eval('&' .. key)
	end
end

return M
