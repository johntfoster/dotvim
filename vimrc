" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" 	This is the personal .vimrc file of John T. Foster
" 	While much of it is beneficial for general use, I would
" 	recommend picking out the parts you want and understand.
"
" }

" Environment {
	" Basics {
		set nocompatible 		" must be first line
	" }

" } 

" Bundles {
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'dantler/vim-alternate'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Raimondi/delimitMate'
Bundle 'wgibbs/vim-irblack'

" }
	
" General {
	set background=dark         " Assume a dark background
	set term=builtin_ansi       " Make arrow and other keys work
	filetype plugin indent on  	" Automatically detect file types.
	syntax on 					" syntax highlighting
	set mouse=a					" automatically enable mouse usage
	"set autochdir 				" always switch to the current file directory.. 
	" not every vim is compiled with this, use the following line instead
	" If you use command-t plugin, it conflicts with this, comment it out.
     "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
	scriptencoding utf-8
	set autowrite                  " automatically write a file when leaving a modified buffer
	set shortmess+=filmnrxoOtT     	" abbrev. of messages (avoids 'hit enter')
	set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
	set virtualedit=onemore 	   	" allow for cursor beyond last character
	set history=1000  				" Store a ton of history (default is 20)
	set spell 		 	        	" spell checking on
	
	" Setting up the directories {
		set backup 						" backups are nice ...
		set backupdir=$HOME/.vimbackup//  " but not when they clog .
		set directory=$HOME/.vimswap// 	" Same for swap files
		set viewdir=$HOME/.vimviews// 	" same for view files
		
		"" Creating directories if they don't exist
		silent execute '!mkdir -p $HOME/.vimbackup'
		silent execute '!mkdir -p $HOME/.vimswap'
		silent execute '!mkdir -p $HOME/.vimviews'
		au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
		au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
	" }
" }

" Vim UI {
	colorscheme ir_black            " load a colorscheme
	set tabpagemax=15 				" only show 15 tabs
	set showmode                   	" display the current mode

	set cursorline  				" highlight current line
	hi cursorline guibg=#333333 	" highlight bg color of current line
	hi CursorColumn guibg=#333333   " highlight cursor

	if has('cmdline_info')
		set ruler                  	" show the ruler
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
		set showcmd                	" show partial commands in status line and
									" selected characters/lines in visual mode
	endif

	if has('statusline')
		set laststatus=2           	" show statusline only if there are > 1 windows
		" Use the commented line if fugitive isn't installed
		"set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P " a statusline, also on steroids
		"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
	endif

	set backspace=indent,eol,start 	" backspace for dummys
	set linespace=0 				" No extra spaces between rows
	set nu 							" Line numbers on
	set showmatch                  	" show matching brackets/parenthesis
	set incsearch 					" find as you type search
	set hlsearch 					" highlight search terms
	set winminheight=0 				" windows can be 0 line high 
	set ignorecase 					" case insensitive search
	set smartcase 					" case sensitive when uc present
	set wildmenu 					" show list instead of just completing
	set wildmode=list:longest,full 	" comand <Tab> completion, list matches, then longest common part, then all.
	set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
	set scrolljump=5 				" lines to scroll when cursor leaves screen
	set scrolloff=3 				" minimum lines to keep above and below cursor
	set foldenable  				" auto fold code
	set gdefault					" the /g flag on :s substitutions by default

" }

" Formatting {
	set wrap                     	" wrap long lines
	set textwidth=79                " set text length
	set formatoptions=qrn1
	set colorcolumn=80              " creates a color column at column 80
	set autoindent                 	" indent at the same level of the previous line
	set shiftwidth=4               	" use indents of 4 spaces
	set expandtab   	       		" tabs are  spaces
	set tabstop=4 					" an indentation every four columns
	set matchpairs+=<:>            	" match, to be used with % 
	set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)
	set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
" }

" Key Mappings {
	
	"Change the <leader> key
	let mapleader = ","	
	
    "Clear a search
	nnoremap <leader><space> :noh<cr>

	"Allow ; to be the same as :
	nnoremap ; :

	"Map jj to <ESC>
	inoremap jj <ESC>

	"Allow new mapping to split and change to new window
	noremap <leader>w <C-w>v<C-w>l

	"Mapping for Ack
	nnoremap <leader>a :Ack

	"Open NERDTree
	nmap <leader>n :NERDTree<cr>
	
	"Run current file in shell
	nmap <leader>sh :w <cr> :!chmod a+x % && ./%<cr>

	"Open a new tab
	imap <leader>nt <ESC>:tabnew<CR>
	map <leader>nt :tabnew<CR>
	
	" Easier moving in tabs and windows
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

	" Stupid shift key fixes
	cmap W w 						
	cmap WQ wq
	cmap wQ wq
	cmap Q q
	cmap Tabe tabe

	" Yank from the cursor to the end of the line, to be consistent with C and D.
	nnoremap Y y$

	" Shortcuts
	" Change Working Directory to that of the current file
    cmap cwd lcd %:p:h

	" For when you forget to sudo.. Really Write the file.
	cmap w!! w !sudo tee % >/dev/null

	" Fix movement keys
	nnoremap <up> <nop>
	nnoremap <down> <nop>
	nnoremap <left> <nop>
	nnoremap <right> <nop>
	inoremap <up> <nop>
	inoremap <down> <nop>
	inoremap <left> <nop>
	inoremap <right> <nop>
	nnoremap j gj
	nnoremap k gk
	
	" Open .vimrc file in new tab
	nmap <leader>v :tabedit $MYVIMRC<CR>

	" Save on losing focus
	au FocusLost * :wa

" }

" GUI Settings {
	" GVIM- (here instead of .gvimrc)
	if has('gui_running')
		set guioptions-=T          	" remove the toolbar
		set lines=40               	" 40 lines of text instead of 24,
	endif
" }

