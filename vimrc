let color = "true"
set sh=/bin/bash
set encoding=utf-8
set background=dark
set backspace=indent,eol,start
set expandtab
set ignorecase
set incsearch
set matchpairs=(:),{:},[:],<:>
set nobackup
set nocompatible
set nohlsearch
set nostartofline
set nowritebackup
set number
set nobackup
set nowb
set noswapfile
"set paste
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set cc=80
set scrolloff=5
set showcmd
set showmatch
set showmode
set smartindent
set smartcase
set tabstop=2 shiftwidth=2 softtabstop=2
set whichwrap=b,s,h,l,<,>,[,]
set laststatus=2
set hidden
set foldmethod=syntax
set nofoldenable
set wildmenu
set ttyfast
set noeol
set cursorline
syntax on
hi Comment ctermfg=darkgrey
filetype off
set gfn=MonoOne\ 11.5
set shortmess+=filmnrxoOtT
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set history=1000
set spell
set linespace=0

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage bundles
" required!
Bundle 'gmarik/vundle'

" More bundles
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/syntastic'
Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-commentary'
Bundle 'itchyny/lightline.vim'
Bundle 'godlygeek/tabular'
Bundle 'altercation/vim-colors-solarized'
Bundle 'gmarik/sudo-gui.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/MatchTagAlways'
Bundle 'mhinz/vim-signify'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'slim-template/vim-slim'
Bundle 'Yggdroot/indentLine'
Bundle 'tpope/vim-vinegar'
Bundle 'justincampbell/vim-eighties'
Bundle 'chriskempson/base16-vim'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'klen/python-mode'
Bundle 'jordwalke/flatlandia'

filetype plugin indent on

if has("gui_running")
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set t_Co=256

  " colorscheme solarized
  " let g:solarized_termcolors=256
  " let g:solarized_termtrans=1
  " let g:solarized_contrast="high"
  " let g:solarized_visibility="high"
  " set background=light

  " colorscheme base16-ocean
  colorscheme flatlandia

  set listchars=tab:▸·,eol:¶,trail:·
  set list
else
  let base16colorspace=256
endif

" Keyboard maps
nmap <space> :
nmap <leader>e :vsp
nmap <leader>q :bd<CR>
nmap <leader>cd  :lcd%:p:h<CR>
nmap <leader>w :w<CR>

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" netrw
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 1
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 0
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_use_errorwindow = 0
let netrw_list_hide = '^\(\..\{-}\.sw.\|.\{-}\.pyc\)$'

" Status line
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '⭠ %{exists("*fugitive#head")?fugitive#head():""}',
  \   'lineinfo': '⭡ %3l:%-2v'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'separator': { 'left': '⮀', 'right': '⮂' },
  \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
  \ }

" Copy/Cat
set clipboard=unnamedplus

" CtrlP Stuff
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_open_new_file = 3
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|bzr)$|coverage|tmp\/cache',
  \ }
let g:ctrlp_user_command = [
  \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
  \ 'find %s -type f'
  \ ]

" Signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_color_inherit_from_linenr = 1

" Eighties
let g:eighties_enabled = 1
let g:eighties_minimum_width = 80

" YCM support for comments
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Python Mode
let g:pymode_folding = 0
let g:pymode_motion = 0
let g:pymode_lint_cwindow = 0
let g:pymode_rope = 0
let g:pymode_rope_completion = 0

" Remove any preview windows
set completeopt-=preview

" Enable omni completion.
set ofu=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Remove whitespaces on save
autocmd FileType ruby,python,php,javascript,html,markdown,css,slim autocmd BufWritePre * :%s/\s\+$//e

" More file types
autocmd BufNewFile,BufRead *.sls set filetype=yaml
autocmd BufNewFile,BufRead *.es6 set filetype=javascript
autocmd BufNewFile,BufRead *.hbs set filetype=jinja
autocmd BufNewFile,BufRead *.md set filetype=markdown
