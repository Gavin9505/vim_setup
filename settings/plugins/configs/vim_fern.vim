let g:fern#renderer = "nerdfont"

function! s:fern_settings() abort
	nmap <silent> <buffer> p <Plug>(fern-action-preview:toggle)
	nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
	nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
	nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
	nmap <silent> <buffer> d <Plug>(fern-action-remove)
endfunction
	set undofile             " 开启撤销文件

augroup fern-settings
	autocmd!
	autocmd FileType fern call s:fern_settings()
augroup END



function! Fern_mapping_fzf_customize_option(spec)
	let a:spec.options .= ' --multi'
	" Note that fzf#vim#with_preview comes from fzf.vim
	if exists('*fzf#vim#with_preview')
		return fzf#vim#with_preview(a:spec)
	else
		return a:spec
	endif
endfunction

function! Fern_mapping_fzf_before_all(dict)
	if !len(a:dict.lines)
		return
	endif
	return a:dict.fern_helper.async.update_marks([])
endfunction

function! s:reveal(dict)
	execute "FernReveal -wait" a:dict.relative_path
	execute "normal \<Plug>(fern-action-mark:set)"
endfunction

let g:Fern_mapping_fzf_file_sink = function('s:reveal')
let g:Fern_mapping_fzf_dir_sink = function('s:reveal')


