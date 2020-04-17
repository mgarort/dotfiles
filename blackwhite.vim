" This colorscheme is a modification of the 'pgdouyon/vim-yin-yang'
" colorscheme. To be placed on ~/.vim/colors/blackwhite.vim

highlight clear

let g:colors_name = "blackwhite"


let s:palette = {}

let s:palette.white =  [255, '#f7f7f7']
let s:palette.gray15 = [253, '#e4e4e4'] "Left vertical bar (for line numbers)
let s:palette.gray14 = [250, '#bcbcbc'] "Not obvious, and also ToDos
let s:palette.gray13 = [243, '#767676'] "Line numbers and background of statusline
let s:palette.gray12 = [233, '#0d0d0d'] "Not obvious
let s:palette.gray11 = [233, '#0d0d0d'] "Not obvious
let s:palette.gray10 = [233, '#0d0d0d'] "1st and 2nd level headers
let s:palette.gray09 = [233, '#0d0d0d'] "Not obvious
let s:palette.gray08 = [233, '#0d0d0d'] "3rd to 6th level headers
let s:palette.gray07 = [233, '#0d0d0d'] "Not obvious
let s:palette.gray06 = [233, '#0d0d0d'] "Horizontal bars (---------)
let s:palette.gray05 = [233, '#0d0d0d'] "Text, = signs in headers and commands
let s:palette.gray04 = [233, '#0d0d0d'] "Not obvious
let s:palette.gray03 = [233, '#0d0d0d'] "Underscores in Latex maths environment
let s:palette.gray02 = [233, '#0d0d0d'] "Not obvious
let s:palette.gray01 = [233, '#0d0d0d'] "CursorLine, which is an option to highlight the line where the cursor is, and is set with :set cursorline
let  s:palette.black = [233, '#000000']

let s:palette.purple = [98, '#875fd7']
let s:palette.brown = [130, '#af5f00']
let s:palette.blue = [67, '#5f87af']
let s:palette.darkblue = [27, '#005fff']
let s:palette.green = [65, '#5f875f']
let s:palette.red = [88, '#870000']
let s:palette.magenta = [125, '#af005f']
let s:palette.darkred = [124, '#af0000']
let s:palette.darkgreen = [22, '#005f00']

if has("nvim")
    let g:terminal_color_0 = s:palette.gray01[1]
    let g:terminal_color_1 = s:palette.gray06[1]
    let g:terminal_color_2 = s:palette.gray03[1]
    let g:terminal_color_3 = s:palette.gray11[1]
    let g:terminal_color_4 = s:palette.gray02[1]
    let g:terminal_color_5 = s:palette.gray08[1]
    let g:terminal_color_6 = s:palette.gray09[1]
    let g:terminal_color_7 = s:palette.gray13[1]
    let g:terminal_color_8 = s:palette.gray03[1]
    let g:terminal_color_9 = s:palette.gray10[1]
    let g:terminal_color_10 = s:palette.gray07[1]
    let g:terminal_color_11 = s:palette.gray13[1]
    let g:terminal_color_12 = s:palette.gray05[1]
    let g:terminal_color_13 = s:palette.gray12[1]
    let g:terminal_color_14 = s:palette.gray14[1]
    let g:terminal_color_15 = s:palette.white[1]
elseif has("terminal")
    let g:terminal_ansi_colors = [
                \ s:palette.gray01[1],
                \ s:palette.gray06[1],
                \ s:palette.gray03[1],
                \ s:palette.gray11[1],
                \ s:palette.gray02[1],
                \ s:palette.gray08[1],
                \ s:palette.gray09[1],
                \ s:palette.gray13[1],
                \ s:palette.gray03[1],
                \ s:palette.gray10[1],
                \ s:palette.gray07[1],
                \ s:palette.gray13[1],
                \ s:palette.gray05[1],
                \ s:palette.gray12[1],
                \ s:palette.gray14[1],
                \ s:palette.white[1]
                \ ]
endif

function! s:hi(group, fg_color, bg_color, style)
    let highlight_command = ['hi', a:group]
    if !empty(a:fg_color)
        let [ctermfg, guifg] = a:fg_color
        call add(highlight_command, printf('ctermfg=%d guifg=%s', ctermfg, guifg))
    endif
    if !empty(a:bg_color)
        let [ctermbg, guibg] = a:bg_color
        call add(highlight_command, printf('ctermbg=%d guibg=%s', ctermbg, guibg))
    endif
    if !empty(a:style)
        call add(highlight_command, printf('cterm=%s gui=%s', a:style, a:style))
    endif
    execute join(highlight_command, ' ')
endfunction


call s:hi('Normal', s:palette.gray05, s:palette.white, '')
set background=light

call s:hi('Constant', s:palette.gray11, [], 'bold')
call s:hi('String', s:palette.gray08, [], '')
call s:hi('Number', s:palette.gray10, [], '')

