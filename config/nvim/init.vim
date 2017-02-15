" Plug for plugins
call plug#begin('~/.config/nvim/plugged')

" general purpose essential plugins
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTree']}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}

" go-specific plugins
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Colorscheme
Plug 'altercation/vim-colors-solarized'

call plug#end()

" syntax highlighting and autoindents
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

" highlight column 80
set colorcolumn=80

" search options, just how i like it
set noincsearch " do not jump to the search term
set nohlsearch  " do not highlight the search term

" customizations for airline {{{
  let g:airline_theme='solarized'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
" }}}

" Summon extra windows with <leader>
nmap <leader>n :NERDTreeToggle <CR>
" nmap <leader>t :TagbarToggle <CR>

" configure for solarized colorscheme
set background=dark
colorscheme solarized

" vim-go customizations {{{
  " highlight everything
  let g:go_disable_autoinstall = 0
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_fields = 1
  au Filetype go nmap <Leader>gd <Plug>(go-doc)
" }}}

" deoplete customizations {{{
  let g:deoplete#enable_at_startup = 1
  " Use smartcase
  let g:deoplete#enable_smart_case = 1
  " Set minimum syntax keyword length
  let g:deoplete#sources#syntax#min_keyword_length = 3
  " let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
  
  " <C-h>, <BS>: close popup and delete backward char
  inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

  " Recommended keymappings
  " <CR>: close popup and save indent
  " inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  " function! s:my_cr_function()
  "   return (pumvisible() ? "\<C-y>" : "\<CR>") . "\<CR>"
  " endfunction
  " <TAB>: completion
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  " unfuck tab complete. without this, a SCRATCH buffer spawns. no idea why
  set completeopt=menu

  " deoplete-go customizations {{{
    let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
    let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
    let g:deoplete#sources#go#use_cache = 1
    let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/$GOOS_$GOARCH'
  " }}}
" }}}

" use a powerline font in gui mode
if has('gui_running')
  set guifont=Source\ Code\ Pro\ for\ Powerline:h12
endif
