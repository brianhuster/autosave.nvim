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

function M.bo(key)
	if vim.fn.has('nvim') then
		return vim.bo[key]
	else
		if key == "modified" or key == "modifiable" then
			return vim.eval('&' .. key) == 1 and true or false
		else
			return vim.eval('&' .. key)
		end
	end
end

return M
