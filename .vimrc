" see: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
"set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

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

"vimproc
Plugin 'Shougo/vimproc.vim'
"vebugger
"depends on vimproc
Plugin 'idanarye/vim-vebugger'
  
"Vim-snipmate
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets for snipmate
Plugin 'TheZoq2/vim-snippets'


"Auto indent
" Doesn't work with vundle. Install manually
" Plugin 'jiangmiao/auto-pairs'

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
 
"set ignorecase      " Ignore case in search patterns.
 
"set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
 
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
set mouse=a         " Enable the use of the mouse.

"execute pathogen#infect()

"Codefolding
set foldmethod=syntax
set foldnestmax=1
set foldlevel=0
 
filetype plugin indent on
syntax on

set t_Co=256
colorscheme badwolf

map <F4> :tabe
map <F2> :tabp
map <F3> :tabn
map <C-c> "+y
map <C-p> "+p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                               Ycm stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

let g:ycm_warning_symbol = '**'
let g:ycm_confirm_extra_conf = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" Java autocomplete
" let g:EclimCompletionMethod = 'omnifunc'

let mapleader = "\<space>"

"Tab stuff
map <Leader>l :tabn<Enter>
map <Leader>h :tabp<Enter>
map <Leader>e :tabe 

" Find and replace
map <Leader>r :%s//gci<Left><Left><Left><Left>

"" Snippet expand
"imap <C-j> <Plug>snipMateNextOrTrigger

"Ultisnips keys
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

"JK to exit insert mode
imap jk <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                               Pyclewn
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pyclewn_args="--window=usetab"
map <Leader>ds :Pyclewn gdb 
map <Leader>dm :Cmapkeys<Enter>
map <Leader>dv :Cdbgvar 
map <Leader>dr :Cdelvar var

""""""Create debug windows in a new tabs
function Pyclewn_CreateTabWindows(debugger)
    split
    edit (clewn)_variables
    split
    edit (clewn)_console
    wincmd j
    if a:debugger == "gdb"
        split
        let w:pyclewn_window = 1
        wincmd w
        edit (clewn)_threads
        let w:pyclewn_window = 1
        vsplit
        edit (clewn)_breakpoints
        let w:pyclewn_window = 1
        vsplit
        edit (clewn)_backtrace
        let w:pyclewn_window = 1
    endif
endfunction

function Pyclewn_GotoFrame(fname)
    " Go to the fourth window loaded wih the buffer that was active
    " when the ToggleDebugView() function was executed.
    4wincmd j

    exe "edit " . a:fname
endfunction

function Pyclewn_GotoBreakpoint(fname, lnum)
    4wincmd j
    exe "edit " . a:fname
    if a:lnum != ""
        call cursor(a:lnum, 0)
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

"Resize windows when the host window is resized
autocmd VimResized * wincmd =

map q: :q:<Enter>

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
