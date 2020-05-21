" My .vimrc file. To locate in ~/.vimrc and to be used with the HUGE version
" of Vim. Remember that you need to install Vundle, before installing the
" plugins, which you do with:    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

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
Plugin 'tpope/vim-repeat'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'tomasiser/vim-code-dark'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'vimwiki/vimwiki'
Plugin 'preservim/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'mechatroner/rainbow_csv'
"Plugin 'kien/ctrlp.vim'
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

" emulate Visual Studio Code colorscheme
" Removed from now because I've switched to using the function
" AutomaticColorscheme
"colorscheme codedark
"
" Here starts my vimwiki configuration
" vimwiki configuration (may clash with Vundle configuration)
set nocompatible
filetype plugin on
syntax on
" The following is so that vimwiki doesn't take over Tab in insert mode
let g:vimwiki_table_mappings = 0
" This is so that my vimwiki is hosted in the repos folder
let g:vimwiki_list = [{'path': '~/repos/wiki', 
            \ 'path_html':'~/wiki_html', 
            \ 'syntax':'default', 
            \ 'template_path':'~/repos/wiki/setup',
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
" Make blackwhite the default colorscheme for vimwiki
" Removed from now because I'm testing the function AutomaticColorscheme
" autocmd FileType vimwiki colorscheme blackwhite
" Load the html of the current file in firefox (h for html)
function! OpenThisHTML()
    let path_to_html_folder = expand(g:vimwiki_list[0]['path_html']) . '/'
    let full_path_to_wiki_file = expand('%:p')
    let note_name_with_wiki_extension = split(full_path_to_wiki_file, '/wiki/')[-1]
    let note_name = split(note_name_with_wiki_extension, '\.wiki')[0]
    " The quotes around make sure that firefox receives the full path instead
    " of just the path up to the first parenthesis
    let full_path_to_html_file = "'" . path_to_html_folder . note_name . ".html'"
    "The & at the end guarantees that firefox is executed in the background,
    "so Vim goes back to editing instead of hanging while Firefox is open
    execute "!firefox -new-window" full_path_to_html_file "&"  
endfunction
nmap ,h :call OpenThisHTML()<CR><CR>
" Process images so that they use less space, and map keybinding to <C-c> (c
" for compress)
function! ProcessImages()
    let path_to_wiki = expand(g:vimwiki_list[0]['path'])
    let path_to_setup_folder = path_to_wiki . '/setup/'
    execute '!cd' path_to_setup_folder '; python3 process_images.py'
endfunction     
" Apparently <C-i> is mapped by default to a function that goes to the next
" Vimwiki link, which could be quite useful
"nmap <Leader>wn <Plug>VimwikiNextLink
nmap <C-c> :call ProcessImages()<CR>
" This allows bulletpoints to be continued even at deeper bulletpoint levels,
" instead of only at the first level.
setlocal formatoptions=ctnqro
setlocal comments+=n:*,n:#
" Given a note title surrounded by 6 equal signs in the wiki index, this
" creates a link, follows it and copies the title. Needs to use nmap and not
" nnoremap because otherwise <CR> doesn't create a link
"nmap <space><CR> k:/======<CR>:noh<CR>7lvt=h<CR>:w<CR>^f<space>t]vT[y<CR>ggi=<space><Esc>pa<space>=<CR><CR>
nmap <space><CR> k:/======<CR>:let @/=""<CR>7lvt=h<CR>:w<CR>^f<space>t]vT[y<CR>ggi=<space><Esc>pa<space>=<CR><CR>
" Keybindings for going to previous and next day's diary entries. 
" 1) First you have to freed <C-Left> and <C-Right> from Putty, which for some reason holds
" them hostage. You can find which sequence corresponds to <C-Left> (for
" instance), in this case by pressing the following combination in insert
" mode: <C-v><C-Left>. Note that <Esc> is represented by ^[ when you do this.
map  <Esc>Od <C-Left>
map! <Esc>Od <C-Left>
map  <Esc>Oc <C-Right>
map! <Esc>Oc <C-Right>
map  <Esc>Oa <C-Up> 
map! <Esc>Oa <C-Up> 
map  <Esc>Ob <C-Down> 
map! <Esc>Ob <C-Down> 

" 2) Second, you don't use VimwikiDiaryPrevDay and VimwikiDiaryNextDay
" directly, because they leave saved buffers opened lingering around.
" Therefore, write a function that, if unsaved changes, uses these functions
" in order to leave the buffers open, and if all saved, uses these functions
" and then closes the buffer
function! GoToPreviousDay()
    let is_modified = &mod
    VimwikiDiaryPrevDay
    if is_modified == 0
        bd#
    endif
endfunction

function! GoToNextDay()
    let is_modified = &mod
    VimwikiDiaryNextDay
    if is_modified == 0
        bd#
    endif
endfunction
" 3) Map the previous functions
nmap <C-Left> :call GoToPreviousDay()<CR>
nmap <C-Right> :call GoToNextDay()<CR>

" Also, create a mapping for creating tomorrow's note, in case you need to
" create it in advance. Note that it makes sense to create it like this,
" because the <leader> prefix is for opening files. First you need to remap
" VimwikiTabMakeDiaryNote, which is hogging <leader>w<leader>t
nmap <leader>w<leader>x <Plug>VimwikiTabMakeDiaryNote
nmap <leader>w<leader>t <Plug>VimwikiMakeTomorrowDiaryNote
" Notice that <leader>w<leader>y creates yesterday's note if that wasn't
" already created

" Make function to change Anki (Latex) to Vimwiki. Note that the e flag mutes
" error signs when the pattern is not found
function! Wikify()
    %s/\[latex\]//ge
    %s/\[\/latex\]//ge
    %s/\\verb//ge
    %s/|/`/ge
    %s/\\item{/- /ge
    " %s/\\\\//ge Removed this because in maths environments the \\ sometimes
    " has meaning and is needed
    %s/``/"/ge
    %s/\\begin{itemize}//ge
    %s/\\end{itemize}//ge
    %s/\\item/- /ge
    %s/\\begin{verbatim}/{{{>/ge
    %s/\\end{verbatim}/}}}/ge
    %s#\\underline{\(.*\)}#<u>\1</u>#ge
    %s#\\textbf{\(.*\)}#<b>\1</b>#ge
    %s#\\textit{\(.*\)}#<i>\1</i>#ge
endfunction
" Make fuction to open Vimwiki index (in order to open the index with a simple
" i3 keybinding)
function! LaunchVimwiki()
    let index_path = g:vimwiki_list[0]['path']
    execute "cd ". index_path
    execute "e " . "index.wiki"
endfunction
" This command is relevant to the Vimwiki configuration because it
" binds <BS> (backspace) to closing the buffer so that navigation in Vimwiki
" doesn't leave a trail of open buffers behind. But it will also work for
" non-Vimwiki files. The function CloseThisBuffer() ensures that if there is
" no open buffer, <BS> will close Vim
function! CloseThisBuffer()
    if bufname("%") == ""
        q
    else
        bd
    endif
endfunction
nmap <Leader>wb <Plug>VimwikiGoBackLink
nmap <BS> :call CloseThisBuffer()<CR>
" Keybindings for time tracking with ti. <leader>t stands for time commands
" Turn on with o
function! OnTi()
    let on_message = system('ti on $( date \+\%F ) --no-color')
    echo on_message
endfunction
nnoremap <silent> <leader>t<leader>o :call OnTi()<CR>
" Finish with f
function! FinishTi()
    let finish_message = system('ti fin --no-color')
    echo finish_message
endfunction
nnoremap <silent> <leader>t<leader>f :call FinishTi()<CR>
" Write log to current diary entry with w
function! GetDiaryTime()
    let title = getline('1')
    let diary_date = split(title, ' ')[1]
    let diary_date = substitute(diary_date, '\.', '-', 'g')
    let diary_date_log = system('ti log | grep ' . diary_date)
    if diary_date_log == ''
        let diary_date_log = '0 seconds'
    else
        let diary_date_log = split(diary_date_log, ' ')[4:]
        let diary_date_log = join(diary_date_log, ' ')
    endif
    return diary_date_log
endfunction
function! WriteTi()
    let diary_date_log = GetDiaryTime()
    execute "normal! ggo\<cr>\<cr>Time working:  " . diary_date_log . "\<cr>\<esc>"
endfunction
nnoremap <silent> <leader>t<leader>w :call WriteTi()<CR>
" Display the log of the time spent on the current diary entry's date, rather than writing it
function! LogTi()
    let diary_date_log = GetDiaryTime()
    echo diary_date_log
endfunction
nnoremap <silent> <leader>t<leader>l :call LogTi()<CR>
" Display ti status
function! StatusTi()
    let status_message = system('ti status --no-color')
    echo status_message
endfunction
nnoremap <silent> <leader>t<leader>s :call StatusTi()<CR>
" Make diary note with template, instead of empty diary note. Note that it is
" not so easy because if the note is already created then you don't want to
" insert the template. You only want to insert the template the first time you
" open the diary entry. Another option would be to do it manually when you
" first open the diary entry
"nmap <Leader>w<Leader>w VimwikiMakeDiaryNote<CR>idiary<Tab>
" Finally, note that <C-i> may be going from link to link
" Here ends my vimwiki configuration



" so that vim-cellmode sends code from the cell to the right pane
let g:cellmode_tmux_panenumber=1

" map keys to copying in system clipboard, so that you can search stuff for
" instance on Firefox. Note that in order for Vim to be able to copy to system
" clipboard, it must be compiled with the +clipboard. I usually use the binary
" vim-gtk, which can be installed with
" sudo apt install vim-gtk
vmap <C-y> "+y
map <C-p> "+p

" set incremental search
set incsearch

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
" highlight searches and change highlight color (the latter needs to be done
" with the command ColorScheme, so that Vim does it after loading the
" colorscheme and doesn't overwrite it)
set hlsearch
au ColorScheme * hi Search cterm=NONE ctermfg=white ctermbg=DarkRed
" IncSearch changes the color for the current match in search and replace with
" confirmation. That way you can distinguish the one you're currently looking
" at from all the others
au ColorScheme * hi IncSearch cterm=NONE ctermfg=white ctermbg=DarkGreen
" Noh to avoid highlighting upon sourcing .vimrc
noh
" remap :noh to <C-n> in normal model. :noh stops highlighting until next
" search
nmap <C-n> :noh<CR>
" This (supposedly) will make that highlight stays on after a search, but not after a
" string substitution
augroup search_be_gone
  autocmd!
  autocmd CmdlineEnter : let s:prev_hlsearch = v:hlsearch
  autocmd CmdlineLeave : if v:hlsearch && !s:prev_hlsearch | call feedkeys(":nohlsearch\<cr>") | endif
augroup END

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
set statusline+=(%c)\ \       "column number
set statusline+=%l/%L         "cursor line/total lines
set statusline+=\ \ %P          "percent through file
set laststatus=2              " Show statusline for all windows.

" My very simple script and keybinding to iterate over colorschemes upon
" pressing F12
let g:iterable_colorschemes=['codedark', 'morning', 'blackwhite']
let g:current_colorscheme_idx = 0

function! IterateColorscheme()
    let n_colorschemes = len(g:iterable_colorschemes)
    let g:current_colorscheme_idx = ( g:current_colorscheme_idx + 1 ) % n_colorschemes
    let current_colorscheme = g:iterable_colorschemes[g:current_colorscheme_idx]
    execute "colorscheme" current_colorscheme
endfunction

nmap <F12> :call IterateColorscheme()<CR>
imap <F12> <Esc>:call IterateColorscheme()<CR>li


" Vim isn't able to change the cursor color by itself in a colorscheme: 
" this is something that belongs to urxvt. So a little bit of wizardry is needed
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a gray cursor otherwise
  let &t_EI = "\<Esc>]12;gray\x7"
  silent !echo -ne "\033]12;gray\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

" NERDTree keybindings
nmap <F10> :NERDTree<CR>
imap <F10> <Esc>:NERDTree<CR>i
" When a file is selected, NERDTree quits instead of haning around and taking
" screen space
let g:NERDTreeQuitOnOpen = 1
" If NERDTree is the last and only buffer, then Vim quits
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Netrw keybindings similar to NERDTree
" This hides the annoying netrw banner
let g:netrw_banner = 0
" This makes the listing style tree-like
let g:netrw_liststyle = 3
" This opens the file in the main (previous) Vim window rather than in the
" netrw window
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
" This makes the netrw window size only a quarter of the screen's width
"let g:netrw_winsize = 25
" The following makes Netrw be a constant addition to the left margin
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
"

" Keybindings for buffers. The first one lists the buffers and waits for input
" to choose one (l for ls). The second one goes to the next buffer (n for next). The third one goes to
" the previous buffer (b for before). The fourth one goes to the opposite
" buffer (h for hash)
nnoremap ,l :ls<CR>:b
nnoremap ,n :bn<CR>
nnoremap ,b :bp<CR>
nnoremap ,m :b#<CR>

" The following keybindings quickly open .vimrc (and load it), my wiki index
" and i3 config file
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>i :call LaunchVimwiki()<CR>
nnoremap <leader>c :e ~/repos/dotfiles/config<CR>
nnoremap <leader>b :e ~/repos/dotfiles/dot.bashrc<CR>

"python with virtualenv support TODO Check if you see any difference
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(open(activate_this).read(), dict(__file__=activate_this))
EOF

" CtrlP configuration
let g:ctrlp_map = '<leader>l'
let g:ctrlp_cmd = 'CtrlP'

" Keep the window margin 3 lines away from the cursor
set scrolloff=3

" The Redir command allows you to redirect the output of every command to a
" scratch window. For instance, to redirect all the lines that contain
" 'pattern', do     :Redir g/pattern
" Or to redirect the out put of ls, do     :Redir !ls
" Obtained from https://gist.github.com/romainl/eae0a260ab9c135390c30cd370c20cd7
function! Redir(cmd, rng, start, end)
	for win in range(1, winnr('$'))
		if getwinvar(win, 'scratch')
			execute win . 'windo close'
		endif
	endfor
	if a:cmd =~ '^!'
		let cmd = a:cmd =~' %'
			\ ? matchstr(substitute(a:cmd, ' %', ' ' . expand('%:p'), ''), '^!\zs.*')
			\ : matchstr(a:cmd, '^!\zs.*')
		if a:rng == 0
			let output = systemlist(cmd)
		else
			let joined_lines = join(getline(a:start, a:end), '\n')
			let cleaned_lines = substitute(shellescape(joined_lines), "'\\\\''", "\\\\'", 'g')
			let output = systemlist(cmd . " <<< $" . cleaned_lines)
		endif
	else
		redir => output
		execute a:cmd
		redir END
		let output = split(output, "\n")
	endif
	vnew
	let w:scratch = 1
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
	call setline(1, output)
endfunction
command! -nargs=1 -complete=command -bar -range Redir silent call Redir(<q-args>, <range>, <line1>, <line2>)

" Change colorscheme based on active buffer
" TODO Instead of comparing with 'wiki' explicitly, create a dictionary where
" you associate each extension to their desired colorscheme, and loop over
" the dictionaries to set the colorscheme, one extension at a time
function! AutomaticColorscheme()
    colorscheme codedark
    let extension = expand('%:e')
    if extension == 'wiki'
        colorscheme blackwhite
    endif 
    set hlsearch
    hi Search cterm=NONE ctermfg=white ctermbg=DarkRed
    hi IncSearch cterm=NONE ctermfg=white ctermbg=DarkGreen
endfunction
autocmd BufEnter * :call AutomaticColorscheme()

" Map Y to y$ so that C, D and Y behave in the same way
nnoremap <S-y> y$

" Remap : to <space> for easier typing
nnoremap <space> :
vnoremap <space> :

" Function to be able to see the changes between the current buffer and its
" saved version in the filesystem. It can be launched with :DiffSaved
" Copied from https://stackoverflow.com/questions/749297/can-i-see-changes-before-i-save-my-file-in-vim
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Make <C-a> go to the beginning of the Vim command line, like in the shell
" Note that the usual <C-e> to go to the end already works by default
cnoremap <C-a> <C-b>

" Make <C-a> and <C-e> in insert mode behave like in the command line, going
" to the beginning and end of the line respectively
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Make mapping so that :q actually means :qa when in diff mode (i.e. when
" using vimdiff
"cnoremap <expr> q<CR> &diff ? 'qa<CR>' : 'q<CR>'
"

" Make mapping so that Shift-Arrow increase and reduce the window size in normal
" mode. As with the Vimwiki diary mappings for <C-Arrow>, first you need to
" freed <S-Arrow> and then map them.
map [a <S-Up>
map! [a <S-Up>
map [b <S-Down>
map! [b <S-Down>
map [d <S-Left>
map! [d <S-Left>
map [c <S-Right>
map! [c <S-Right>

nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-
nnoremap <S-Left> <C-w><
nnoremap <S-Right> <C-w>>

" Make mapping so that  <C-w>_ and <C-w>| create horizontal and vertical
" splits respectively
nnoremap <C-w>_ :Hex<CR><C-w>=
nnoremap <C-w><Bar> :Vex<CR><C-w>=

" Useful text objects by romainl (there are more at https://gist.github.com/romainl/c0a8b57a36aec71a986f1120e1931f20)
" 24 simple text objects
" ----------------------
" i_ i. i: i, i; i| i/ i\ i* i+ i- i# i=
" a_ a. a: a, a; a| a/ a\ a* a+ a- a# a=
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '-', '#' , '=']
	execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
	execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
	execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
	execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor
" line text objects
" -----------------
" il al
xnoremap il g_o^
onoremap il :<C-u>normal vil<CR>
xnoremap al $o0
onoremap al :<C-u>normal val<CR>
" number text object (integer and float)
" --------------------------------------
" in
function! VisualNumber()
	call search('\d\([^0-9\.]\|$\)', 'cW')
	normal v
	call search('\(^\|[^0-9\.]\d\)', 'becW')
endfunction
xnoremap in :<C-u>call VisualNumber()<CR>
onoremap in :<C-u>normal vin<CR>

" <S-j> and <S-k> add blank lines below and above respectively
nnoremap <silent><S-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><S-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Add mappings to make (save) current session and load it. Three <leader> to avoid doing
" it by mistake
nnoremap <leader><leader><leader>m :mksession! ~/.vim/saved_session<CR>
nnoremap <leader><leader><leader>l :source ~/.vim/saved_session<CR>

" Useful commands to view and navigate table (csv or tsv) files
" - <C-h> and <C-l> scroll half a page laterally, similarly to <C-d> and <C-u>
" - For consistency, set <C-j> and <C-k> to scroll up and down too. This is
"   probably more ergonomic as well
" - ,t activates view of the current buffer as  a table (remember that ,
"   commands usually do something related to the current buffer)
set nostartofline
nnoremap <C-h> zH
nnoremap <C-l> zL
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
function! ViewTable()
    set nowrap
    set nowrite
    RainbowAlign
endfunction
nnoremap ,t :call ViewTable()<CR>
