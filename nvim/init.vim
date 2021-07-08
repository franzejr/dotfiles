scriptencoding utf-8
" Table of Contents
" 1) Basics #basics
"   1.1) Tabs #tabs
"   1.2) Format Options #format-options
"   1.3) Leader #leader
"   1.4) Omni #omni
"   1.5) UI Basics #ui-basics
" 2) Plugins #plugins
"   2.1) Filetypes #filetypes
"   2.2) Utilities #utilities
"   2.3) UI Plugins #ui-plugins
"   2.4) Code Navigation #code-navigation
" 3) UI Tweaks #ui-tweaks
"   3.1) Theme #theme
" 4) Navigation #navigation

"""""""""""""" Basics #basics
""" Tabs #tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2

""" Format Options #format-options
set formatoptions=tcrq
set textwidth=80

""" Handling backup copies
" make a copy of the file and overwrite the original one
set backupcopy=yes

""" Leader #leader
" Use space for leader
let g:mapleader='\\'
" Double backslash for local leader
let g:maplocalleader='\\'

""" omni #omni

" enable omni syntax completion
set omnifunc=syntaxcomplete#Complete

""" UI Basics #ui-basics
" turn off mouse
set mouse=""

" NOTE: I stopped highlighting cursor position because it makes redrawing
" super slow.
" set cursorline
" set cursorcolumn

" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case when searching
set ignorecase smartcase
" Ignore case when searching lowercase
set smartcase

" Set the title of the iterm tab
set title

" Line numbering
set number

""" Undo #undo
" undofile - This allows you to use undos after exiting and restarting
" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
" :help undo-persistence
" This is only present in 7.3+
if isdirectory($HOME . '/.config/nvim/undo') == 0
  :silent !mkdir -p ~/.config/nvim/undo > /dev/null 2>&1
endif

"""""""""""""" End Basics

"""""""""""""" Plugins #plugins
call plug#begin('~/.config/nvim/plugged')
"" Dash
Plug 'rizzatti/dash.vim'
""Vim Wiki
Plug 'vim-scripts/vimwiki'
let wiki = {}
let g:vimwikidir = $HOME . "/Dropbox/vimwiki"
let wiki.path = g:vimwikidir
let g:vimwiki_list=[wiki]
""" Filetypes #filetypes
" Polyglot loads language support on demand!
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['elm']

Plug 'ryanoasis/vim-devicons'

" HTML / JS / CSS
Plug 'sbdchd/neoformat'
Plug 'othree/html5.vim'
Plug 'vim-scripts/html-improved-indentation'
Plug 'pangloss/vim-javascript'
" For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
""" Add support for ANSI colors - this has variously been necessary and caused
""" problems, no clue what's up there...
Plug 'powerman/vim-plugin-AnsiEsc'

" Phoenix
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist' " required for some navigation features

" Elm
Plug 'ElmCast/elm-vim'
let g:elm_format_autosave = 1
let g:elm_detailed_complete = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_format_fail_silently = 1
let g:elm_browser_command = 'open'
let g:elm_make_show_warnings = 1
let g:elm_setup_keybindings = 1


   " assuming you're using vim-plug: https://github.com/junegunn/vim-plug
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'

    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANT: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'


" Dart
Plug 'dart-lang/dart-vim-plugin'
let dart_format_on_save = 1
Plug 'dart-lang/dart-vim-plugin', { 'for': [ 'dart' ] }


" Fuse
Plug 'BeeWarloc/vim-fuse'

" Markdown
function! NpmInstallAndUpdateRemotePlugins(info)
  !npm install
  UpdateRemotePlugins
endfunction
Plug 'neovim/node-host', { 'do': function('NpmInstallAndUpdateRemotePlugins') }
""Plug 'vimlab/mdown.vim', { 'do': function('NpmInstallAndUpdateRemotePlugins') }

