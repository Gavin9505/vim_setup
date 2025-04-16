"Windows navigaion
nnoremap <Tab> <C-w>w
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Horizontal split current window.
nnoremap sp :split<CR>

"Vertical split current window.
nnoremap vsp :vsplit<CR>

"Resize with arrows
nnoremap <S-Down> <C-w>+ :resize +2<CR>
nnoremap <S-Up> <C-w>- :resize -2<CR>
nnoremap <S-Left> <C-w>> :vertical resize +2<CR>
nnoremap <S-Right> <C-w>< :vertical resize -2<CR>

"Tabs navigaion
nnoremap tn :tabnew<CR>
nnoremap th :tabprevious<CR>
nnoremap tl :tabnext<CR>

"Support visual mode, use ctrl + y to copy text"
vnoremap <C-y> "+y

"Support noremal mode, use ctrl + y to past text"
nnoremap <C-p> "*p


"<User module support =================================>

"< Focus Mode >
"Module FocusMode, focusMode toggle.
nnoremap <silent><F2> :FocusModeToggle<CR>

" < Terminal Mode >
"Module terminal: toggle the main terminal (default profile).
nnoremap <silent> <F3> :TermToggle default<CR>

"Module terminal: exit terminal mode (back to normal mode).
"tnoremap <Esc><Esc> <C-\><C-n>

"Module terminal: exit terminal mode and close window.
tnoremap <C-q> <C-\><C-n>:close<CR>

"Module terminal: open a new terminal instance (default profile).
nnoremap <Leader>tn :TermNew default<CR>

"Module terminal: show a list of current terminal buffers.
nnoremap <Leader>tl :TermList<CR>

"Module terminal: pick a terminal buffer using FZF.
nnoremap <Leader>tk :TermPick<CR>

"Module terminal: directional window navigation in terminal/normal mode.
for [lhs, rhs] in [['<C-h>', 'h'], ['<C-j>', 'j'], ['<C-k>', 'k'], ['<C-l>', 'l']]
  execute 'tnoremap <silent> ' . lhs . ' <C-\><C-N><C-w>' . rhs
  execute 'nnoremap <silent> ' . lhs . ' <C-w>' . rhs
endfor



"<Requires plugin support =============================>

"Plugin Fern, toggle fern. 
nnoremap <F5> :Fern -drawer . -toggle -stay<CR>

"Plugin TagsBar, toggle tagsBar.
nnoremap <F8> :TagbarToggle<CR>

"Plugin Translate, Content Translate.
nnoremap <Leader>tra :TranslateW<CR>

"Package FZF, File fuzzy search
nnoremap <Leader>ff :FZF<CR>

"Package Ripgrep, Content fuzzy search
nnoremap <Leader>rg :Rg<CR>

