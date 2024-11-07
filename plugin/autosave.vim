let compatible = v:false
let min_nvim = '0.9'
let min_vim = '8.2.0'
if has('nvim-' .. min_nvim)
	let compatible = v:true
endif
if has("patch-" .. min_vim) && has("lua")
	let compatible = v:true
endif

if !compatible
	echoerr printf("autosave.vim requires Neovim %s or Vim %s with +lua feature", min_nvim, min_vim)
	finish
endif

if !exists('g:autosave_enabled')
	let g:autosave_enabled = v:true
endif

" Create an autocmd group for autosave
augroup AutoSaveGroup
	autocmd!
	autocmd InsertLeave,TextChanged,TextChangedI * lua require'autosave'.save()
augroup END

" Create a user command for Autosave
command! -nargs=1 -complete=customlist,AutosaveComplete Autosave call s:Autosave(<f-args>)

function! s:Autosave(args) abort
	if a:args == 'toggle'
		lua require'autosave'.toggle()
	elseif a:args == 'status'
		lua require'autosave'.status()
	else
		echo "Unknown argument: " . a:args
	endif
endfunction

function! AutosaveComplete(ArgLead, CmdLine, CursorPos) abort
	let subcommands = ['toggle', 'status']
	let cmd_parts = split(a:CmdLine, ' ')
	if len(cmd_parts) < 2
		return subcommands
	endif
	let subcommand = cmd_parts[1]
	if empty(subcommand)
		return subcommands
	elseif subcommand == a:ArgLead
		return filter(subcommands, 'v:val =~ "^' . a:ArgLead . '"')
	endif
endfunction

autocmd BufRead,BufNewFile */autosave.nvim/doc/*.txt set filetype=help
set autowriteall