""" Utilities #utilities
Plug 'bogado/file-line'

" Easily toggle quickfix and locations lists with <leader>l and <leader>q
Plug 'milkypostman/vim-togglelist'

" TypeScript {{{4
Plug 'HerringtonDarkholme/yats.vim'
" For Denite features
Plug 'Shougo/denite.nvim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
let g:prettier#autoformat = 1
let g:prettier#exec_cmd_async = 1
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


Plug 'ervandew/supertab'

" Add comment textobjects (I really want to reformat comments without affecting
" the next line of code)
Plug 'kana/vim-textobj-user' | Plug 'glts/vim-textobj-comment'
" Example: Reformat a comment with `gqac` (ac is "a comment")

" EditorConfig support
Plug 'editorconfig/editorconfig-vim'

" Jump between quicklist, location (syntastic, etc) items with ease, among other things
Plug 'tpope/vim-unimpaired'

" Line commenting
Plug 'tomtom/tcomment_vim'
" By default, `gc` will toggle comments


Plug 'christoomey/vim-tmux-navigator'

Plug 'janko-m/vim-test'                " Run tests with varying granularity
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
" run tests in neoterm
let g:test#strategy = 'neoterm'
" I use spinach, not cucumber!
let g:test#ruby#cucumber#executable = 'spinach'
"" Elixir LS
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}

"" TypeScript LS

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup
" Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Asynchronous file linter
Plug 'dense-analysis/ale'
" wait a bit before checking syntax in a file, if typing
let g:ale_lint_delay = 100
let g:ale_fixers = {'javascript': ['eslint'], 'elixir': ['mix_format'] }
let g:ale_linters = {'javascript': ['standard']}
let g:ale_fix_on_save = 1
" Enable completion where available.
let g:ale_completion_enabled = 1

" git support from dat tpope
Plug 'tpope/vim-fugitive'

" github support from dat tpope
Plug 'tpope/vim-rhubarb'

" vim interface to web apis.  Required for gist-vim
Plug 'mattn/webapi-vim'

" create gists trivially from buffer, selection, etc.
Plug 'mattn/gist-vim'
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 2
let g:gist_post_private = 1
if has('macunix')
  let g:gist_clip_command = 'pbcopy'
endif

" visualize your undo tree
Plug 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

" org-mode
Plug 'jceb/vim-orgmode'
let g:org_agenda_files = ['~/org/index.org']
let g:org_export_emacs = '/usr/local/bin/emacs'
let g:org_export_verbose = 1

" universal text linking
Plug 'vim-scripts/utl.vim'

" allow portions of a file to use different syntax
Plug 'vim-scripts/SyntaxRange'

" increment dates like other items
Plug 'tpope/vim-speeddating'

" calendar application
Plug 'itchyny/calendar.vim'
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" nicer api for neovim terminal
Plug 'kassio/neoterm'

""" UI Plugins #ui-plugins
" Molokai theme makes me cozy
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'
Plug 'tomasiser/vim-code-dark'
" Try out the ayu theme - https://github.com/ayu-theme/ayu-vim
Plug 'ayu-theme/ayu-vim'
" Solarized - variant with specific terminal support
Plug 'lifepillar/vim-solarized8'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"let g:airline_theme = 'luna'
"let g:airline_theme = 'lucius'
let g:airline_theme = 'solarized'
let g:bufferline_echo = 0
let g:airline_powerline_fonts=0
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
let g:airline_branch_prefix = '⎇ '
let g:airline_paste_symbol = '∥'
let g:airline#extensions#tabline#enabled = 0

""" Code Navigation #code-navigation
" fzf fuzzy finder
"" PLUGIN: FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_preview_window = ['down:40%', 'ctrl-/']
nnoremap <silent> <C-F> :FZF<cr>
nnoremap <silent> <C-P> :Files<cr>
nnoremap <silent> <Leader>a :Ag<cr>
nnoremap <silent> <Leader>c :Commits<CR>


"" ONLY PRETTIER
"" autoformato JS files with Prettier
""autocmd BufWritePre *.js Neoformat standard
""autocmd BufWritePre *.js Tradeship


" Open files where you last left them
Plug 'dietsche/vim-lastplace'

let g:ale_fixers = {'javascript': ['prettier-standard']}
let g:ale_linters = {'javascript': ['standard']}
let g:ale_fix_on_save = 1


" Remove unused imports
Plug 'karthikv/tradeship-vim'
" navigate up a directory with '-' in netrw, among other things
Plug 'tpope/vim-vinegar'

Plug 'mhinz/vim-mix-format'

Plug 'sheerun/vim-polyglot'

Plug 'trevordmiller/nova-vim'

Plug 'junegunn/goyo.vim'

let g:mix_format_on_save = 1

" vifm file manager as the default vim file management tool
" Plug 'vifm/neovim-vifm'
" NOTE: I don't get highlighting with this and it's hard to see where the
" selection is

call plug#end()

"" Plugin configuration that has to run after plug#end

"""""""""""""" End Plugins


"""""""""""""" UI Tweaks #ui-tweaks
""" Theme #theme
if (empty($TMUX))
  if (has('termguicolors'))
    set termguicolors
  endif
