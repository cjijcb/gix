" General
set runtimepath^=~/.vim

if has('syntax')
  syntax enable
endif

if exists('+termguicolors')
  set termguicolors
endif

if exists('+t_Co')
  set t_Co=256
endif

if exists('+fixendofline')
  set nofixendofline
endif

set timeoutlen=500
set background=dark
set cursorline cursorlineopt=number
set number

" Key Mapping
let mapleader = " "
nnoremap <silent> <leader>n <Cmd>set number!<CR>
nnoremap <silent> <leader>l <Cmd>set list!<CR>
nnoremap <silent> <leader>h <Cmd>nohlsearch<CR>
nnoremap <silent> <leader>p <Cmd>%print<CR>
nnoremap <silent> <leader>v <C-v>

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Wrapping
set linebreak
set breakindent

" Editing
set backspace=indent,eol,start
set hidden

" Scrolling
set scrolloff=10
set sidescrolloff=5

" Splits
set splitbelow
set splitright

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Input
set mouse=a
set selectmode=

" Clipboard
if has('clipboard')
  set clipboard^=unnamed,unnamedplus
endif

" Persistent undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undo//
  call mkdir(expand('~/.vim/undo'), 'p')
endif

" Colorscheme
let s:scheme = 'PaperColor'
let s:dir  = expand('~/.vim/colors')
let s:file = s:dir . '/' . s:scheme . '.vim'

if !filereadable(s:file)
  let s:url_base = 'https://raw.githubusercontent.com'
  let s:url_path = '/NLKNguyen/papercolor-theme/master/colors/'
  let s:url      = s:url_base . s:url_path . s:scheme . '.vim'

  if executable('curl')
    call mkdir(s:dir, 'p')
    call system('curl -fsSL ' . shellescape(s:url) . ' -o ' . shellescape(s:file))
    if v:shell_error | call delete(s:file) | endif
  endif
endif

try
  execute 'colorscheme' s:scheme
catch
  silent! colorscheme habamax
endtry
