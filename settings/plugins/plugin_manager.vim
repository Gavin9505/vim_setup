"Automatic Install 'vim-plug'
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif




"Automatic install missing plugins on startup
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\| PlugInstall --sync | source $MYVIMRC
\|endif




"Plug_list"
call plug#begin('~/.vim/plugged')

	"file system"
	Plug 'lambdalisue/fern.vim'
	Plug 'yuki-yano/fern-preview.vim'
	Plug 'LumaKernel/fern-mapping-fzf.vim'
	Plug 'lambdalisue/vim-fern-renderer-nerdfont'

	"Icons"
	Plug 'lambdalisue/vim-nerdfont'

	"fuzzy search
	Plug 'junegunn/fzf',{'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	"Outline	
	Plug 'preservim/tagbar'

	"colorscheme
	Plug 'morhetz/gruvbox'

	"Tag file managment"
	Plug 'ludovicchabant/vim-gutentags'

	"State line
	Plug 'bling/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	"Langage Server protocol"
	Plug 'neoclide/coc.nvim',{'branch': 'release'}
	"Translator tool"
	Plug 'voldikss/vim-translator'


call plug#end()




"Use 'gx' open GitHub URLs on browser
function! s:plug_gx()
	let line = getline('.')
	let sha  = matchstr(line, '^  \X*\zs\x\{7,9}\ze ')
	let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
		      \ : getline(search('^- .*:$', 'bn'))[2:-2]
	let uri  = get(get(g:plugs, name, {}), 'uri', '')

	if uri !~ 'github.com'
		return
	endif

	let repo = matchstr(uri, '[^:/]*/'.name)
	let url  = empty(sha) ? 'https://github.com/'.repo
		      \ : printf('https://github.com/%s/commit/%s', repo, sha)
	call netrw#BrowseX(url, 0)
endfunction

augroup PlugGx
	autocmd!
	autocmd FileType vim-plug nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
augroup END




"Add 'PlugHelp' command of browse help and README.md file
function! s:plug_help_source()
	let lines = []
	let longest = keys(g:plugs)->map({_, v -> strlen(v)})->max()
	for [name, plug] in items(g:plugs)
		let matches = []
		for pat in ['doc/*.txt', 'README.md']
			let match = get(split(globpath(plug.dir, pat), "\n"), 0, '')
			if len(match)
				call add(lines, printf("%-"..longest.."s\t%s\t%s", name, fnamemodify(match, ':t'), match))
			endif
		endfor
	endfor
	return sort(lines)
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
	\ 'source': s:plug_help_source(),
	\ 'sink':   { line -> execute('tabedit '..split(line)[-1]) },
	\ 'options': ['--reverse', '--delimiter=\t', '--with-nth=1..2', '--preview', 'bat --style=numbers --color=always {-1}']}))


