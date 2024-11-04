local M = {}

function M.cmd(command)
	if vim.fn.has('nvim') then
		vim.cmd(command)
	else
		vim.command(command)
	end
end

function M.bufname()
	if vim.fn.has('nvim') then
		return vim.api.nvim_buf_get_name(0)
	else
		return vim.buffer().name
	end
end

function M.bo(opt)
	if vim.fn.has('nvim') then
		return vim.bo[opt]
	else
		return vim.eval('&' .. opt)
	end
end

return M
