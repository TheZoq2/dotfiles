"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
" Setting up vundle
set nocompatible 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle
Plugin 'VundleVim/Vundle.vim'

"YCM
Plugin 'Valloric/YouCompleteMe'
Plugin 'initrc/eclim-vundle'

" Code snippets
Plugin 'SirVer/ultisnips'

" Snippets for ultisnips
Plugin 'TheZoq2/vim-snippets'

" vim-airline: Statusbar and display of buffers
" Plugin 'bling/vim-airline'

"Vimtex
Plugin 'xuhdev/vim-latex-live-preview'

"Rust syntax highligt
"Plugin 'wting/rust.vim'
Plugin 'rust-lang/rust.vim'

"Ycm generator
Plugin 'rdnetto/YCM-Generator.git'

"Table formating
Plugin 'godlygeek/tabular'
Plugin 'dhruvasagar/vim-table-mode'

"Bracket autocompletion
"Plugin 'cohama/lexima.vim'

"Sublime-like multi cursor mode
Plugin 'terryma/vim-multiple-cursors'

"Highlight first word occurences
"Plugin 'unblevable/quick-scope'
"Jumping around
Plugin 'easymotion/vim-easymotion'

"Buffer list
"Plugin 'bling/vim-bufferline'

"Fuzzy search
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'

"Openscad support
Plugin 'choffee/openscad.vim'

"Colors
"Plugin 'atweiden/vim-colors-behelit'
Plugin 'TheZoq2/vim-luna'
Plugin 'TheZoq2/vim-github-colorscheme'
Plugin 'TheZoq2/papercolor-theme'
Plugin 'TheZoq2/badwolf'

"Nvim autoread 
Plugin 'git@github.com:TheZoq2/neovim-auto-autoread.git'

"WIP Colortheme changer
Plugin 'git@github.com:TheZoq2/neovim-colortheme-changer.git'


call vundle#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'

       
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
 
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
 
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

"set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
 
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.

set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.

"set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
set mouse=a         " Enable the use of the mouse.

set hidden          "Allow unsaved buffers to be in the background

"Codefolding
set foldmethod=indent
set foldnestmax=2
set foldlevel=0
 
filetype plugin indent on
syntax on

set t_Co=256
"colorscheme atom-dark-256
"colorscheme luna-term
"colorscheme github
colorscheme PaperColor
set background=dark

"Autoreload files when changed externally
set autoread
if has('nvim')
    "autocmd VimEnter * AutoreadLoop 
endif
if has('nvim')
    autocmd VimEnter * StartColorPoll 
endif



"Prevent redraw during macros etc.
"set lazyredraw

set wildmenu


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<space>"

map <F4> :tabe
map <F2> :tabp
map <F3> :tabn

"Copy paste from system clipboard
map <C-c> "+y
map <C-p> "+p

"Tab stuff
"map <Leader>l :tabn<Enter>
"map <Leader>h :tabp<Enter>
"map <Leader>e :tabe 

"Swedish layout is stupid
map Ö :

map J 10j
map K 10k

"Buffer stuff
map <Leader>j :Buffers<CR>
map <Leader>l :bn<CR>
map <Leader>h :bp<CR>
map <Leader>e :e<Space>
"Close a buffer with space-q
map <Leader>q :bdelete<CR>
"Show buffer list and prompt for buffer id
:nnoremap <Leader>o :buffers<CR>:buffer<Space>

map j gj
map k gk

" Find and replace
map <Leader>r :%s//gc<Left><Left><Left>
map <Leader>s :nohlsearch<CR> 

map j gj
map k gk

"JK to exit insert mode
imap jk <Esc>
"imap kj <Esc>

set relativenumber

"Quit when q: is pressed aswell
map q: :q

"Multicursor plugin mappings
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

let g:ctrlp_map = '<c-t>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Ycm stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:ycm_rust_src_path = '/usr/local/share/rust/rustc-1.7.0/src'

let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

let g:ycm_warning_symbol = '**'
let g:ycm_confirm_extra_conf = 0

let g:EclimCompletionMethod = 'omnifunc'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Ultisnips keys
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1 "Show the current buffers in a tab view
"Font stuff
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''

"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''

set laststatus=1

"let g:airline_theme = 'behelit'
let g:airline_powerline_fonts = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Latex stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:livepreview_previewer = 'zathura'

"Resize windows when the host window is resized
autocmd VimResized * wincmd =

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           easymotion stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"Disable default mapping
let g:EasyMotion_do_mapping = 0

"Make case insensitive
let g:EasyMotion_smartcase = 1

"Activate using space+f
nmap <Leader><Leader> <Plug>(easymotion-overwin-f)

"'Search' for space+g
nmap <Leader>g <Plug>(easymotion-sn)
map  <Leader>n <Plug>(easymotion-next)

