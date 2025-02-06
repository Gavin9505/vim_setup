"Windows navigaion
nnoremap <Tab> <C-w>w
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Resize with arrows
nnoremap <S-Down> <C-w>+ :resize -2<CR>
nnoremap <S-Up> <C-w>- :resize +2<CR>
nnoremap <S-Left> <C-w>> :vertical resize +2<CR>
nnoremap <S-Right> <C-w>< :vertical resize -2<CR>

"Tabs navigaion
nnoremap <S-Home> :tabprevious<CR>
nnoremap <S-End> :tabnext<CR>

"Terminal
nnoremap <F3> :terminal<CR>

"Plugin Teanslate
nnoremap tt :TranslateW<CR>

"Plugin Fern
nnoremap <F5> :Fern -drawer . -toggle -stay<CR>

"Plugin TagsBar
nnoremap <F8> :TagbarToggle<CR>

"Support visual mode, use ctrl + y to copy text"
vnoremap <C-y> "+y

"Support noremal mode, use ctrl + y to past text"
nnoremap <C-p> "*p
