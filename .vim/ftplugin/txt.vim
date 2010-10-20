" txtbrowser.vim:	Utilities to browser plain text file.
" Release:		1.2.5
" Maintainer:		ypguo<guoyoooping@163.com>
" Last modified:	2010.03.28
" License:		GPL

" Line continuation used here
let s:cpo_save = &cpo
set cpo&vim

if exists("s:TBrowser_Config")
	"only load this file once.
	finish 
endif

" ****************** Options *******************************************
"How many title level to support, default is 3.
if !exists('TxtBrowser_Title_Level')
	let TxtBrowser_Title_Level = 3
endif

" ****************** You can configure your own tag format here. ********
let s:TBrowser_Config = ' '
let s:TBrowser_Config .= '--langdef=txt '
let s:TBrowser_Config .= '--langmap=txt:.txt '

let s:TBrowser_Config .= '--regex-txt="/^([0-9]+\.?[ \t]+)(.+$)/\1\2/c,content/" '
if (TxtBrowser_Title_Level >= 2)
	let s:TBrowser_Config .= '--regex-txt="/^(([0-9]+\.){1}([0-9]+\.?)[ \t]+)(.+$)/.   \1\4/c,content/" '
endif
if (TxtBrowser_Title_Level >= 3)
	let s:TBrowser_Config .= '--regex-txt="/^(([0-9]+\.){2}([0-9]+\.?)[ \t]+)(.+$)/.       \1\4/c,content/" '
endif
if (TxtBrowser_Title_Level >= 4)
	let s:TBrowser_Config .= '--regex-txt="/^(([0-9]+\.){3}([0-9]+\.?)[ \t]+)(.+$)/.           \1\4/c,content/" '
endif

let s:TBrowser_Config .= '--regex-txt="/^[ \t]+(figure[ \t]+[0-9a-zA-Z]+([.: ]([ \t]*.+)?)?$)/\1/f,figures/i" '
let s:TBrowser_Config .= '--regex-txt="/^[ \t]+(table[ \t]+[0-9a-zA-Z]+([.: ]([ \t]*.+)?)?$)/\1/t,tables/i" '

if exists('Tlist_Enc_Patch')
	let s:TBrowser_Config .= '--regex-txt="/^[ \t]*(图[ \t]*[0-9a-zA-Z]+[.: ][ \t]*.+$)/\1/f,figures/i" '
	let s:TBrowser_Config .= '--regex-txt="/^[ \t]*(表[ \t]*[0-9a-zA-Z]+[.: ][ \t]*.+$)/\1/t,tables/i" '
endif


" ****************** Do not modify after this line ************************
let tlist_txt_settings = 'txt;c:content;f:figures;t:tables'

if (filereadable($HOME . '/.ctags'))
	echohl WarningMsg
	echo '[Warning]Please delete the old install: "' $HOME . '/.ctags", or your title tag will be listed twice, sorry for inconvience. '
	echohl None
endif

if exists('Tlist_Ctags_Cmd')
	let Tlist_Ctags_Cmd = Tlist_Ctags_Cmd . s:TBrowser_Config
endif

" restore 'cpo'
let &cpo = s:cpo_save
unlet s:cpo_save

