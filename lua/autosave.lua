local M = {}
local autosave_enabled = true

local default_config = {
	command = "AutoSave", -- Base command name
	toggle_arg = "toggle", -- Argument to toggle autosave
	status_arg = "status", -- Argument to check autosave status
	enabled = true,     -- Enable autosave by default
}

local function hasFileName()
	local filename = vim.fn.expand("%:t")
	return filename ~= "" or filename ~= "[No Name]"
end

function M.save()
	-- check if the buffer is a file
	if vim.bo.buftype ~= "" then
		return
	end
	if autosave_enabled and hasFileName and vim.bo.modified then
		vim.cmd('silent! write')
	end
end

function M.toggle()
	autosave_enabled = not autosave_enabled
	if autosave_enabled then
		vim.notify("Autosave enabled")
	else
		vim.notify("Autosave disabled")
	end
end

function M.status()
	if autosave_enabled then
		vim.notify("Autosave is currently enabled")
	else
		vim.notify("Autosave is currently disabled")
	end
end

function M.setup(user_config)
	local config = vim.tbl_deep_extend("force", default_config, user_config or {})
	autosave_enabled = config.enabled
	vim.o.autowriteall = true

	vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "TextChangedI" }, {
		callback = M.save,
		group = vim.api.nvim_create_augroup("AutoSaveGroup", { clear = true }),
		pattern = "*",
	})

	vim.api.nvim_create_user_command(config.command, function(opts)
		if opts.args == config.toggle_arg then
			M.toggle()
		elseif opts.args == config.status_arg then
			M.status()
		else
			vim.notify("Unknown argument: " .. opts.args)
		end
	end, { nargs = 1 })
end

return M