endif
set background=dark
"set background=light
syntax enable
"colorscheme molokai
"colorscheme ayu
colorscheme codedark

" Ayu theme config
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
" colorscheme solarized8_light_flat
" colorscheme solarized8_dark_flat
"set background=dark

""" Keyboard
" Remove highlights
" Clear the search buffer when hitting return
nnoremap <silent> <cr> :nohlsearch<cr>

" NO ARROW KEYS COME ON
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

" Custom split opening / closing behaviour
map <C-N> :vsp<CR><C-P>
map <C-C> :q<CR>
" Custom tab opening behaviour
map <leader>n :tabnew .<CR><C-P>

" reselect pasted content:
noremap gV `[v`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines above)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Open the alternate file
map ,, <C-^>

" Makes foo-bar considered one word
set iskeyword+=-

""" Auto Commands ====================== #auto-cmd

" A helper function to restore cursor position, window position, and last search
" after running a command.  From:
" http://stackoverflow.com/questions/15992163/how-to-tell-vim-to-auto-indent-before-saving
function! Preserve(command)
  " Save the last search.
  let search = @/

  " Save the current cursor position.
  let cursor_position = getpos('.')

  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)

  " Execute the command.
  execute a:command

  " Restore the last search.
  let @/ = search

  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt

  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

" Re-indent the whole buffer.
function! Indent()
  call Preserve('normal gg=G')
endfunction

""""" Filetypes ========================
augroup erlang
  autocmd!
  autocmd BufNewFile,BufRead *.erl setlocal tabstop=4
  autocmd BufNewFile,BufRead *.erl setlocal shiftwidth=4
  autocmd BufNewFile,BufRead *.erl setlocal softtabstop=4
  autocmd BufNewFile,BufRead relx.config setlocal filetype=erlang
augroup END

augroup elm
  autocmd!
  autocmd BufNewFile,BufRead *.elm setlocal tabstop=4
  autocmd BufNewFile,BufRead *.elm setlocal shiftwidth=4
  autocmd BufNewFile,BufRead *.elm setlocal softtabstop=4
augroup END

augroup dotenv
  autocmd!
  autocmd BufNewFile,BufRead *.envrc setlocal filetype=sh
augroup END

augroup es6
  autocmd!
  autocmd BufNewFile,BufRead *.es6 setlocal filetype=javascript
  autocmd BufNewFile,BufRead *.es6.erb setlocal filetype=javascript
augroup END

augroup markdown
  autocmd!
  autocmd FileType markdown setlocal textwidth=80
  autocmd FileType markdown setlocal formatoptions=tcrq
  autocmd FileType markdown setlocal spell spelllang=en
augroup END

augroup viml
  autocmd!
  autocmd FileType vim setlocal textwidth=80
  autocmd FileType vim setlocal formatoptions=tcrq
augroup END
""""" End Filetypes ====================

""""" Normalization ====================
" Delete trailing white space on save
func! DeleteTrailingWS()
  exe 'normal mz'
  %s/\s\+$//ge
  exe 'normal `z'
endfunc

augroup whitespace
  autocmd BufWrite * silent call DeleteTrailingWS()
augroup END
""""" End Normalization ================
""" End Auto Commands ==================

""" Navigation ====================== #navigation
" Navigate terminal with C-h,j,k,l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Navigate splits with C-h,j,k,l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <BS> <C-w>h
" Have to add this because hyperterm sends backspace for C-h

" Navigate tabs with leader+h,l
" It's hard to hit space and h/l simultaneously so increase the timeout for
" space
nnoremap <tab> :tabprev<cr>
"" nnoremap <tab> :tabnext<cr>
""" End Navigation ==================


" Load additional HTML syntax files
runtime! syntax/html/*.vim

" Add `local-class` to work with `ember-css-modules`
syn match htmlArg contained "\<local-class\>"

