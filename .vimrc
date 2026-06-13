" General
if has('syntax')
  syntax on
endif

set linebreak
set breakindent
set autoindent
set expandtab
set background=dark

if exists('+fixendofline')
  set nofixendofline
endif

" Tabs
set tabstop=4
set shiftwidth=4

" Input
set mouse=nic
set selectmode=
set pastetoggle=<F2>

" Clipboard
if has('clipboard')
  set clipboard^=unnamed,unnamedplus
endif

" Colorscheme
let s:dir  = expand('~/.vim/colors')
let s:file = s:dir . '/one.vim'
let s:url  = 'https://raw.githubusercontent.com/rakr/vim-one/master/colors/one.vim'

if !filereadable(s:file) && executable('curl')
  call mkdir(s:dir, 'p')
  call system('curl -fsSL ' . shellescape(s:url) . ' -o ' . shellescape(s:file))
  if v:shell_error
    call delete(s:file)
  endif
endif

try
  colorscheme one
catch
  silent! colorscheme habamax
endtry
