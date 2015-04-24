" File: ~/.vim/vimrc
" Description: Vim configuration file
" Documentation: http://vimdoc.sourceforge.net/htmldoc/

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
" Hide message modes
set noshowmode

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

" Toggle paste mode
set pastetoggle=<F9>

" Options ~/.viminfo
set viminfo='20,\"50
" Everything wraps
set whichwrap=<,>,[,]

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
nnoremap <F7> zM
" Open all folds
nnoremap <F8> zR
" Open/Close fold
nnoremap <2-LeftMouse> za

" Toggle listchars symbols
nnoremap <F6> :set list!<CR>
" Toggle Tagbar panel
nnoremap <F2> :TagbarToggle<CR>
" Toggle NERDTree panel
nnoremap <F1> :NERDTreeToggle<CR>
" Toggle GitGutter signs
nnoremap <F4> :GitGutterToggle<CR>
" Toggle NeoComplete auto
nnoremap <F3> :NeoCompleteToggle<CR>
" Toggle Syntastic checker
nnoremap <F5> :SyntasticToggleMode<CR>

" Use Ctrl-S for saving
noremap  <C-S>      :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Splits navigation (Normal)
nnoremap <silent> <S-Up>    :wincmd k<CR>
nnoremap <silent> <S-Down>  :wincmd j<CR>
nnoremap <silent> <S-Left>  :wincmd h<CR>
nnoremap <silent> <S-Right> :wincmd l<CR>
" Splits navigation (Insert)
inoremap <silent> <S-Up>    <C-O>:wincmd k<CR>
inoremap <silent> <S-Down>  <C-O>:wincmd j<CR>
inoremap <silent> <S-Left>  <C-O>:wincmd h<CR>
inoremap <silent> <S-Right> <C-O>:wincmd l<CR>

" Tabs navigation (Normal)
nnoremap <silent> <C-t>     :tabnew<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left>  :tabprevious<CR>
" Tabs navigation (Insert)
inoremap <silent> <C-t>     <C-O>:tabnew<CR>
inoremap <silent> <C-Right> <C-O>:tabnext<CR>
inoremap <silent> <C-Left>  <C-O>:tabprevious<CR>

" Section: Plugins
" ----------------

" <Leader> key
let g:mapleader=','

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

" Jedi-vim options
let g:jedi#popup_on_dot=0
let g:jedi#force_py_version=3
let g:jedi#show_call_signatures=2
" NeoComplete requirements
let g:jedi#completions_enabled=0
let g:jedi#auto_vim_configuration=0

" GitGutter options
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_modified_removed='±'

" Syntastic symbols
let g:syntastic_error_symbol='●'
let g:syntastic_warning_symbol='●'
let g:syntastic_style_error_symbol='●'
let g:syntastic_style_warning_symbol='●'
" Syntastic options
let g:syntastic_enable_highlighting=0
" Syntastic mode
let g:syntastic_mode_map={'mode': 'passive'}

" UltiSnips options/triggers
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'

" Lightline options
let g:lightline={
    \ 'colorscheme': 'Tomorrow_Night',
    \ 'enable': {'tabline': 0, 'statusline': 1}
    \ }

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
    " Remove all trailing whitespace
    autocmd BufWritePre * :%s/\s\+$//e

    " Change current directory
    autocmd BufEnter * silent! lcd %:p:h

    " Jedi/Django settings
    autocmd FileType html   setlocal filetype=htmldjango
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