call s:hi('Identifier', s:palette.gray06, [], 'none')
call s:hi('Function', s:palette.gray06, [], '')

call s:hi('Statement', s:palette.gray08, [], 'bold')
call s:hi('Operator', s:palette.gray03, [], 'none')
call s:hi('Keyword', s:palette.gray10, [], '')

call s:hi('PreProc', s:palette.gray10, [], 'none')

call s:hi('Type', s:palette.gray09, [], 'bold')

call s:hi('Special', s:palette.gray10, [], '')
call s:hi('SpecialComment', s:palette.gray12, [], 'bold')

call s:hi('Title', s:palette.gray10, [], 'bold')
call s:hi('Todo', s:palette.red, s:palette.gray14, '')
if has("nvim") || has("gui_running")
    call s:hi('Comment', s:palette.gray12, [], 'italic')
else
    call s:hi('Comment', s:palette.gray12, [], '')
endif

call s:hi('LineNr', s:palette.gray13, s:palette.gray15, 'none')
call s:hi('FoldColumn', s:palette.gray08, s:palette.gray15, 'none')
call s:hi('CursorLine', [], s:palette.gray01, 'none')
call s:hi('CursorLineNr', s:palette.gray06, s:palette.gray15, 'none')

call s:hi('Visual', s:palette.white, s:palette.gray06, '')
call s:hi('Search', s:palette.gray15, s:palette.darkred, 'none')
call s:hi('IncSearch', s:palette.white, s:palette.darkgreen, 'bold')

call s:hi('SpellBad', s:palette.red, s:palette.white, 'undercurl')
call s:hi('SpellCap', s:palette.red, s:palette.white, 'undercurl')
call s:hi('SpellLocal', s:palette.red, s:palette.white, 'undercurl')
call s:hi('SpellRare', s:palette.brown, s:palette.white, 'undercurl')

call s:hi('Error', s:palette.red, s:palette.white, 'bold')
call s:hi('ErrorMsg', s:palette.red, s:palette.white, '')
call s:hi('WarningMsg', s:palette.brown, s:palette.white, '')
call s:hi('ModeMsg', s:palette.gray10, [], '')
call s:hi('MoreMsg', s:palette.gray10, [], '')

call s:hi('MatchParen', s:palette.magenta, s:palette.white, '')

call s:hi('Cursor', [], s:palette.gray12, '')
call s:hi('Underlined', s:palette.gray08, [], 'underline')
call s:hi('SpecialKey', s:palette.gray13, [], '')
call s:hi('NonText', s:palette.gray13, [], '')
call s:hi('Directory', s:palette.gray08, [], '')

call s:hi('Pmenu', s:palette.gray05, s:palette.gray14, 'none')
call s:hi('PmenuSbar', s:palette.white, s:palette.gray01, 'none')
call s:hi('PmenuSel', s:palette.gray14, s:palette.gray05, '')
call s:hi('PmenuThumb', s:palette.gray14, s:palette.gray03, 'none')

call s:hi('StatusLine', s:palette.gray01, s:palette.gray14, 'none')
call s:hi('StatusLineNC', s:palette.gray13, s:palette.gray15, 'none')
call s:hi('WildMenu', s:palette.gray08, [], '')
call s:hi('VertSplit', s:palette.gray13, s:palette.gray13, 'none')

call s:hi('DiffAdd', s:palette.white, s:palette.green, '')
call s:hi('DiffChange', s:palette.white, s:palette.blue, '')
call s:hi('DiffDelete', s:palette.white, s:palette.red, '')
call s:hi('DiffText', s:palette.white, s:palette.darkblue, '')
call s:hi('DiffAdded', s:palette.green, s:palette.white, '')
call s:hi('DiffChanged', s:palette.blue, s:palette.white, '')
call s:hi('DiffRemoved', s:palette.red, s:palette.white, '')


highlight! link Character Constant
highlight! link Float Number
highlight! link Boolean Number

highlight! link SignColumn FoldColumn
highlight! link ColorColumn FoldColumn
highlight! link CursorColumn CursorLine

highlight! link Folded LineNr
highlight! link Conceal Normal
highlight! link ErrorMsg Error

highlight! link Conditional Statement
highlight! link Repeat Statement
highlight! link Label Statement
highlight! link Exception Statement

highlight! link Include PreProc
highlight! link Define PreProc
highlight! link Macro PreProc
highlight! link PreCondit PreProc

highlight! link StorageClass Type
highlight! link Structure Type
highlight! link Typedef Type

highlight! link SpecialChar Special
highlight! link Tag Special
highlight! link Delimiter Special
highlight! link Debug Special
highlight! link Question Special

highlight! link VisualNOS Visual
highlight! link TabLine StatusLineNC
highlight! link TabLineFill StatusLineNC
highlight! link TabLineSel StatusLine


