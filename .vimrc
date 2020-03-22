" My .vimrc file. To locate in ~/.vimrc

" VUNDLE CONFIGURATION

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Comment out YouCompleteMe if in a cluster where you cannot compile it
Plugin 'ycm-core/YouCompleteMe'
Plugin 'benmills/vimux'
Plugin 'greghor/vim-pyShell'
Plugin 'julienr/vim-cellmode'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim' 
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'tomasiser/vim-code-dark'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" MY OWN STUFF 

" so that vim-cellmode sends code from the cell to the right pane
let g:cellmode_tmux_panenumber=1
" map keys to copying in system clipboard, so that you can search stuff for
" instance on Firefox. Note that in order for Vim to be able to copy to system
" clipboard, it must be compiled with the +clipboard. I usually use the binary
" vim-gtk, which can be installed with
" sudo apt install vim-gtk
vmap <C-Y> "+y
map <C-P> "+p
" map the CtrlP (fuzzy filepath searching plugin) to <C-L>/<C-l> instead of the
" usual <C-P>/<C-p> so that there's no collision with the copying to clipboard
let g:ctrlp_map = '<C-L>'

" vim-cellmode mappings
" start ipython shell with <C-s>. Note that for this to work, you need to add stty -ixon to .bashrc
nmap <C-s> :call StartPyShell()<CR>
" run current cell, and leave cursor in current cell
imap <C-g> <Esc>:call RunTmuxPythonCell(1)<CR>  
" run current cell, and take cursor outside of current cell. Note that <C-b>
" won't work in a default tmux installation, since <C-b> is the default prefix
imap <C-b> <C-\><C-o>:call RunTmuxPythonCell(0)<CR>

" my unsuccessful attempts to map a keybinding to expand a cell snippet
" imap <C-#> ### <esc>:call UltiSnips#ExpandSnippet()<cr>
"imap <C-#> ###<Tab>
"nnoremap <C-#> i### <esc>:call UltiSnips#ExpandSnippet()<cr>
" inoremap <C-#> ###<Tab>=UltiSnips#ExpandSnippet()<cr>
" inoremap <C-#> ###<c-r>=UltiSnips#ExpandSnippet()<cr>


" avoid an annoying beeping sound. Instead, the ``beeping" will be a white
" flash
set visualbell
" emulate Visual Studio Code colorscheme
colorscheme codedark
" highlight searches and change highlight color (the latter needs to be done
" with the command ColorScheme, so that Vim does it after loading the
" colorscheme and doesn't overwrite it)
set hlsearch
au ColorScheme * hi Search cterm=NONE ctermfg=white ctermbg=DarkRed
" IncSearch changes the color for the current match in search and replace with
" confirmation. That way you can distinguish the one you're currently looking
" at from all the others
au ColorScheme * hi IncSearch cterm=NONE ctermfg=white ctermbg=DarkGreen
" remap :noh to <C-n> in normal model. :noh stops highlighting until next
" search
nmap <C-n> :noh<CR>
 
" This was supposedly to run python code directly from Vim, but I don't need
" that because I get to do it better with vim-PyShell
" nnoremap <buffer> <F9> :exec 'w !python' shellescape(@%, 1)<cr>
" Make sure that tabs are expanded to spaces. If you do this all the time
" consistently, you'll avoid errors of mixing tabs and spaces in the same
" python file
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" Minimize the number of types that Vim goes to a weird buffer type (bt) that
" doesn't allow you to write to files when editing over scp
autocmd BufRead scp://* :set bt=
autocmd BufWritePost scp://* :set bt=
"autocmd BufNewFile,BufRead *.py set keywordprg=pydoc
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
set completeopt-=preview  " avoid the annoying preview window, that shows the documentation of whatever function you are autocompleting, and then stays open

" These settings allow scrolling, but not repositioning of the cursor with the
" mouse. For repositioning of the cursor with the mouse too, set mouse=a
" map <ScrollWheelUp>   5<C-Y>
" map <ScrollWheelDown> 5<C-E>
set mouse=n " In the end it was this setting what was closest to what I wanted. It only allows to scroll and select cursor position with mouse in normal mode

set number                     " Show current line number
set relativenumber             " Show relative line numbers
set backspace=indent,eol,start " To make sure that backspace works in every system
syntax on                      " to make sure that syntax is highlighted in every system

" Avoid mouse setting cursor
" noremap <LeftMouse> ma<LeftMouse>`a   
augroup NO_CURSOR_MOVE_ON_FOCUS
  au!
  au FocusLost * let g:oldmouse=&mouse | set mouse=
  au FocusGained * if exists('g:oldmouse') | let &mouse=g:oldmouse | unlet g:oldmouse | endif
augroup END

" Look for tags file (from ctags) in upper directories recursively
set tags=./tags;/

" Allow to open other buffers when current file is unsaved
set hidden

" Make file completion in command mode (e.g. when opening a file in a buffer
" with :e) more similar to Bash completion
set wildmenu
set wildmode=longest,list
