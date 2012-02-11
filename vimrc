" Vim 7.3

" don't try to emulate vi's (unfriendly) behaviour
set nocompatible  

" Vundle
filetype off

if has('win32') || has('win64')
	let $VIMHOME=expand('~/vimfiles')
    "set rtp+=~/vimfiles/bundle/vundle
else
	let $VIMHOME=expand('~/.vim')
    "set rtp+=~/.vim/bundle/vundle
endif

set rtp+=$VIMHOME/bundle/vundle

call vundle#rc()

" Github bundles
"
" Requires Git - Makes sense of all these Bundle commands
Bundle 'gmarik/vundle'
" Help navigation - use <CR> and <BS>
Bundle 'juanpabloaj/help.vim'
" Go highlighting
Bundle 'jnwhiteh/vim-golang'
" Fuzzy File/Buffer/MRU finding <C-P>
Bundle 'kien/ctrlp.vim'
" Everything Python!
"Bundle 'klen/python-mode'
" EasyMotion - \\[f/t/w/F/T/W/etc] to fast-find
Bundle 'Lokaltog/vim-easymotion'
" Vim Powerline - uses Patched Fonts
Bundle 'Lokaltog/vim-powerline'
" TagBar for source code browsing. \tb
" Requires exuberant ctags
Bundle 'majutsushi/tagbar'
" :Gist to paste into Gist and copy url, -p for private
" Requires Curl
Bundle 'mattn/gist-vim'
" <c-y>, to expand html
Bundle 'mattn/zencoding-vim'
" play snake! :Snake x y; i to start
Bundle 'mfumi/snake.vim'
" Hook up neocompl and clang-complete
Bundle 'osyo-manga/neocomplcache-clang_complete'
" Requires clang
Bundle 'Rip-Rip/clang_complete'
" Comment line / selection: \cc
Bundle 'scrooloose/nerdcommenter'
" :NERDTree or \nt to browse filesystem
Bundle 'scrooloose/nerdtree'
" Check for syntactic correctness!
Bundle 'scrooloose/syntastic'
" Awesome autocomplete
Bundle 'Shougo/neocomplcache'
" Fugitive - git shortcuts for vim
" Requires Git
Bundle 'tpope/vim-fugitive'
" Git higlighting and tidbits
Bundle 'tpope/vim-git'
" Markdown highlighting
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
" Easily surround text with other text
Bundle 'tpope/vim-surround'
" Nginx config highlighting
Bundle 'xhr/vim-nginx'

" Vim-scripts bundles
"
" Better % matching
Bundle 'matchit.zip'
" Tab completion of snippets; <c-j> for next completion
"Bundle 'UltiSnips'
" <c-w>o to toggle current window full-screen
Bundle 'ZoomWin'



filetype plugin indent on

" ===========================
" Appearance
" ===========================

" set font
if has('win32') || has('win64')
    set gfn=Consolas:h10
else
"    set gfn="DejaVu Sans Mono":h10
	" Powerline font-fixing
	set guifont="Ubuntu Mono Powerline"
	let g:Powerline_symbols = 'fancy'
endif

" Detect screen/tmux running
if match($TERM, "screen")!=-1
  set term=screen-256color
endif

" Detect 256 color terminals
if ($COLORTERM == 'gnome-terminal') || ($TERM == 'xterm-256color')
    set t_Co=256
endif

" Set colorscheme
colorscheme delek
if &t_Co == 256
    colorscheme sunburst
endif

" perform syntax highlighting (colours code by syntax)
syntax enable

" Set the background scheme to dark
"set background=dark

" when inserting a bracket, jump briefly to matching bracket
set showmatch

" show line numbers
set number

" enable mouse
set mouse=a

" ===========================
" Indentation and tabs
" ===========================

" allow backspace to delete over autoindent, end of line, and the
" start of the current insertion
set backspace=indent,eol,start

" set indentation to 4 spaces
set shiftwidth=4

" tab key goes in 4 spaces (but existing tabs are displayed 8 wide)
set softtabstop=4

" Set how many spaces a tab is displayed as
set tabstop=4

