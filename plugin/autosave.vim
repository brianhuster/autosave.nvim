" Create an autocmd group for autosave
augroup AutoSaveGroup
  autocmd!
  autocmd InsertLeave,TextChanged,TextChangedI * call v:lua.require'autosave'.save()
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
  let subcommand = split(a:CmdLine, ' ')[1]
  if empty(subcommand)
    return subcommands
  elseif subcommand == a:ArgLead
    return filter(subcommands, 'v:val =~ "^' . a:ArgLead . '"')
  endif
endfunction

autocmd BufRead,BufNewFile */autosave.nvim/doc/*.txt set filetype=help
set autowriteall
