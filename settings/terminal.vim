" === Profile 定義 ===
let g:my_terminal_profiles = {
      \ 'default': $SHELL,
      \ 'python': ['python3', '-i'],
      \ 'make':   ['make']
      \ }
let g:my_terminal_bufs = {}


" === UI 設定 ===
function! s:SetupTerminalUI(bufnr) abort
  call setbufvar(a:bufnr, '&number', 0)
  call setbufvar(a:bufnr, '&relativenumber', 0)
  call setbufvar(a:bufnr, '&signcolumn', 'no')
  call setbufvar(a:bufnr, '&wrap', 0)
endfunction


" === 單實例 Toggle ===
function! ToggleTerminal(profile, ...) abort
  let l:inplace = get(a:, 1, v:false)
  let l:cmd = get(g:my_terminal_profiles, a:profile, $SHELL)

  if has_key(g:my_terminal_bufs, a:profile)
        \ && bufexists(g:my_terminal_bufs[a:profile])
        \ && getbufvar(g:my_terminal_bufs[a:profile], '&buftype') ==# 'terminal'

    let l:buf = g:my_terminal_bufs[a:profile]
    let l:status = term_getstatus(l:buf)

    if empty(win_findbuf(l:buf)) && l:status =~# 'running'
      if l:inplace
        execute 'buffer' l:buf
      else
        execute 'botright sbuffer' l:buf
      endif
      call s:SetupTerminalUI(l:buf)
      call feedkeys("i", 'n')
      return
    elseif l:status =~# 'running'
      call term_setkill(l:buf, 'kill')
      call term_wait(l:buf, 300)
    endif

    execute 'bwipeout!' l:buf
    call remove(g:my_terminal_bufs, a:profile)
  endif

  let l:buf = term_start(l:cmd, #{term_kill: 'kill', term_finish: 'close', hidden: v:true})
  let g:my_terminal_bufs[a:profile] = l:buf
  let b:terminal_profile = a:profile

  if l:inplace
    execute 'buffer' l:buf
  else
    execute 'botright sbuffer' l:buf
  endif

  call s:SetupTerminalUI(l:buf)
  call feedkeys("i", 'n')
endfunction


" === 多實例開啟 ===
function! TermNew(profile, ...) abort
  let l:inplace = get(a:, 1, v:false)
  let l:cmd = get(g:my_terminal_profiles, a:profile, $SHELL)

  let l:buf = term_start(l:cmd, #{term_kill: 'kill', term_finish: 'close', hidden: v:true})
  call setbufvar(l:buf, 'terminal_profile', a:profile)

  if l:inplace
    execute 'buffer' l:buf
  else
    execute 'botright sbuffer' l:buf
  endif
  call s:SetupTerminalUI(l:buf)
  call feedkeys("i", 'n')
endfunction


" === Focus 主 terminal buffer ===
function! FocusTerminal(profile) abort
  if has_key(g:my_terminal_bufs, a:profile)
        \ && bufexists(g:my_terminal_bufs[a:profile])
    let l:buf = g:my_terminal_bufs[a:profile]
    let l:wins = win_findbuf(l:buf)
    if !empty(l:wins)
      execute win_id2win(l:wins[0]) . 'wincmd w'
      return 1
    endif
  endif
  return 0
endfunction


" === Terminal buffer 快捷切換 ===
function! TermList() abort
  redir => l:out
  silent! echo "Current terminal buffers:"
  for l:bufnr in term_list()
    let l:profile = getbufvar(l:bufnr, 'terminal_profile', '')
    let l:name = bufname(l:bufnr)
    let l:status = term_getstatus(l:bufnr)
    echo printf("  #%d  [%s]  %s", l:bufnr, l:profile, l:status)
  endfor
  redir END
  echo l:out
endfunction


" === FZF 選單切 terminal ===
function! TermPick() abort
  if !exists('*fzf#run')
    echo "fzf.vim not installed"
    return
  endif
  let l:list = []
  for l:buf in term_list()
    let l:profile = getbufvar(l:buf, 'terminal_profile', 'unknown')
    let l:name = bufname(l:buf)
    call add(l:list, printf('%3d │ %-10s │ %s', l:buf, l:profile, l:name))
  endfor
  call fzf#run(fzf#wrap({
        \ 'source': l:list,
        \ 'prompt': 'Terminal> ',
        \ 'sink': function('s:JumpToBufFromLine')
        \ }))
endfunction

function! s:JumpToBufFromLine(line) abort
  let l:parts = split(a:line, '\s\+│')
  let l:buf = str2nr(l:parts[0])
  if bufexists(l:buf)
    execute 'sbuffer' l:buf
  endif
endfunction


" === Commands ===
command! -nargs=? TermToggle call ToggleTerminal(<f-args>)
command! -nargs=? TermNew    call TermNew(<f-args>, v:true)
command! -nargs=? TermFocus  call FocusTerminal(<f-args>)
command! TermList            call TermList()
command! TermPick            call TermPick()


