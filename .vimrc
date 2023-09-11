" Apparently some vim environments require colons before commands in
" .vimrc and others don't. This file has been primarily tested in 
" Ubuntu 12.04, 13.10, and 14.04 environments, where a : is required
" on each line before a command. According to one stackexchange topic
" it is best to leave the leading colons because systems that do not 
" require them can still execute them.
"
" You MUST add a $HOME/.vim/ directory or you will not get undos.
"
"
" Notes: to split a line, use `f<spacebar>` to advance to the spacebar, use ;,
" to traverse to next/prev spacebar during f mode, and then type r<return> to replace the
" spacebar with a newline
"
" 256 ctermbg vim colors: https://jonasjacek.github.io/colors/
" Author - Trent Robbins

" set backspace for macos delete key (otherwise it doesn't work)
" this can probably be left in linux
:set backspace=indent,eol,start


" FUTURE - see what you want from these places:
" https://github.com/amix/vimrc
" https://github.com/nvie/vimrc


" EXPERIMENTAL SECTION
" *** *** ***

" highlight trailing whitespace Turqoise2=45
:highlight ExtraWhitespace ctermbg=45
2match ExtraWhitespace /\s\+$/
":call matchadd('ExtraWhitespace', '/\s\+$/')

" if over 80 characters, highlight darkred==52.
":highlight OverLength ctermbg=52
"match OverLength /\%>120v.\+/

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
"
" set 256 colors so we can use highlights
:set t_Co=256

" Need to have t_Co=256 to use these:
" Color Chart: http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
" tmux also required an alias in bash on ubuntu desktop, see .tmux.conf

" Set Cursor row and column colors - classic (not background aware)
" :highlight CursorLine ctermbg=232 cterm=NONE
" :highlight CursorColumn ctermbg=232 cterm=NONE

" set cursor highlights  by running event-triggered function on event OptionSet background
function! SetCursorLineHighlight()
  let cursorline_bg = &background == "dark" ? 235 : 193
  execute 'highlight CursorLine ctermbg=' . cursorline_bg . ' cterm=NONE'
  execute 'highlight CursorColumn ctermbg=' . cursorline_bg . ' cterm=NONE'
  execute 'setlocal cursorline cursorcolumn'
endfunction
augroup CursorLineSettings
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * call SetCursorLineHighlight()
  autocmd OptionSet background call SetCursorLineHighlight()
  autocmd WinLeave * setlocal nocursorline nocursorcolumn
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

" indent to previous line automatically
:filetype plugin indent on

" allow input toggle to paste mode with F2
:set pastetoggle=<F2>




" FUTURE: "A small tip: If you have tabstop set, you can set softtabstop and shiftwidth to 0 and they will automatically act as if they are set to the same value as tabstop." - https://www.reddit.com/r/vim/comments/4ozqm9/why_is_vim_doing_4_spaces_for_tabs_even_though_i/d4hdoi2
" Trent: this didn't actually work, i think some .py file overrides these...

" customtabsize's state informs the function what state you are currently in
" if the default settings change, then this variable would need to be changed too
" try this... :let g:customtabsize = 1
" allow toggle between 2/4 spaces.
function TabToggle()
  " 1/0 evaluate true/false respectively
  if g:customtabsize
    :set tabstop=2
    :set softtabstop=2
    :set shiftwidth=2
    :let g:customtabsize=0
  else
    :set tabstop=4
    :set softtabstop=4
    :set shiftwidth=4
    :let g:customtabsize=1
  endif
endfunction
" TabToggle dumps you at the top of the document so you need to mark your
" place... set scrolloff=5 or higher to have a better time finding the cursor
":nmap <F3> mx:execute TabToggle()<cr>'xzz
:nmap <F3> :call TabToggle()<CR>

" for some reason py files still open in 4-spaces mode... toggle <F3> twice to
" get into 2-spaces mode... ugly hack until i can update whatever magic
:let g:customtabsize=1
:call TabToggle()

":autocmd FileType py setlocal shiftwidth=4 tabstop=4 softtabstop=4
"

" Maintain undo history between sessions
:set undofile
" this directory must exist or you won't get undos.  Consider generating this
" in your dotfiles
:set undodir=~/.vim/undodir
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
:au BufRead,BufNewFile *.lic set filetype=ruby

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
