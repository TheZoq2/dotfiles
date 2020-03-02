"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting up vundle
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

"Vundle
" Plug 'VundleVim/Vundle.vim'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
if !has('nvim')
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Autocompletion
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-ultisnips'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Language client plugins
Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh'}

" Bracket auto completion
Plug 'Raimondi/delimitMate'
" Plug 'cohama/lexima.vim'

"Latex preview
Plug 'xuhdev/vim-latex-live-preview'
" Synctex integration
Plug 'peder2tm/sved'

"Alignment
Plug 'junegunn/vim-easy-align'

" Spliting and merging multi-line things
Plug 'FooSoft/vim-argwrap'

"Table formating
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode'

" Mappings on surroud things
Plug 'tpope/vim-surround'
" Case coercion
Plug 'tpope/tpope-vim-abolish'
" Repeating plugin commands
Plug 'tpope/vim-repeat'
" Git integration
Plug 'tpope/vim-fugitive'
" Comment operations using `gc`
Plug 'tpope/vim-commentary'
" Detect indentation style 
" Plug 'tpope/vim-sleuth'

Plug 'junegunn/goyo.vim'

" Asyncronous linting
Plug 'w0rp/ale'

" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Show bars to highlight indentation
" Plug 'Yggdroot/indentLine'
" Plug 'nathanaelkane/vim-indent-guides'

"Jumping around
Plug 'easymotion/vim-easymotion'
" Incremental f
Plug 'rhysd/clever-f.vim'

"Incremental and fuzzy searching
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

"Fuzzy search
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'junegunn/fzf.vim'


"Shifting function arguments
Plug 'PeterRincker/vim-argumentative'

"File explorer
Plug 'scrooloose/nerdtree'
"Fancy icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


"Add :Bdelete to close buffers without messing with window layout
Plug 'moll/vim-bbye'

" Pandoc workflow and syntax
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'


"Language plugins
"Openscad support
Plug 'choffee/openscad.vim'
"Elm support
Plug 'ElmCast/elm-vim'
"Haskell support
Plug 'neovimhaskell/haskell-vim'
Plug 'bitc/vim-hdevtools'
"GMPL syntax
Plug 'maelvalais/gmpl.vim'
"Coffeescript support
Plug 'kchmck/vim-coffee-script'
"Slim support
Plug 'slim-template/vim-slim'
"ruby linting
Plug 'vim-ruby/vim-ruby'
"sxkhd highlighting
Plug 'baskerville/vim-sxhkdrc'
" Gnuplot
Plug 'vlaadbrain/gnuplot.vim'
" Markdown
Plug 'tpope/vim-markdown'

" Matlab highlighting
Plug 'daeyun/vim-matlab'
"Glsl
Plug 'tikhomirov/vim-glsl'
"Python syntax highlight
Plug 'hdima/python-syntax'
"Scala support
Plug 'derekwyatt/vim-scala'
"TOML
Plug 'cespare/vim-toml'

"github markdown support
" Plug 'git@github.com:jtratner/vim-flavored-markdown'


"Deoplete language support plugins
"Rust
Plug 'rust-lang/rust.vim'
"Python
Plug 'leafgarland/typescript-vim'


"Colors
"Plug 'atweiden/vim-colors-behelit'
Plug 'TheZoq2/papercolor-theme'
Plug 'TheZoq2/badwolf'
Plug 'TheZoq2/Papyrus'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'challenger-deep-theme/vim'


" Code snippets
Plug 'SirVer/ultisnips'
Plug 'TheZoq2/vim-snippets'



"Nvim autoread
Plug 'git@github.com:TheZoq2/neovim-auto-autoread'

" Colortheme changer
Plug 'git@github.com:TheZoq2/neovim-colortheme-changer'


call plug#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'

set showcmd         " Show (partial) command in status line.

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

set mouse=a         " Enable the use of the mouse.

set hidden          "Allow unsaved buffers to be in the background

set cursorline		"Highlight the current line

" Prevent comments from being inserted on new lines created with `o`
autocmd BufEnter * set formatoptions-=o

"Tab handling and listing
set list
set listchars=tab:¬-,trail:~,extends:>,precedes:<

" Indentation settings
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
command Tabs set noexpandtab
command Spacess set expandtab

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
"colorscheme badwolf
set background=light

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

set title
autocmd BufEnter * let &titlestring = expand("%:@")

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
map ; :

map <c-d> 10j
map <c-u> 10k
map K k:join<Cr>

"Buffer stuff
"map <Leader>j :Buffers<CR>
map <Leader>j :CtrlPBuffer<CR>
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

map <Leader>i :call LanguageClient_textDocument_hover()<CR>
map gd :call LanguageClient_textDocument_definition()<CR>
map <Leader>lr :call LanguageClient_textDocument_rename()<CR>
map <leader>lc :call LanguageClient_contextMenu()<CR>
map <leader>lj :call LanguageClient_textDocument_documentSymbol()<CR>

" Wrap or unwrap arguments
nnoremap <silent> gS :ArgWrap<CR>



"Reload file when changes happen
au CursorHold * if getcmdwintype() == '' | checktime | endif

"Resize windows when the host window is resized
autocmd VimResized * wincmd =


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Delimitmate settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:delimitMate_expand_cr = 1
let g:delimitMate_balance_matchpairs=1
autocmd FileType verilog let b:delimitMate_quotes = ""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Completion tings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prevent completion information popup
set completeopt-=preview


" For better diagnostic messages with coc
set updatetime=300


" enable ncm2 for all buffer
autocmd BufEnter * call ncm2#enable_for_buffer()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"					Elm stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" "Ultisnips keys
let g:UltiSnipsExpandTrigger="ii"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Latex stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor = "latex"

