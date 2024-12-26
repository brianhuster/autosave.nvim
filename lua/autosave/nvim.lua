local M = {}

local fn = vim.fn

--- Execute block of VimL code
--- @param command string
--- @param opts table
--- 		- output boolean
--- @return string|nil
function M.exec2(command, opts)
	if M.bool(fn.has('nvim')) then
		vim.api.nvim_exec2(command, opts)
	else
		if opts and opts.output then
			return fn.execute(command)
		else
			vim.command(command)
		end
	end
end

function M.bool(value)
	if value == 0 or not value then
		return false
	else
		return true
	end
end

function M.buf_get_name()
	if M.bool(fn.has('nvim')) then
		return vim.api.nvim_buf_get_name(0)
	else
		return vim.buffer().fname
	end
end

function M.eval(expr)
	if M.bool(fn.has('nvim')) then
		return vim.api.nvim_eval(expr)
	else
		return vim.eval(expr)
	end
end

return M
