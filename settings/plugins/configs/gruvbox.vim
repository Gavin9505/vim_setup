let g:gruvbox_contrast_dark='hard'

if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
	if (has("termguicolors"))
		set termguicolors
	endif
endif

colorscheme gruvbox
