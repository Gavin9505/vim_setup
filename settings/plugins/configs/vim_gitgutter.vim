let g:gitgutter_preview_win_floating = 1


function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

set statusline+=%{GitStatus()}
    
