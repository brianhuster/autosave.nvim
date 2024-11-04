local M = {}
local autosave_enabled = true

local default_config = {
	enabled = true, -- Enable autosave by default
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

	vim.api.nvim_create_user_command('Autosave', function(opts)
			if opts.args == 'toggle' then
				M.toggle()
			elseif opts.args == 'status' then
				M.status()
			else
				vim.notify("Unknown argument: " .. opts.args)
			end
		end,
		{
			nargs = 1,
			complete = function(ArgLead, CmdLine, CursorPos)
				local subcommands = { 'toggle', 'status' }
				local subcommand = vim.split(CmdLine, " ")[2]
				if subcommand == "" then
					return subcommands
				elseif subcommand == ArgLead then
					local suggestions = {}
					for _, cmd in ipairs(subcommands) do
						if cmd:match(ArgLead) then
							table.insert(suggestions, cmd)
						end
					end
					return suggestions
				end
			end
		})
end

return M
