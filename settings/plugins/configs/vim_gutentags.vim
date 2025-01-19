"Gutentags setting
let g:gutentags_project_root = ['.git', '.hg', '.svn', '.project']
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_cscope_build_inverted_index = 1
let g:gutentags_modules = ['ctags']

set tags=./tags,tags;

"Cscope setting
if has("cscope")
	set cst
	set csto=0
	set cspc=0
	set cscopeverbose

	if filereadable("./tags/cscope.out")
		cs add ./tags/cscope.out
		"else search cscope.out elsewhere
	endif

	nnoremap cs :cs find s <C-R>=expand("<cword>")<CR><CR>
	nnoremap cg :cs find g <C-R>=expand("<cword>")<CR><CR>
	nnoremap cc :cs find c <C-R>=expand("<cword>")<CR><CR>
	nnoremap ct :cs find t <C-R>=expand("<cword>")<CR><CR>
	nnoremap ce :cs find e <C-R>=expand("<cword>")<CR><CR>
	nnoremap cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nnoremap ci :cs find i <C-R>=expand("<cfile>")<CR><CR>
	nnoremap cd :cs finf d <C-R>=expand("<cword>")<CR><CR>
endif





