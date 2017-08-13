" Apparently some vim environments require colons before commands in
" .vimrc and others don't. This file has been primarily tested in 
" Ubuntu 12.04, 13.10, and 14.04 environments, where a : is required
" on each line before a command. According to one stackexchange topic
" it is best to leave the leading colons because systems that do not 
" require them can still execute them.
"
" You MUST add a $HOME/.vim/ directory or you will not get undos.
"
" Author - Trent Robbins

" set backspace for macos delete key (otherwise it doesn't work)
" this can probably be left in linux
:set backspace=indent,eol,start


" FUTURE - see what you want from these places:
" https://github.com/amix/vimrc
" https://github.com/nvie/vimrc


" EXPERIMENTAL SECTION
" *** *** ***
  

" if over 80 characters, background is dark red.
":highlight OverLength ctermbg=52
"match OverLength /\%>80v.\+/

" showmatch will show matching highlights
:set showmatch

" backup -- work with this later
" PURPOSE - don't lose data you haven't written!
" NOTES - uses tmp folder, i use a .vim folder for undo history, could use it
" for backups too
" source: https://dougblack.io/words/a-good-vimrc.html
" set backup
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set backupskip=/tmp/*,/private/tmp/*
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set writebackup
"

" *** *** ***
" END EXPERIMENTAL SECTION

" background is always dark
:set background=dark
" set 256 colors so we can use highlights
:set t_Co=256
" Need to have t_Co=256 to use these
" Color Chart: http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
" tmux also required an alias in bash on ubuntu desktop, see .tmux.conf
" Set Cursor row and column colors
:highlight CursorLine ctermbg=232 cterm=NONE
:highlight CursorColumn ctermbg=232 cterm=NONE
" Set Cursor row and column to on.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
  au WinLeave * setlocal nocursorline nocursorcolumn
augroup END

" leave a five line buffer at top or bottom of cursor for readability
:set scrolloff=5
"show the commands which you enter in the bottom right corner
:set showcmd
" Turn on line numbers:
:set number
" syntax by default
:syntax enable

" Quickly quit without saving with QQ
:nmap QQ :q!<cr>

" yank to end of line quickly
:nmap yy y$

" Highlight things that we find with the search
:set hlsearch
" incremental search - search as you type
:set incsearch
" <Ctrl-l> redraws the screen and removes any search highlighting.
:nnoremap <silent> <C-l> :nohl<CR><C-l>

" inserts spaces instead of a tab
:set expandtab
"maintain tabbing increments when backspacing tabs (speed things up)
:set smarttab

" set spaces used for indentenation
:set shiftwidth=2
:set tabstop=2
" does a tabstop of 4 during edit commands
:set softtabstop=2

:autocmd FileType py setlocal shiftwidth=4 tabstop=4 softtabstop=4

" indent to previous line automatically
:filetype plugin indent on

" allow input toggle to paste mode with F2
:set pastetoggle=<F2>

" customtabsize's state informs the function what state you are currently in
" if the default settings change, then this variable would need to be changed too
" try this... :let g:customtabsize = 1
:let g:customtabsize=0
" allow toggle between 2/4 spaces.
function TabToggle()
  if g:customtabsize
    :set shiftwidth=2
    :set tabstop=2
    :set softtabstop=2
    :let g:customtabsize=0
  else
    :set shiftwidth=4
    :set tabstop=4
    :set softtabstop=4
    :let g:customtabsize=1
  endif
endfunction
" TabToggle dumps you at the top of the document so you need to mark your
" place... set scrolloff=5 or higher to have a better time finding the cursor
:nmap <F3> mx:execute TabToggle()<cr>'xzz

" Maintain undo history between sessions
:set undofile 
" this directory must exist or you won't get undos.  Consider generating this
" in your dotfiles
:set undodir=~/.vim
:set undolevels=1000 " This many undos are saved.
:set undoreload=10000 " This saves 10000 lines of undos, which is the default

" add visual convenience for olding
:set foldmethod=indent
:set foldlevel=99
:nnoremap <Space> za

" Keep visual block after changing indent
:vmap > >gv
:vmap < <gv

" Allow .MD files to automagically use markdown syntax
:au BufNewFile,BufReadPost *.MD set filetype=markdown
:au BufRead,BufNewFile *.md set filetype=markdown

" Turn arrow keys off:
" To cycle history in `ed` mode, use C-n and C-p (although up and down might work fine)
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
