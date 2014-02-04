set nocompatible               " be iMproved
filetype on                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle "bigfish/vim-js-context-coloring"
Bundle 'tpope/vim-vinegar'
Bundle "plasticboy/vim-markdown.git"
Bundle 'rking/ag.vim' 
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'elzr/vim-json'
Bundle 'digitaltoad/vim-jade'
Bundle 'jceb/vim-orgmode'
Bundle 'xolox/vim-misc'
Bundle 'gmarik/vundle'
" Bundle 'bling/vim-bufferline'
Bundle 'hwrod/interactive-replace.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
" Bundle 'scrooloose/nerdtree.git'
" Bundle 'fholgado/minibufexpl.vim' 
" Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'xolox/vim-session'
Bundle 'lilydjwg/colorizer'
Bundle "mileszs/ack.vim.git"
" Bundle 'Lokaltog/vim-powerline'
Bundle "bling/vim-airline"
Bundle 'Townk/vim-autoclose'
Bundle 'mbadran/headlights'
Bundle "vim-scripts/JavaScript-syntax.git"
Bundle "vim-scripts/BufOnly.vim"
Bundle "vim-scripts/Gundo.git"
Bundle "tpope/vim-surround.git"
Bundle "tomtom/tcomment_vim.git" 
Bundle "mattn/zencoding-vim.git"
Bundle "sophacles/vim-processing.git"
Bundle "tpope/vim-fugitive"
Bundle "vim-scripts/utl.vim"
Bundle "wincent/Command-T"
Bundle "sjbach/lusty.git"
filetype plugin indent on     " required!
filetype indent on 

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
autocmd Filetype gitcommit setlocal spell
set syntax=on
syntax enable
let g:EasyMotion_leader_key = '<Leader><Leader>' 
 let g:tcommentMapLeaderOp1='<Leader>'

" ZoMbie 
" setting scroll offset
set scrolloff=1
" add jumping between last edited lines
map <M-n> g,
map <M-p> g;
" add line highlight
set cursorline
" go to line with matching identation alt+< >
nnoremap <M-,> k:call search('^'. matchstr(getline(line('.')+1), '\(\s*\)') .'\S', 'b')<CR>^
nnoremap <M-.> :call search('^'. matchstr(getline(line('.')), '\(\s*\)') .'\S')<CR>^
"
" jump lines while beeing in the middle
nnoremap <M-j> 6jzz
nnoremap <M-k> 6kzz
" call gundo
nnoremap <M-u> :GundoToggle<cr>
" some nice linebreaking?
set tw=0 fo=cqt wm=5
set lbr
set formatoptions=l
"use tabs for identation of 2spaces width
" set noet ci pi sts=0 sw=4 ts=2
set noexpandtab
set shiftwidth=2
set tabstop=2
" "toggle search highlight with f3
" nnoremap <F3> :set hlsearch!<CR>
nnoremap <F8> :set wrap!<CR>
set guifont=Anonymous\ Pro\ 9
" Make vim incompatbile to vi.
set nocompatible
set modelines=0
"always open menu when searching and commands
nnoremap : q:i
nnoremap / q/i
nnoremap ? q?i

function! ToggleGUICruft()
    if &guioptions=='i'
        exec('set guioptions=im')
    else
        exec('set guioptions=i')
    endif
endfunction

" map <F11> <Esc>:call ToggleGUICruft()<cr>
" map <F12> <Esc>: TMiniBufExplorer<cr>
" noremap <F6> <Esc>:syntax sync fromstart<CR>
" inoremap <F6> <C-o>:syntax sync fromstart<CR>

" More Common Settings.
set clipboard=unnamedplus
set expandtab
set encoding=utf-8
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell

"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

set relativenumber
"set number
"set norelativenumber

"set undofile
set shell=/bin/bash
set lazyredraw
set matchtime=3


"Changing Leader Key
let mapleader = ","
let mapleader = "<"
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" resize current buffer by +/- 5 
nnoremap <A-left> :vertical resize -5<cr>
nnoremap <A-right> :vertical resize +5<cr>
nnoremap <A-down> :resize +3<cr>
nnoremap <A-up> :resize -3<cr>

" Set title to window
set title

" Dictionary path, from which the words are being looked up.
set dictionary=/usr/share/dict/words

" Make pasting done without any indentation break."
set pastetoggle=<F4>

