set nocompatible
scriptencoding utf-8
set encoding=utf-8

""" Leader #leader
let g:mapleader='\\'
let g:maplocalleader='\\'

set clipboard=unnamed

" ======== General Config
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set ignorecase
set autoread                    "Reload files changed outside vim
set number
set hidden
set list

" ======== Indentation & tab settings
set expandtab
set shiftwidth=2
set softtabstop=2
set nowrap "Don't wrap lines
set linebreak "Wrap lines at convenient points
filetype plugin on
filetype indent on

" ======== Persistent Undo
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-mix-format'
Plug 'dart-lang/dart-vim-plugin'
Plug 'ElmCast/elm-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mattreduce/vim-mix'
Plug 'dyng/ctrlsf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" Typescript
augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup END

" Custom split opening / closing behaviour
map <C-N> :vsp<CR><C-P>
map <C-C> :q<CR>
" Custom tab opening behaviour
map <leader>n :tabnew .<CR><C-P>
" switch between tabs
nnoremap <tab> :tabprev<cr>

" FZF mapping
let g:fzf_layout = { 'window': 'enew' }
nnoremap <silent> <C-P> :FZF<cr>
nnoremap <silent> <leader>a :Ag<cr>
augroup localfzf
  autocmd!
  autocmd FileType fzf :tnoremap <buffer> <C-J> <C-J>
  autocmd FileType fzf :tnoremap <buffer> <C-K> <C-K>
  autocmd VimEnter * command! -bang -nargs=* Ag
        \ call fzf#vim#ag(<q-args>,
        \                 <bang>0 ? fzf#vim#with_preview('up:60%')
        \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
        \                 <bang>0)
augroup END
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" CtrolSF
nmap <leader>f <Plug>CtrlSFPrompt


" Delete trailing white space on save
func! DeleteTrailingWS()
  exe 'normal mz'
  %s/\s\+$//ge
  exe 'normal `z'
endfunc

augroup whitespace
  autocmd BufWrite * silent call DeleteTrailingWS()
augroup END

let g:mix_format_on_save = 1
