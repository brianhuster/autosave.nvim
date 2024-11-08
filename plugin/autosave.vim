let compatible = luaeval("require'autosave.health'.compatible()")
let min_vim = luaeval("require'autosave.health'.min_vim")
let min_nvim = luaeval("require'autosave.health'.min_nvim")
if !compatible
	echoerr printf("autosave.vim requires Vim >= %s with +lua feature or Neovim >= %s", min_vim, min_nvim)
	finish
endif


" Set the default values for configuration variables
if !exists('g:autosave_enabled')
	let g:autosave_enabled = v:true
endif
if !exists('g:autosave_disable_on_path')
	let g:autosave_disable_inside_paths = []
endif

" Create an autocmd group for autosave
augroup AutoSaveGroup
	autocmd!
	autocmd BufRead,BufEnter * lua require'autosave'.check_buffer()
	autocmd InsertLeave,TextChanged,TextChangedI * lua require'autosave'.save()
augroup END

" Create a user command for Autosave
command! -nargs=1 -complete=customlist,AutosaveComplete Autosave call luaeval("require'autosave'.execute(_A)", [<f-args>])

function! AutosaveComplete(ArgLead, CmdLine, CursorPos) abort
	return luaeval("require'autosave'.cmdlineComplete(_A)", [a:ArgLead, a:CmdLine, a:CursorPos])
endfunction

set autowriteall
