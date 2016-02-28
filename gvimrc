" File: ~/.vim/gvimrc
" Description: GVim configuration file

" Section: Options
" ----------------

" GUI color scheme
colorscheme solarized-light

" Disable beep and flash
set vb t_vb=
" Disable menubar
set guioptions-=m
" Disable toolbar
set guioptions-=T
" Disable gtk tabs
set guioptions-=e
" Disable left scrollbar
set guioptions-=L
" Disable right scrollbar
set guioptions-=r
" Initial size window
set lines=30 columns=95

" Set Font family
set antialias
" set guifont=Consolas\ Bold\ 15
set guifont=Fira\ Mono\ Medium\ 14

" Section: Mappings
" -----------------

" Ctrl-Space (Omni Completion)
inoremap <C-Space> <C-X><C-O>
" Shift-Space (Word Completion)
inoremap <S-Space> <C-X><C-N>

" Include user's local gVim config
if filereadable(expand('~/.vim/gvimrc.local'))
    source ~/.vim/gvimrc.local
endif

