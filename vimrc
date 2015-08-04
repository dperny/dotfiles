" compatible is for chumps and old people
set nocompatible
execute pathogen#infect()

" enable powerline
python import sys; sys.path.append("/usr/local/lib/python2.7/site-packages/")
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2

" synatx highlighting and autoindents
syntax on
filetype plugin indent on

" i will never, ever use Modula-2 in my life. *.md is always markdown
autocmd BufNewFile,Bufread *.md set filetype=markdown

" line numbering settings
" set both for magic
set relativenumber
set number

" use 2 space indents, no tabs.
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" split to the right and down
set splitbelow
set splitright

" escape with jj
imap jj <Esc>

" enable the mouse
set mouse=a

" highlight column 80
set colorcolumn=80

" configure for solarized colorscheme
if $COLOR == "light"
  set background=light
else
  set background=dark
endif

let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 16
colorscheme solarized

" use a powerline font in gui mode
if has('gui_running')
  set guifont=Source\ Code\ Pro\ for\ Powerline:h12
endif
