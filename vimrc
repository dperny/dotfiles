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
syntax enable
filetype plugin indent on

" i will never, ever use Modula-2 in my life. *.md is always markdown
autocmd BufNewFile,Bufread *.md set filetype=markdown

" line numbering settings
" set both for magic
set relativenumber
set number

" unfuck backspace
set backspace=indent,eol,start

" use 2 space indents, no tabs.
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" except with go.
autocmd Filetype go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" split to the right and down
set splitbelow
set splitright

" escape with jj
imap jj <Esc>

" space is my leader key
let mapleader="\<Space>"

" enable the mouse
set mouse=a
" and unfuck clicking the right side of the screen
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

" highlight column 80
set colorcolumn=80

" configure for solarized colorscheme
if $COLOR == "light"
  set background=light
else
  set background=dark
endif

" Summon extra windows with <leader>
nmap <leader>n :NERDTreeToggle <CR>
nmap <leader>t :TagbarToggle <CR>

" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
let g:solarized_termcolors = 16
colorscheme solarized

" vim go customizations
let g:go_disable_autoinstall = 0
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_fields = 1
au Filetype go nmap <Leader>gd <Plug>(go-doc)

" neocomplete customizations {{{
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Recommended keymappings
  " <CR>: close popup and save indent
  " inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  " function! s:my_cr_function()
    " return (pumvisible() ? "\<C-y>" : "\<CR>") . "\<CR>"
  " endfunction
  " <TAB>: completion
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" }}} 


" tagbar customizations
let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n',
  \ },
  \ 'ctagsbin' : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }

" use a powerline font in gui mode
if has('gui_running')
  set guifont=Source\ Code\ Pro\ for\ Powerline:h12
endif
