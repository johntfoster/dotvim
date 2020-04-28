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
    set shell=bash
	" }

" } 

" Plugins{
call plug#begin('~/.vim/plugged')
Plug 'joom/latex-unicoder.vim'
Plug 'jpalardy/vim-slime', { 'for': ['python', 'julia']}
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'mroavi/vim-julia-cell', { 'for': 'julia' }
Plug 'JuliaEditorSupport/julia-vim'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-tagprefix'
Plug 'svermeulen/ncm2-yoink'
Plug 'svermeulen/vim-yoink'
Plug 'fgrsnau/ncm2-otherbuf'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-jedi'
Plug 'roxma/nvim-yarp'
Plug 'yuki-ycino/ncm2-dictionary'
Plug 'ambv/black'
Plug 'goerz/jupytext.vim'
Plug 'ncm2/ncm2-ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
Plug 'lervag/vimtex'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dantler/vim-alternate'
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/zenburn'
Plug 'Raimondi/delimitMate'
Plug 'vim-scripts/Align'
Plug 'vim-pandoc/vim-pandoc'
Plug 'tyru/open-browser.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/jinja'
Plug 'benmills/vimux'
Plug 'wincent/command-t'
Plug 'ervandew/screen'
Plug 'dag/vim-fish'
Plug 'rhysd/vim-clang-format'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end() 
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
    let NERDTreeMapOpenInTab='<ENTER?>'

	"Open IPython
	nmap <leader>ip :IPython<cr>
	vmap <leader>ss :ScreenSend<cr>
	
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

    " Copy to clipboard
    vmap <D-x> :!pbcopy<CR>  
    vmap <D-c> :w !pbcopy<CR><CR>
    set clipboard=unnamed


" }

" Python {
if has('nvim')
    let g:python3_host_prog = '/usr/local/bin/python3'
    let g:python_host_prog = '/Users/john/miniconda3/envs/py27/bin/python'
endif
" }

" Slime {
    let g:slime_target = "tmux"
    let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
    let g:slime_dont_ask_default = 1
" }

 " Ruby {
if has('nvim')
    let g:ruby_host_prog = '/usr/local/opt/ruby/bin/ruby'
endif
" }    

" Airline {
    "let g:airline_theme='solarized'
    let g:airline_solarized_bg='dark' 
    let g:airline_powerline_fonts=1
" }

" Black {
    "auto BufWritePre *.py execute ':Black'
" }

" YCM {
    "let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
    "let g:ycm_server_keep_logfiles = 1
    "let g:ycm_server_log_level = 'debug'
    "let g:ycm_server_python_interpreter ='/usr/local/bin/python3'
    "let g:ycm_python_binary_path = '/usr/local/bin/python3'
" }

" ncm2 {
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANT: :help Ncm2PopupOpen for more information
    au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'vimtex',
            \ 'priority': 1,
            \ 'subscope_enable': 1,
            \ 'complete_length': 1,
            \ 'scope': ['tex'],
            \ 'matcher': {'name': 'combine',
            \           'matchers': [
            \               {'name': 'abbrfuzzy', 'key': 'menu'},
            \               {'name': 'prefix', 'key': 'word'},
            \           ]},
            \ 'mark': 'tex',
            \ 'word_pattern': '\w+',
            \ 'complete_pattern': g:vimtex#re#ncm,
            \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
            \ })
    set completeopt=noinsert,menuone,noselect

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " Use ncm-jedi for Python completion
    call ncm2#override_source('LanguageClient_python', {'enable': 0})

" }

" UltiSnips {
    " Press enter key to trigger snippet expansion
    " The parameters are the same as `:help feedkeys()`
    inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

    let g:UltiSnipsExpandTrigger='<c-f>'
    let g:UltiSnipsJumpForwardTrigger='<c-f>'
    let g:UltiSnipsJumpBackwardTrigger='<c-d>'
    inoremap <c-x><c-k> <c-x><c-k>
" }

" Yaml { 
    let g:syntastic_yaml_checkers = ['yamllint']
" }

" jupytext {
    let g:jupytext_enable = 1
    let g:jupytext_command = 'jupytext'
    let g:jupytext_fmt = 'md'
    "let g:jupytext_fmt = 'py:percent'
    let g:jupytext_filetype_map = {'md': 'pandoc'}
    "let g:jupytext_print_debug_msgs = 1
" }

" ipython-cell {
    let g:ipython_cell_delimit_cells_by = 'tags'
    let g:ipython_cell_tag = '# %%'

    " map <Leader>r to run script
    nnoremap <Leader>r :IPythonCellRun<CR>

    " map <Leader>R to run script and time the execution
    nnoremap <Leader>R :IPythonCellRunTime<CR>

    " map <Leader>c to execute the current cell
    nnoremap <Leader>c :IPythonCellExecuteCell<CR>

    " map <Leader>C to execute the current cell and jump to the next cell
    nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>

    " map <Leader>l to clear IPython screen
    nnoremap <Leader>l :IPythonCellClear<CR>

    " map <Leader>x to close all Matplotlib figure windows
    nnoremap <Leader>x :IPythonCellClose<CR>

    " map [c and ]c to jump to the previous and next cell header
    nnoremap [c :IPythonCellPrevCell<CR>
    nnoremap ]c :IPythonCellNextCell<CR>

    " map <Leader>h to send the current line or current selection to IPython
    nmap <Leader>h <Plug>SlimeLineSend
    xmap <Leader>h <Plug>SlimeRegionSend

    " map <Leader>p to run the previous command
    nnoremap <Leader>p :IPythonCellPrevCommand<CR>

    " map <Leader>Q to restart ipython
    nnoremap <Leader>Q :IPythonCellRestart<CR>

    " map <Leader>d to start debug mode
    nnoremap <Leader>d :SlimeSend1 %debug<CR>
    
    " map <Leader>q to exit debug mode or IPython
    nnoremap <Leader>q :SlimeSend1 exit<CR>
