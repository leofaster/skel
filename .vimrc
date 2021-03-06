highlight WhiteSpaceEol ctermbg=darkgreen guibg=lightgreen
highlight Tabs ctermbg=darkred guibg=lightred
hi CursorColumn gui=NONE guibg=#000000
hi! link CursorColumn CursorLine

let g:whiteSpaceColor = 1

function ToggleWhiteSpaceColor()
  if g:whiteSpaceColor
    let g:whiteSpaceColor = 0
  else
    let g:whiteSpaceColor = 1
  end
  call WhiteSpaceColorCallback()
endfunction

function WhiteSpaceColorCallback()
  if g:whiteSpaceColor
    if !exists("w:match_WhiteSpaceEol")
      let w:match_WhiteSpaceEol = matchadd('WhiteSpaceEol', '\s\+$', -1)
    end

    if !exists("w:match_Tabs")
      let w:match_Tabs = matchadd('Tabs', '\t', -1)
    end
  else
    if exists("w:match_WhiteSpaceEol")
      call matchdelete(w:match_WhiteSpaceEol)
      unlet w:match_WhiteSpaceEol
    end

    if exists("w:match_Tabs")
      call matchdelete(w:match_Tabs)
      unlet w:match_Tabs
    end
  end
endfunction

au BufWinEnter * call WhiteSpaceColorCallback()



" Stuff from Ubuntu’s /etc/vim/vimrc
if has("syntax")
  syntax on
endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
endif



" Options
set background=dark
set cryptmethod=blowfish
set hls
set incsearch
set mouse=a
set nobackup
set notimeout
set number
set showcmd
set showmatch

set timeout
set ttimeout
set timeoutlen=0
set ttimeoutlen=0

set history=32768
set undolevels=16384

set expandtab
set shiftwidth=2
set softtabstop=0
set tabstop=8

set iminsert=0
set imsearch=0
set keymap=greek_utf-8

let g:netrw_altv = 1



" Fn mappings
map <F2>  :set cursorline!<CR>
map <F3>  :set cursorcolumn!<CR>
map <F4>  :call ToggleWhiteSpaceColor()<CR>
map <F5>  :set wrap!<CR>
map <F6>  :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif<CR>
map <F7>  :set scrollbind!<CR>
map <F8>  :noh<CR>
map <F10> `[v`]
map <F11> @@
map <F12> @:


" Other mappings
map <Leader>< :prev<CR>
map <Leader>> :next<CR>
map <Leader>w< :wprev<CR>
map <Leader>w> :wnext<CR>



" Thrift stuff
"au BufRead,BufNewFile *.thrift set filetype=thrift
"au! Syntax thrift source ~/.vim/thrift.vim



"runtime ftplugin/man.vim

"execute pathogen#infect()



set undodir=~/.vim/undo/
