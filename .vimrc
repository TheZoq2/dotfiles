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
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'oblitum/YouCompleteMe'
Plugin 'initrc/eclim-vundle'

" Code snippets
Plugin 'SirVer/ultisnips'

" Snippets for ultisnips
Plugin 'TheZoq2/vim-snippets'
Plugin 'Raimondi/delimitMate'

"Bracket matching
"Plugin 'TheZoq2/auto-pairs'

"Latex preview
Plugin 'xuhdev/vim-latex-live-preview'

"Git integration
Plugin 'tpope/vim-fugitive'

"Alignment
Plugin 'junegunn/vim-easy-align'

"Rust syntax highligt
"Plugin 'wting/rust.vim'
Plugin 'rust-lang/rust.vim'

"Ycm generator
Plugin 'rdnetto/YCM-Generator.git'

"Table formating
Plugin 'godlygeek/tabular'
Plugin 'dhruvasagar/vim-table-mode'

"Highlight first word occurences
"Plugin 'unblevable/quick-scope'
"Jumping around
Plugin 'easymotion/vim-easymotion'

"Incremental and fuzzy searching
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'

"Fuzzy search
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'
Plugin 'fisadev/vim-ctrlp-cmdpalette'

"File explorer
Plugin 'scrooloose/nerdtree'

"Add :Bdelete to close buffers without messing with window layout
Plugin 'moll/vim-bbye.git'

"Openscad support
Plugin 'choffee/openscad.vim'

"Elm support
Plugin 'ElmCast/elm-vim.git'
"Haskell support
Plugin 'neovimhaskell/haskell-vim'

"GMPL syntax
Plugin 'maelvalais/gmpl.vim'

"Coffeescript support
Plugin 'kchmck/vim-coffee-script'
"Slim support
Plugin 'slim-template/vim-slim.git'

Plugin 'tikhomirov/vim-glsl'


"Python linting
Plugin 'nvie/vim-flake8.git'
"Python syntax highlight
Plugin 'hdima/python-syntax.git'

Plugin 'git@github.com:tpope/vim-surround.git'

"github markdown support
Plugin 'git@github.com:jtratner/vim-flavored-markdown.git'

"Scala support
Plugin 'derekwyatt/vim-scala'


"Colors
"Plugin 'atweiden/vim-colors-behelit'
Plugin 'TheZoq2/papercolor-theme'
Plugin 'TheZoq2/badwolf'
Plugin 'TheZoq2/Papyrus'
Plugin 'tyrannicaltoucan/vim-quantum'

"Nvim autoread 
Plugin 'git@github.com:TheZoq2/neovim-auto-autoread.git'

"WIP Colortheme changer
Plugin 'git@github.com:TheZoq2/neovim-colortheme-changer.git'


call vundle#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'

set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.

set tabstop=4       " Number of spaces that a <Tab> in the file counts for.

set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.

set showcmd         " Show (partial) command in status line.
set laststatus=1    " Only show statusbar if there is more than one window

set number          " Show line numbers.
set relativenumber


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

set cursorline		"Highlight the current line

"Tab handling and listing
set list
set listchars=tab:¬-,trail:~,extends:>,precedes:<

"Codefolding
set foldmethod=indent
set foldnestmax=2
set foldlevel=0
 
filetype plugin indent on

syntax on

"filetype specific indentation
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2

set t_Co=256
"colorscheme atom-dark-256
"colorscheme luna-term
"colorscheme github
colorscheme PaperColor
"colorscheme badwolf
set background=dark

"set background=dark
set termguicolors
"let g:quantum_black=1
"colorscheme quantum

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

"Customize tab completion
set wildmode=longest,list,full
set wildmenu

"Highlight lines that are longer than 85 characters
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%>85v.\+/
set colorcolumn=80



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
"map <Leader>j :Buffers<CR>
map <Leader>j :CtrlPBuffer<CR>
map <Leader>l :bn<CR>
map <Leader>h :bp<CR>
"map <Leader>e :e<Space>
"Close a buffer with space-q
map <Leader>q :Bdelete<CR>
"Show buffer list and prompt for buffer id
:nnoremap <Leader>o :buffers<CR>:buffer<Space>
"Switch to the last buffer
map <Leader>k <C-^>

" Find and replace
map <Leader>r :%s//gc<Left><Left><Left>
vmap <Leader>r :s//gc<Left><Left><Left>
map <Leader>S :nohlsearch<CR> 

"map <Leader>g :YcmCompleter GoTo<CR>
map <Leader>g <C-]>

map <Leader>tr :setl rnu!<CR>

map j gj
map k gk

"JK to exit insert mode
imap jk <Esc>
"imap kj <Esc>

map <Leader>n :NERDTreeToggle<CR>


" EasyAlign mapings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"Quit when q: is pressed aswell
map q: :q

"Multicursor plugin mappings
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"CtrlP stuff
let g:ctrlp_map = '<Leader>e'


map <Leader>; :CtrlPCmdPalette<Cr>

"ctrlp configuration
"Allow searching through tags with <space>t
let g:ctrlp_extensions=['tag']
nnoremap <Leader>t :CtrlPTag<Cr>
"Use current working directory for starting ctrlp
let g:ctrlp_working_path_mode = 'a'

"Reload file when changes happen
au CursorHold * if getcmdwintype() == '' | checktime | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Auto pairs settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsCenterLine=0
let g:AutoPairsMultilineClose=0

let g:AutoPairsCRIndent = ['{', '[']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Delimitmate settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let delimitMate_expand_cr = 1
let delimitMate_balance_matchpairs=1


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
"					Elm stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

let g:elm_setup_keybindings = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Ultisnips keys
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"


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

"Activate using space+space
nmap <Leader><Leader> <Plug>(easymotion-overwin-f)
nmap <Leader>l <Plug>(easymotion-lineforward)
nmap <Leader>h <Plug>(easymotion-linebackward)

"'Search' for space+g
"nmap <Leader>g <Plug>(easymotion-sn)
"map  <Leader>n <Plug>(easymotion-next)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							Incsearch config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map <Leader>/ <Plug>(incsearch-fuzzy-/)
map <Leader>? <Plug>(incsearch-fuzzy-?)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							Python plugin config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:flake8_show_quickfix=0
let g:flake8_show_in_gutter=1

"Run check each write
"autocmd BufWritePost *.py call Flake8()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Use github flavoured markdown on md files by default
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

"Generate tags on write in rust
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&"


