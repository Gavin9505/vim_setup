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
