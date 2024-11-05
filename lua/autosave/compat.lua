vim.bool = function(value)
	if value == 0 or not value then
		return false
	else
		return true
	end
end

if vim.bool(vim.fn.has('nvim')) then
	if not vim.api.nvim_get_option_value then
		vim.api.nvim_get_option_value = function(name, opts)
			return vim.api.nvim_get_option(name)
		end
	end
	return
end

vim.cmd = vim.command

vim.api = {}

vim.api.nvim_get_option_value = function(name, opts)
	if opts then
		if opts.scope == 'local' then
			return vim.eval('&l:' .. name)
		else
			return vim.eval('&' .. name)
		end
	end
end

--- Get full name of buffer
--- @param number number Buffer number. Or 0 for current buffer.
function vim.api.nvim_buf_get_name(number)
	return number == 0 and vim.buffer().name or vim.buffer(number).name
end
