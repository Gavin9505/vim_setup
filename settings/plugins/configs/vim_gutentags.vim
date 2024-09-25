"Gutentags setting
let g:gutentags_project_root = ['.git', '.hg', '.svn', '.project']
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_cscope_build_inverted_index = 1
"let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+aimS', '--extras=+q', '--c-kinds=+px']
let g:gutentags_modules = ['ctags', 'cscope']

set tags=./tags,tags;
"Cscope setting
if has("cscope")
	set cst
	set csto=0
	set cspc=0
	set cscopeverbose

	if filereadable("cscope.out")
		cs add cscope.out
		"else search cscope.out elsewhere
	else
		let cscope_file=findfile("cscope.out", ".;")
		"echo cscope_file
		if !empty(cscope_file) && filereadable(cscope_file)
			exe "cs add" cscope_file
		endif      
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





