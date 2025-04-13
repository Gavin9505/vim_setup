"Windows navigaion
nnoremap <Tab> <C-w>w
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
"Module FocusMode, focusMode toggle.
nnoremap <F2> :FocusModeToggle<CR>

"Module terminal, terminal toggle.
nnoremap <silent> <F3> :call ToggleTerminal()<CR>

"Module terminal, quickly exit terminal mode.
tnoremap <Esc><Esc> <C-\><C-n>

" 快速離開 terminal 模式
tnoremap <C-q> <C-\><C-n>:close<CR>

"<Requires plugin support =============================>

"Plugin Fern, toggle fern. 
nnoremap <F5> :Fern -drawer . -toggle -stay<CR>

"Plugin TagsBar, toggle tagsBar.
nnoremap <F8> :TagbarToggle<CR>

"Plugin Translate, Content Translate.
nnoremap <Leader>tran :TranslateW<CR>

"Package FZF, File fuzzy search
nnoremap <Leader>ff :FZF<CR>

"Package Ripgrep, Content fuzzy search
nnoremap <Leader>rg :Rg<CR>