" Make Vim able to edit corntab fiels again.
set backupskip=/tmp/*,/private/tmp/*"

" Enable Mouse
set mouse=a

"Settings for Searching and Moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1
"set column=79

" To  show special characters in Vim
"set list
set listchars=tab:▸\ ,eol:¬

" Naviagations using keys up/down/left/right
" Disabling default keys to learn the hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Map : to ; also in command mode.
nnoremap ; :

" Set vim to save the file on focus out.
"au FocusLost * :wa
:nmap <F9> :set invrelativenumber<CR>

" Adding More Shorcuts keys using leader kye.
" Leader Kye provide separate namespace for specific commands.
",W Command to remove white space from a file.
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ,ft Fold tag, helpful for HTML editing.
nnoremap <leader>ft vatzf

" ,q Re-hardwrap Paragraph
nnoremap <leader>q gqip

" ,v Select just pasted text.
nnoremap <leader>v V`]

" ,ev Shortcut to edit .vimrc file on the fly on a vertical window.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" close buffer and keep window (plugin bclose.vim)
nmap <C-W>x <Plug>Kwbd
" jj For Qicker Escaping between normal and editing mode.
inoremap jj <ESC>

" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>

" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>

" Wildmenu completion "
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END
" =========== END Basic Vim Settings ===========


" =========== Gvim Settings =============

" Removing scrollbars
if has("gui_running")
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    colo fruityCustom 
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
endif

" ========== END Gvim Settings ==========


" ========== Plugin Settings =========="
" map <F2> :NERDTreeToggle<cr>
map <F1> :LustyBufferExplorer<cr>
map <F2> :LustyFilesystemExplorerFromHere<cr>
map <F3> :LustyBufferGrep<cr>
map <F6> :JSContextColorToggle<cr>
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l -g ""'
" bufferline settings:
let g:bufferline_show_bufnr = 0
let g:bufferline_active_buffer_left= '✶ '
let g:bufferline_active_buffer_right = ' '
" Mini Buffer some settigns."
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

    let g:syntastic_mode_map = { 'mode': 'passive',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': [] }

" =========== END Plugin Settings =========="


" Working with split screen nicely
" Resize Split When the window is resized"
"au VimResized * :wincmd =

"highlight color?
"Enable syntax highlighting when buffers were loaded through :bufdo, which
"disables the Syntax autocmd event to speed up processing.
"augroup EnableSyntaxHighlighting
  "" Filetype processing does happen, so we can detect a buffer initially
  "" loaded during :bufdo through a set filetype, but missing b:current_syntax.
  "" Also don't do this when the user explicitly turned off syntax highlighting
  "" via :syntax off.
  "" Note: Must allow nesting of autocmds so that the :syntax enable triggers
  "" the ColorScheme event. Otherwise, some highlighting groups may not be
  "" restored properly.
  "autocmd! BufWinEnter * nested if exists('syntax_on') && ! exists('b:current_syntax') && ! empty(&l:filetype) | syntax enable | endif

  "" The above does not handle reloading via :bufdo edit!, because the
  "" b:current_syntax variable is not cleared by that. During the :bufdo,
  "" 'eventignore' contains "Syntax", so this can be used to detect this
  "" situation when the file is re-read into the buffer. Due to the
  "" 'eventignore', an immediate :syntax enable is ignored, but by clearing
  "" b:current_syntax, the above handler will do this when the reloaded buffer
  "" is displayed in a window again.
    "autocmd! BufRead * if exists('syntax_on') && exists('b:current_syntax') && ! empty(&l:filetype) && index(split(&eventignore, ','), 'Syntax') != -1 | unlet! b:current_syntax | endif
"augroup END
" map <F6>:update <bar> :call RunProcessing()<CR><CR>
" map <F6>:call RunProcessing()<CR><CR>
let processing_doc_path="/opt/processing-2.0b8/modes/java/reference/about"
 " A don't give the ATTENTION message when an existing swap file is found. 
set shortmess+=A

" jump between windows
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
map <silent><C-Tab> :bnext<cr>
map <silent><C-S-Tab> :bprevious<cr>
" tab navigation like firefox
nnoremap <silent><A-1>   :tabprevious<CR>
nnoremap <silent><A-2> :tabnext<CR>
nnoremap <silent><A-t>     :tabnew<CR>
nnoremap <silent><A-w>     :tabclose<CR>
" jump to matching bracket
noremap % v%
" disable continuing with comments when O
set formatoptions-=cro
" airline customization
let g:airline_section_y=""
let g:airline_section_warning=""
let g:airline_left_sep='>'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#show_message = 0
let g:airline_exclude_preview = 0
" xolox session settings
let g:session_autoload=0
let g:session_autosave=0
" make tabs look cli
set guioptions-=e
set autochdir
" detect filetype automatically
filetype plugin indent on
" open ag.vim
" disable context colors on start and it's keyboard mapping
let g:js_context_colors_enabled = 0
let g:js_context_colors_usemaps = 0