" Neovim seems to autoload a latex plugin which conceals certain symbols
autocmd FileType tex set conceallevel=0

" Surround word with a tag when <Leader>s is pressed
autocmd BufEnter *.tex nmap <Leader>s ysiw}i\

" Synctex forward search on <Leader>g
autocmd BufEnter *.tex nmap <Leader>dg :call SVED_Sync()<CR>

" Enable spell check and set the language to the only true english
autocmd FileType tex set spell spelllang=en_gb

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Latex stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable spell check
autocmd FileType markdown set spell spelllang=en_gb

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'rust', 'cpp']
let g:markdown_syntax_conceal = 0



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           easymotion stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"Disable default mapping
let g:EasyMotion_do_mapping = 0

"Make case insensitive
let g:EasyMotion_smartcase = 1

"Activate using space+space
nmap <Leader><Leader> <Plug>(easymotion-overwin-f)

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
"                       Nerdtree config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:NERDTreeFileExtensionHighlightFullName = 1
"let g:NERDTreeExactMatchHighlightFullName = 1
"let g:NERDTreePatternMatchHighlightFullName = 1

let g:WebDevIconsNerdTreeAfterGlyphPadding = '-'
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Linter (ale) config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'rust': ['ra_lsp_server'],
\   'ghmarkdown': ['mdl'],
\   'haskell': ['hdevtools'],
\   'python': [],
\   'cpp': []
\}
"\   'rust': ['rls'],
" 'cpp': ['clangcheck']
"   'haskell': ['stack-ghc-mod', 'hdevtools', 'hlint', 'stack-build', 'stack-ghc'],

let g:ale_cpp_clangcheck_options='-std=c++17 -Wall'

let g:ale_verilog_iverilog_options='-c .verilog_config'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Ctrl P mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CtrlP stuff
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_show_hidden = 1


map <Leader>; :CtrlPCmdPalette<Cr>

"ctrlp configuration
"Allow searching through tags with <space>t
" let g:ctrlp_extensions=['tag', 'autoignore']
nnoremap <Leader>T :CtrlPTag<Cr>
"Use current working directory for starting ctrlp
let g:ctrlp_working_path_mode = 'a'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           FZF config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>e :FZF<CR>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Nvim completion manager config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't give |ins-completion-menu| messages.  For example,
" '-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
set shortmess+=c

" IMPORTANT: :help Ncm2PopupOpen for more information
" For better diagnostic messages with coc
set completeopt=noinsert,menuone,noselect



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Statusline config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2    " Only show statusbar if there is more than one window

" Symbol dictionary

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.column = '➔'

let g:airline_section_z = '%3p%% %4L %{g:airline_symbols.column}%3c'

let g:airline_section_error = ''
let g:airline_section_warning = ''

set noshowmode


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Language server config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:LanguageClient_serverCommands = {
    \ 'rust': ['ra_lsp_server'],
    \ 'typescript': ['tsserver'],
    \ 'cpp': ['clangd'],
    \ 'python': ['pyls'],
    \ 'tex': ['texlab_log']
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" if executable('rls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'rls',
"         \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
"         \ 'whitelist': ['rust'],
"         \ })
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Clever-f config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:clever_f_fix_key_direction = 1
let g:clever_f_across_no_line = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Pandoc config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:pandoc#modules#disabled = ["keyboard"]
let g:pandoc#syntax#conceal#use=0

autocmd FileType markdown map <Leader>b :w<Cr>:!pandoc notes.md -o notes.pdf<Cr>

function s:MDSettings()
    if version < 508
      command! -nargs=+ HiLink hi link <args>
    else
      command! -nargs=+ HiLink hi def link <args>
    endif
    " adjust syntax highlighting for LaTeX parts
    "   inline formulas:
    syntax region Statement oneline matchgroup=Delimiter start="\$" end="\$"
    "   environments:
    syntax region Statement matchgroup=Delimiter start="\\begin{.*}" end="\\end{.*}" contains=Statement
    syntax region texBlock matchgroup=Delimiter start="\$\$" end="\$\$" contains=Statement
    "   commands:
    syntax region Statement matchgroup=Delimiter start="{" end="}" contains=Statement
    HiLink texBlock tex
endfunction

" autocmd BufRead,BufNewFile *.md setfiletype markdown
autocmd FileType markdown :call <SID>MDSettings()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       C++ macro expansion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! ExpandCMacro()
  "get current info
  let l:macro_file_name = "__macroexpand__" . tabpagenr()
  let l:file_row = line(".")
  let l:file_name = expand("%")
  let l:file_window = winnr()
  "create mark
  execute "normal! Oint " . l:macro_file_name . ";"
  execute "w"
  "open tiny window ... check if we have already an open buffer for macro
  if bufwinnr( l:macro_file_name ) != -1
    execute bufwinnr( l:macro_file_name) . "wincmd w"
    setlocal modifiable
    execute "normal! ggdG"
  else
    execute "bot 10split " . l:macro_file_name
    execute "setlocal filetype=cpp"
    execute "setlocal buftype=nofile"
    nnoremap <buffer> q :q!<CR>
  endif
  "read file with gcc
  silent! execute "r!gcc -E " . l:file_name
  "keep specific macro line
  execute "normal! ggV/int " . l:macro_file_name . ";$\<CR>d"
  execute "normal! gg=G"
  "resize window
  execute "normal! G"
  let l:macro_end_row = line(".")
  execute "resize " . l:macro_end_row
  execute "normal! gg"
  "no modifiable
  setlocal nomodifiable
  "return to origin place
  execute l:file_window . "wincmd w"
  execute l:file_row
  execute "normal!u"
  execute "w"
  "highlight origin line
  let @/ = getline('.')
endfunction

autocmd FileType cpp nnoremap <leader>m :call ExpandCMacro()<CR>
