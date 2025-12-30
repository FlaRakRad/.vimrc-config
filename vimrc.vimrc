set nocompatible

syntax on

set number
set hlsearch
set mousehide
set novisualbell
set backspace=indent,eol,start
set whichwrap+=<,>,[,]

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent

set showtabline=1
set ruler
set showmode
set showcmd

set termguicolors
set background=dark
let g:catppuccin_flavour = "macchiato"
colorscheme catppuccin_macchiato

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap < <><Left>
inoremap [ []<Left>
inoremap / //
inoremap * **<Left>

inoremap " ""<Left>
inoremap ' ''<Left>
