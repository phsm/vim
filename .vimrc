call plug#begin('~/.vim/plugged')

Plug 'tomasr/molokai'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

filetype plugin indent on
set autoindent


set background=dark

set number

set cursorline
hi Cursorline term=underline cterm=underline gui=underline
set tabstop=4 shiftwidth=4 expandtab
highlight SyntasticError guibg=#2f0000

set colorcolumn=80

map <F3> :tabp<CR>
map <F4> :tabn<CR>
map <C-t> :tabe<CR>
imap <F3> <ESC>:tabp<CR>
imap <F4> <ESC>:tabn<CR>
imap <C-t> <ESC>:tabe<CR>

noremap <silent> <F11> :cal VimCommanderToggle()<CR>

function! CleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
	else
	return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

set foldmethod=marker
set foldmarker={{{,}}}

set pastetoggle=<F2>

set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

syntax on " syntax highlighing
filetype on " try to detect filetypes
filetype plugin indent on " enable loading indent file for filetype
colorscheme molokai
let g:molokai_original = 1

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>
nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
