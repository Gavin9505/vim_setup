"System"
	syntax on
	set nocompatible
	set backspace=indent,eol,start
	set history=500
	set mouse=a
	set autowrite
	"set foldmethod=syntax
	set clipboard=unnamed
	set noequalalways
	set pumheight=10
	set hidden
	set completeopt="meun,menuone,noselect"
	set encoding=utf-8
	set updatetime=100	
"Indent"
	set cindent
	"set cinwords
	set noexpandtab
	set tabstop=8
	set softtabstop=4
	set shiftwidth=4
	set smarttab
	set listchars=tab:>-,space:.
	hi SpecialKey guifg=darkgrey ctermfg=grey

"Search"
	set ignorecase
	set smartcase
	set incsearch
	set hlsearch
	set showmatch
	hi Search cterm=reverse ctermbg=none ctermfg=none

"UI config"
	set showcmd
	set showmode
	set relativenumber
	set splitbelow
	set splitright
	set cursorline
	set number
	set ruler
	set confirm
	set background=dark
	set laststatus=2

"Backup"
	set noswapfile
	set undofile
	let undoDirPath = expand('~/.vim/undodir')

	if !isdirectory(undoDirPath)
		call mkdir(undoDirPath  ,'p')
	endif
	
	execute 'set undodir=' . undoDirPath 
"Terminal"
	set termguicolors
	"Gruvbox color"
	let g:terminal_ansi_colors = [
	    \ '#282828', '#cc241d', '#98971a', '#d79921',
	    \ '#458588', '#b16286', '#689d6a', '#a89984',
	    \ '#928374', '#fb4934', '#b8bb26', '#fabd2f',
	    \ '#83a598', '#d3869b', '#8ec07c', '#ebdbb2'
	    \ ]
