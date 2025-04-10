if exists("g:loaded_terminal_toggle")
  finish
endif
let g:loaded_terminal_toggle = 1

command! Term call s:term_toggle('bash')
command! TermGDB call s:term_toggle('gdb')
command! TermPy call s:term_toggle('python3')
command! -nargs=1 TermExec call s:term_toggle(<q-args>)
command! TermKillAll call s:term_kill_all()

nnoremap <silent> <leader>tt :Term<CR>
nnoremap <silent> <leader>tg :TermGDB<CR>
nnoremap <silent> <leader>tp :TermPy<CR>

function! s:term_toggle(profile) abort
  let l:bufname = 'term://' . a:profile

  for l:buf in getbufinfo({'buflisted': 1})
    if bufname(l:buf.bufnr) ==# l:bufname
      if bufwinnr(l:buf.bufnr) != -1
        call job_stop(term_getjob(l:buf.bufnr))
        execute l:buf.bufnr . 'bwipeout!'
        return
      endif
    endif
  endfor

  execute 'botright split +' . a:profile
  let l:cmd = (a:profile ==# 'bash') ? &shell : a:profile
  call term_start(l:cmd, #{term_name: l:bufname, curwin: v:true})
  call s:term_apply_ui_settings()
endfunction

function! s:term_apply_ui_settings() abort
  if &buftype !=# 'terminal'
    return
  endif

  setlocal nonumber norelativenumber signcolumn=no nowrap
  startinsert

  let &t_SI = "\e[5 q"
  let &t_SR = "\e[3 q"
  let &t_EI = "\e[1 q"

  set termguicolors
  let &t_8f = "\e[38;2;%lu;%lu;%lum"
  let &t_8b = "\e[48;2;%lu;%lu;%lum"

  let &t_BE = "\e[?2004h"
  let &t_BD = "\e[?2004l"
  let &t_PS = "\e[200~"
  let &t_PE = "\e[201~"

  let &t_fe = "\e[?1004h"
  let &t_fd = "\e[?1004l"
  execute "set <FocusGained>=\e[I"
  execute "set <FocusLost>=\e[O"

  set ttymouse=sgr
endfunction

function! s:term_kill_all() abort
  for l:buf in getbufinfo({'buflisted': 1})
    if getbufvar(l:buf.bufnr, '&buftype') ==# 'terminal'
      call job_stop(term_getjob(l:buf.bufnr))
      execute l:buf.bufnr . 'bwipeout!'
    endif
  endfor
endfunction
