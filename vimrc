" File: ~/.vim/vimrc
" Description: Vim configuration file

" Vim plugin manager (Vundle)
if filereadable(expand('~/.vim/vimrc.plugins'))
    source ~/.vim/vimrc.plugins
endif

" Not VI compatible
set nocompatible
" Dark color scheme
colorscheme today-night

" File type settings
syntax on
filetype on
filetype plugin indent on

" Section: Options
" ----------------

" Cursor position
set ruler
" Text displaying
set nowrap
" Enable the use of mouse
set mouse=a
" Fast terminal connection
set ttyfast
" Show (partial) command
set showcmd
" Automatically read file
set autoread
" Automatically save file
set autowrite
" Show matching brackets
set showmatch

" Search features
set hlsearch
set incsearch
set ignorecase

" Not redraw while macros
set lazyredraw
" Minimal lines cursor
set scrolloff=1
" Enable status line
set laststatus=2
" No jump to first character
set nostartofline

" No backup, swap files
set nobackup
set noswapfile
set nowritebackup

" Display line number
set number
set numberwidth=1

" Replace tabs with spaces
set expandtab
set autoindent

" 4 real spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Options ~/.viminfo
set viminfo='20,\"50
" Everything wraps
set whichwrap=<,>,[,]

" Toggle paste mode
set pastetoggle=<F12>

" Levels of indentation
set foldlevel=99
set foldmethod=indent

" File encoding
set encoding=utf-8
set fileencoding=utf-8

" Line ending characters
set fileformats=unix,dos,mac
" Fold and vertical symbols
set fillchars=fold:\ ,vert:\|

" Command-line completion
set wildmenu
set wildmode=longest:full,full

" Popup menu
set pumheight=15
set completeopt=longest,menuone

" Enable key <Backspace>
set backspace=indent,eol,start
" Tabstops, EOLs and Trails
set listchars=tab:▸\ ,eol:¬,trail:·
" Dictionary word completion
set dictionary+=/usr/share/dict/words

" Statusline (Inspired by statline.vim)
set statusline+=%<%f%h%m%r\ [%{strlen(&ft)?&ft:'none'}]
set statusline+=[%{&fileformat}→%{strlen(&fenc)?&fenc:&enc}]
set statusline+=%=L%l/%L:C%c\ %P

" Section: Mappings
" -----------------

" Close all folds
nnoremap <F6> zM
" Open all folds
nnoremap <F7> zR
" Open/Close fold
nnoremap <2-LeftMouse> za

" Toggle listchars symbols
nnoremap <F9> :set list!<CR>
" Toggle Tagbar panel
nnoremap <F2> :TagbarToggle<CR>
" Toggle NERDTree panel
nnoremap <F1> :NERDTreeToggle<CR>
" Toggle GitGutter signs
nnoremap <F4> :GitGutterToggle<CR>
" Toggle NeoComplete auto
nnoremap <F3> :NeoCompleteToggle<CR>
" Toggle indentLine guides
nnoremap <F8> :IndentLinesToggle<CR>
" Toggle Syntastic checker
nnoremap <F5> :SyntasticToggleMode<CR>

" Use Ctrl-S for saving
noremap  <C-S>      :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Splits navigation (Normal)
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-L> :wincmd l<CR>

" Tabs navigation (Normal)
nnoremap <silent> <C-T> :tabnew<CR>
nnoremap <silent> <C-N> :tabnext<CR>
nnoremap <silent> <C-B> :tabprevious<CR>

" Section: Plugins
" ----------------

" <Leader> key
let g:mapleader=','

" Disable indentLine
let g:indentLine_enabled=0

" Python syntax
let g:python_highlight_all=1

" NERDTree options
let g:NERDTreeWinSize=25
let g:NERDTreeMinimalUI=1
let g:NERDTreeStatusline='%t'

" Tagbar options
let g:tagbar_width=35
let g:tagbar_compact=1
let g:tagbar_iconchars=['▸', '▾']

" GitGutter options
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_modified_removed='±'

" NeoComplete requirements
let g:jedi#completions_enabled=0
let g:jedi#auto_vim_configuration=0
" Jedi-vim options
let g:jedi#popup_on_dot=0
let g:jedi#force_py_version=3
let g:jedi#show_call_signatures=2
let g:jedi#use_splits_not_buffers='winwidth'

" Syntastic symbols
let g:syntastic_error_symbol='●'
let g:syntastic_warning_symbol='●'
let g:syntastic_style_error_symbol='●'
let g:syntastic_style_warning_symbol='●'
" Syntastic options
let g:syntastic_enable_highlighting=0
" Syntastic mode
let g:syntastic_mode_map={'mode': 'passive'}

" UltiSnips options
let g:UltiSnipsUsePythonVersion=3
" UltiSnips triggers
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'

" NeoComplete options
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#enable_auto_select=1

" Define force_omni_input_patterns
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns={}
endif

" Records keyword patterns to Omni completion
let g:neocomplete#force_omni_input_patterns.python=
\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" Section: Autocommands
" ---------------------

if has('autocmd')
    " Change current directory
    autocmd BufEnter * silent! lcd %:p:h

    " Python/Django settings
    autocmd FileType html   setlocal filetype=html.htmldjango
    autocmd FileType python setlocal filetype=python.django
    autocmd FileType python setlocal completeopt-=preview
    autocmd FileType python setlocal omnifunc=jedi#completions

    " Omni-completion - CTRL-X_CTRL-O
    autocmd FileType c          setlocal omnifunc=ccomplete#Complete
    autocmd FileType sql        setlocal omnifunc=sqlcomplete#Complete
    autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
endif

" Include user's local Vim config
if filereadable(expand('~/.vim/vimrc.local'))
    source ~/.vim/vimrc.local
endif