" Do not expand tabs into spaces
set noexpandtab

" Set vim to detect filetypes; will run ~/.vim/ftplugin/<filetype>.vim
filetype on

" make sure that TABs work exactly as TABs in Makefiles 
autocmd FileType make setlocal noexpandtab
autocmd FileType make setlocal softtabstop=0

" Use spaces for python
autocmd FileType python setlocal expandtab

" set automatic indentation depending upon the detected file type
filetype indent on

" indentation options for C indenting.
"     :0  -- case labels are indented 0 spaces in from switch
"     (2  -- indent 2 spaces within unclosed parentheses
"     m1  -- line up close parentheses with start of opening line
"     b1  -- align break with its case label
"     t0  -- function return type declaration not indented
"     c1  -- indent text inbetween comments by 1
" there are _many_ more options; do ":help cinoptions-values" to see them
set cinoptions=:0,m1,b1,t0,c1

" for non-C files (such as assembly language), use autoindenting
set autoindent smartindent
set smarttab

" ===========================
" Status line
" ===========================

" Display incomplete commands
set showcmd

" always display the status line, even if there is only a single window
set laststatus=2

" Using vim-powerline instead
" customize the status line.  Do ":help statusline" for options
"set statusline=%<%f%h%1*%m%*%r%=%3n\ \ %7(%l,%c%)%V\ %P

" Set short messages
set shortmess=at

" ===========================
" Commands
" ===========================

"" ii insert mode exits insert mode
inoremap ii <Esc>

" Map Y to yank from cursor to end of line, like D and C
map Y y$

" ROT13 - fun
map <F12> ggVGg?

" Stop higlighting with j and k
nnoremap <silent> j j:noh<CR>
nnoremap <silent> k k:noh<CR>

" ,cd to change working dir to current file's
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" oo create a new line insertlessly
nnoremap oo o<Esc>

" oo create a new line insertlessly
nnoremap OO O<Esc>

" ===========================
" Miscellaneous
" ===========================

" Set file encoding to utf8
set encoding=utf8

" Keep 100 lines of command line history
set history=100

" Highlight search matches
set hlsearch

" Enable replace-all by default
set gdefault

" Enable incremental searching
set incsearch

" Ignore case when searching, except when capitals are used in the search
set ignorecase
set smartcase

" auto-detect format based on EOL, but choose unix by default
set fileformats=unix,mac,dos

" Stop certain movements from going to the start of the line
set nostartofline

" Use F11 to toggle between paste and nopaste
set pastetoggle=<F11>

" Share windows clipboard
set clipboard+=unnamed 

" Enable Omnicompletion
" Windows requires Exuberant Ctags v5.7+
filetype plugin on
set ofu=syntaxcomplete#Complete

" ===========================
" GVim
" ===========================

if has("gui_running")
    colorscheme sunburst


    " No menu or toolbar
    "set guioptions-=m
    "set guioptions-=T

    " Only rightscrollbars
    set guioptions-=Ll
    set guioptions+=Rr

    " Nice copy'n'paste
    set guioptions+=a

    " No tear off menus
    "set guioptions-=t

endif

" ===========================
" Plugins
" ===========================

" Super re-tab -use :'<,'>SuperRetab n 
" to convert n spaces to tabs, at the beginning of lines
:command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

" Gist-Vim
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_private = 1

" Python-mode settings
"let g:pymode_run = 0
"let g:pymode_lint = 0

" Set File Explorer to \nt
nmap <leader>nt :NERDTree<CR>

" Set the code explorer to \tb
nmap <leader>tb :TagbarToggle<CR>

" Popup error window for syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=0
let g:syntastic_loc_list_height=4

" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15

" SuperTab option for context aware completion
"let g:SuperTabDefaultCompletionType = "context"

" NeoComplComplete settings
so $VIMHOME/source/neocompl.vim

" Show clang errors in the quickfix window
let g:clang_complete_copen = 1

" use neocomplcache & clang_complete
" add neocomplcache option
let g:neocomplcache_force_overwrite_completefunc=1
" add clang_complete option
let g:clang_complete_auto=1
