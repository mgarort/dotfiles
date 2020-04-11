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
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'tomasiser/vim-code-dark'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'vimwiki/vimwiki'
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

" Here starts my vimwiki configuration
" vimwiki configuration (may clash with Vundle configuration)
set nocompatible
filetype plugin on
syntax on
"vimwiki configuration so it doesn't conflict with UltiSnips <tab>
nmap <leader><space> <Plug>VimwikiNextLink
nmap <leader>. <Plug>VimwikiPrevLink
" Conflict with the tab in source code: https://github.com/vimwiki/vimwiki/issues/357
let g:vimwiki_table_mappings = 0
" This is so that my vimwiki is hosted in the repos folder
let g:vimwiki_list = [{'path': '~/repos/vimwiki', 
            \ 'path_html':'~/vimwiki_html', 
            \ 'syntax':'default', 
            \ 'template_path':'~/repos/vimwiki',
            \ 'ext':'.wiki',
            \ 'template_default': 'default',
            \ 'template_ext': '.tpl'}]
" The next is so that I can use markdown syntax instead of the original
" vimwiki syntax
"let g:vimwiki_list = [{'path': '~/vimwiki',
"  \ 'syntax': 'markdown', 'ext': '.md'}]
" The next is so that Python and C++ blocks are highlighted
"let wiki = {}
"let wiki.path = '~/my_wiki/'
"let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
" The following is so that I can have multiline list/itemize items
let g:vimwiki_list_ignore_newline = 0
" The following prevents vimwiki to automatically write buffers upon exit
let g:vimwiki_autowriteall = 0
" Recompile HTML upon writing buffer to disk
autocmd FileType vimwiki autocmd BufWritePost <buffer> silent Vimwiki2HTML
" Load the html of the current file in firefox (h for html)
function! OpenThisHTML()
    let path_to_html_folder = expand(g:vimwiki_list[0]['path_html'])
    let html_file = expand('%:t:r') . ".html"
    " The quotes around make sure that firefox receives the full path instead
    " of just the path up to the first parenthesis
    let full_path = "'" . path_to_html_folder . "/" . html_file . "'" 
    execute "!firefox" full_path
endfunction
" nmap <C-h> :!firefox '%:p:h'/../vimwiki_html/'%:t:r'.html<CR><CR>
" imap <C-h> <Esc>:!firefox '%:p:h'/../vimwiki_html/'%:t:r'.html<CR><CR>
nmap <C-h> :call OpenThisHTML()<CR><CR>
imap <C-h> <Esc>:call OpenThisHTML()<CR><CR>
" This allows bulletpoints to be continued even at deeper bulletpoint levels,
" instead of only at the first level.
setlocal formatoptions=ctnqro
setlocal comments+=n:*,n:#
" Here ends my vimwiki configuration

" so that vim-cellmode sends code from the cell to the right pane
let g:cellmode_tmux_panenumber=1

" map keys to copying in system clipboard, so that you can search stuff for
" instance on Firefox. Note that in order for Vim to be able to copy to system
" clipboard, it must be compiled with the +clipboard. I usually use the binary
" vim-gtk, which can be installed with
" sudo apt install vim-gtk
vmap <C-Y> "+y
map <C-P> "+p

" vim-cellmode mappings
" start ipython shell with <C-s>. Note that for this to work, you need to add stty -ixon to .bashrc
nmap <C-s> :call StartPyShell()<CR>
" run current cell, and leave cursor in current cell
imap <C-g> <Esc>:call RunTmuxPythonCell(1)<CR>  
" run current cell, and take cursor outside of current cell. Note that <C-b>
" won't work in a default tmux installation, since <C-b> is the default prefix
imap <C-b> <C-\><C-o>:call RunTmuxPythonCell(0)<CR>

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

" This mouse behaviour is the closest to what I wanted. It only allows to
" sccroll and select cursor position with mouse in normal mode
set mouse=n 

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

" Set updatetime variable so that live views of tex pdfs get updated
" automatically (used by xuhdev/vim-latex-live-preview)
set updatetime=500

" Status line
set statusline=
set statusline +=[%n]\ \ \%*  "buffer number
set statusline+=%<%F          "full filepath
set statusline+=\ %m          "modified flag
set statusline+=%=            "left/right separator
set statusline+=%l/%L         "cursor line/total lines
set statusline+=\ %P          "percent through file
set laststatus=2              " Show statusline for all windows.

" My very simple script and keybinding to iterate over colorschemes upon
" pressing F12
let g:my_colorschemes=['codedark', 'morning']
let g:current_colorscheme_idx = 0

function! IterateColorscheme()
    let g:current_colorscheme_idx = ( g:current_colorscheme_idx + 1 ) % 2
    let current_colorscheme = g:my_colorschemes[g:current_colorscheme_idx]
    execute "colorscheme" current_colorscheme
endfunction

nmap <F12> :call IterateColorscheme()<CR>
imap <F12> <Esc>:call IterateColorscheme()<CR>i

