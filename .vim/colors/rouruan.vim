" Maintainer:	Lars H. Nielsen (dengmao@gmail.com)
" Last Change:	January 22 2007

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "wombat"


" Vim >= 7.0 specific colors
if version >= 700
highlight CursorLine guibg=#2d2d2d ctermbg=236 cterm=none
highlight CursorColumn guibg=#2d2d2d ctermbg=236
highlight MatchParen ctermbg=101 cterm=bold guibg=#857b6f gui=bold ctermfg=255 guifg=#f6f3e8
highlight Pmenu guibg=#444444 ctermbg=238 guifg=#f6f3e8 ctermfg=255
highlight PmenuSel guibg=#cae682 ctermbg=150 guifg=#000000 ctermfg=16
endif

" General colors
highlight Cursor guibg=#656565 gui=none ctermbg=241 cterm=none guifg=none
highlight Normal ctermbg=235 cterm=none guibg=#242424 gui=none ctermfg=255 guifg=#f6f3e8
highlight NonText ctermbg=236 cterm=none guibg=#303030 gui=none ctermfg=244 guifg=#808080
highlight LineNr ctermbg=16 cterm=none guibg=#000000 gui=none ctermfg=101 guifg=#857b6f
highlight StatusLine guibg=#444444 gui=italic ctermbg=238 guifg=#f6f3e8 ctermfg=255
highlight StatusLineNC ctermbg=238 cterm=none guibg=#444444 gui=none ctermfg=101 guifg=#857b6f
highlight VertSplit ctermbg=238 cterm=none guibg=#444444 gui=none ctermfg=238 guifg=#444444
highlight Folded ctermbg=238 cterm=none guibg=#384048 gui=none ctermfg=103 guifg=#a0a8b0
highlight Title guibg=none gui=bold cterm=bold guifg=#f6f3e8 ctermfg=255
highlight Visual ctermbg=238 cterm=none guibg=#444444 gui=none ctermfg=255 guifg=#f6f3e8
highlight SpecialKey ctermbg=236 cterm=none guibg=#343434 gui=none ctermfg=244 guifg=#808080

" Syntax highlighting
highlight Comment gui=italic guifg=#99968b ctermfg=246
highlight Todo gui=italic guifg=#8f8f8f ctermfg=245
highlight Constant gui=none cterm=none guifg=#e5786d ctermfg=167
highlight String gui=italic guifg=#95e454 ctermfg=113
highlight Identifier gui=none cterm=none guifg=#cae682 ctermfg=150
highlight Function gui=none cterm=none guifg=#cae682 ctermfg=150
highlight Type gui=none cterm=none guifg=#cae682 ctermfg=150
highlight Statement gui=none cterm=none guifg=#8ac6f2 ctermfg=117
highlight Keyword gui=none cterm=none guifg=#8ac6f2 ctermfg=117
highlight PreProc gui=none cterm=none guifg=#e5786d ctermfg=167
highlight Number gui=none cterm=none guifg=#e5786d ctermfg=167
highlight Special gui=none cterm=none guifg=#e7f6da ctermfg=194