" }

" julia-cell {
    let g:julia_cell_delimit_cells_by = 'tags'
    let g:julia_cell_tag = '%%'

    nnoremap <Leader>jr :JuliaCellRun<CR>

    " map <Leader>jc to execute the current cell
    nnoremap <Leader>jc :JuliaCellExecuteCell<CR>

    " map <Leader>jC to execute the current cell and jump to the next cell
    nnoremap <Leader>jC :JuliaCellExecuteCellJump<CR>

    " map <Leader>jl to clear Julia screen
    nnoremap <Leader>jl :JuliaCellClear<CR>

    " map <Leader>jp and <Leader>jn to jump to the previous and next cell header
    nnoremap <Leader>jp :JuliaCellPrevCell<CR>
    nnoremap <Leader>jn :JuliaCellNextCell<CR>

    " map <Leader>je to execute the current line or current selection
    nmap <Leader>je <Plug>SlimeLineSend
    xmap <Leader>je <Plug>SlimeRegionSendeader>q :SlimeSend1 exit<CR>
" }

" julia {
    let g:default_julia_version = '1.4'
" }

" Language Server {

    if !empty($CONDA_PREFIX_1)
        let pyls_command = $CONDA_PREFIX_1 . '/envs/pyls/bin/pyls'
    elseif !empty($CONDA_PREFIX)
        let pyls_command = $CONDA_PREFIX . '/envs/pyls/bin/pyls'
    end

    " language server
    let g:LanguageClient_autoStart = 1
    let g:LanguageClient_serverCommands = {
    \   'julia': ['/Applications/Julia-1.4.app/Contents/Resources/julia/bin/julia', '--startup-file=no', '--history-file=no', '-e', '
    \       using LanguageServer;
    \       using Pkg;
    \       import StaticLint;
    \       import SymbolServer;
    \       env_path = dirname(Pkg.Types.Context().env.project_file);
    \       debug = false; 
    \       
    \       server = LanguageServer.LanguageServerInstance(stdin, stdout, debug, env_path, "");
    \       server.runlinter = true;
    \       run(server);
    \   '],
    \   'python': [ pyls_command ]
    \ }

    nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    nnoremap <silent> <F2> :call LanguageClient_textDoument_rename()<CR>c
" }

" vim-clang-format {
    " map to <Leader>cf in C++ code
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
    " Toggle auto formatting:
    nmap <Leader>C :ClangFormatAutoToggle<CR>

    autocmd FileType c,cpp,objc  ClangFormatAutoEnable
" }

" Screen {
    let g:ScreenImpl = 'Tmux'
" }
	
" General {
    set background=dark         " Assume a dark background
    "set background=light       " Assume a light background
	syntax on 					" syntax highlighting
    filetype on
	filetype plugin indent on  	" Automatically detect file types.
	set mouse=a					" automatically enable mouse usage
	set encoding=utf-8
	set termencoding=utf-8
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
	:silent! colorscheme zenburn    " load a colorscheme
	set tabpagemax=15 				" only show 15 tabs
	set showmode                   	" display the current mode

	set cursorline  				" highlight current line
	hi cursorline guibg=#333333 	" highlight bg color of current line
	hi CursorColumn guibg=#333333   " highlight cursor

	if has('statusline')
		set laststatus=2           	" show statusline only if there are > 1 windows
	endif

	set backspace=indent,eol,start 	" backspace for dummys
	set linespace=0 				" No extra spaces between rows
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
	set gdefault					" the /g flag on :s substitutions by default

" }

" Line Numbering {
    function! NumberToggle()
        if(&relativenumber == 1)
            set number
        else 
            set relativenumber
        endif
    endfunc

    nnoremap <C-n> :call NumberToggle()<cr>

    :au FocusLost * :set number
    :au FocusGained * :set relativenumber

    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber
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

" Code Folding for Markdown {

function! MarkdownLevel(maxlevel)
    if a:maxlevel >= 1 && getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if a:maxlevel >= 2 && getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if a:maxlevel >= 3 && getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if a:maxlevel >= 4 && getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if a:maxlevel >= 5 && getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if a:maxlevel >= 6 && getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "=" 
endfunction

au BufEnter *.md  setlocal foldexpr=MarkdownLevel(2)  
au BufEnter *.md  setlocal foldmethod=expr     
au BufEnter *.md  setlocal autoindent

"}

" GUI Settings {
	" GVIM- (here instead of .gvimrc)
	if has('gui_running')
		set guioptions-=T          	" remove the toolbar
		set lines=40               	" 40 lines of text instead of 24,
        set guifont=Sauce\ Code\ Powerline:h13
	endif
" }

" Project Specific RC  {
    set exrc
    set secure
" }

