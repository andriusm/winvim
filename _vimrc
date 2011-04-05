call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"colorscheme zenburn
colorscheme desert
syntax on
set ic
set number
set ruler
set hlsearch
set guifont=Bitstream\ Vera\ Sans\ Mono:h14
"set guifont=Consolas:h14
"set columns=140
"set lines=45
set lines=999
set columns=999

"filetype plugin indent on
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set splitbelow
set foldenable

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

nnoremap <C-F11> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F12> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

nnoremap <C-PageUp> <esc>:bp<cr>
nnoremap <C-PageDown> <esc>:bn<cr>

map <F2> :% ! xxd<CR>
map <F3> :% ! xxd -r<CR>
map <F4> <esc>:NERDTreeToggle<CR>
map <F5> "+y
map <F6> :set wrap!<CR>
"map <F11> :set guifont=Bitstream\ Vera\ Sans\ Mono:h11<CR>
"map <F12> :set guifont=Bitstream\ Vera\ Sans\ Mono:h14<CR>
map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

abbrev ff :! start firefox %:p<cr>

" from the configure vim right page
" http://items.sjbach.com/319/configuring-vim-right
"set hidden
"set history=1000
"set wildmenu
"set scrolloff=3
"set backspace=indent,eol,start

set nowrap
"set wrap
"set linebreak
"set nolist  " list disables linebreak
"set textwidth=0
"set wrapmargin=0
":set formatoptions+=l
