local nvim = require('autosave.nvim')
local bool = nvim.bool

local M = {}

function M.save()
	local autosave_enabled = bool(vim.g.autosave_enabled) and bool(vim.b.autosave_enabled)
	print("Autosave enabled: " .. tostring(autosave_enabled))
	local modified = bool(nvim.eval('&modified'))
	local modifiable = bool(nvim.eval('&modifiable'))
	if autosave_enabled and modifiable and modified then
		nvim.exec2('silent! write', {})
	end
end

function M.on()
	vim.g.autosave_enabled = true
	print("Autosave enabled")
end

function M.off()
	vim.g.autosave_enabled = false
	print("Autosave disabled")
end

function M.toggle()
	vim.g.autosave_enabled = not bool(vim.g.autosave_enabled)
	print("Autosave " .. (bool(vim.g.autosave_enabled) and "enabled" or "disabled"))
end

--- Execute Autosave command with args
--- @param args string
function M.execute(args)
	if args[1] == "on" then
		M.on()
	elseif args[1] == "off" then
		M.off()
	elseif args[1] == "toggle" then
		M.toggle()
	elseif args[1] == "status" then
		M.print_status()
	else
		print("Invalid subcommand: " .. args)
	end
end

--- Check if a buffer can be autosaved
--- @return boolean
function M.check_buffer()
	--- Check if being a normal buffer
	if nvim.eval("&buftype") ~= "" then
		vim.b.autosave_enabled = false
		return false
	end

	local path = nvim.buf_get_name()
	for i = 1, #vim.g.autosave_disable_inside_paths do
		local pattern = vim.g.autosave_disable_inside_paths[i]
		pattern = vim.fn.expand(pattern)
		if path:sub(1, #pattern) == pattern and bool(vim.b.autosave_enabled) then
			print("Disable autosave for this buffer because it is inside " .. pattern)
			vim.b.autosave_enabled = false
			return false
		end
	end
	vim.b.autosave_enabled = true
	return true
end

function M.print_status()
	if bool(vim.g.autosave_enabled) then
		print("Autosave is currently enabled")
	else
		print("Autosave is currently disabled")
	end
end

function M.setup(user_config)
	if not bool(vim.fn.has('nvim')) then
		print("require('autosave').setup() is only supported in Neovim")
		return
	end

	local default_config = {
		enabled = true,
		disable_inside_paths = {},
	}

	local config = vim.tbl_deep_extend("force", default_config, user_config or {})
	for key, value in pairs(config) do
		vim.g["autosave_" .. key] = value
	end
end

return M
