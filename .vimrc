
" 基本选项
" ==============================================================

" 启用VIM的功能
set nocompatible                " 启用VIM的模式（默认为VI模式，灰常不和谐）
set backspace=eol,start,indent  " 增强型 BackSpace 按键(去掉行尾/行首/TAB空白)
set nobackup                    " 不备份修改的文件
let mapleader=","

" 界面
syntax on                       " 打开语法高亮
set scrolloff=5                 " 总是让最下方至少显示5行
set ruler                       " 总是显示光标状态栏
set nu                          " 显示行号
"set cursorline                 " 醒目显示当前行
colorscheme koehler               " 这个主题比较不错
" 状态栏相关的设置
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2                " 总是显示状态栏
set list
set listchars=tab:>-,trail:-

" 设置编辑器的一些默认参数
set nowrap
"set linebreak                   " 整词换行（对中文支持不好）
set whichwrap=b,s,<,>,[,]       " 光标从行首和行末时可以跳到另一行去
set hidden                      " 没有保存的缓冲区可以自动被隐藏
set fileencodings=utf-8,chinese,gb18030,cp936,usc-bom

" 查找功能（按/键开始查找)
set ignorecase                  " 不区分大小写
set smartcase                   " 自动区分关键字的大小写
set incsearch                   " 即输即查（灰常强大、和谐的功能）
set gdefault                    " 替换时所有的行内匹配都被替换，而不是只有第一个
set hlsearch                    " 高亮显示搜索结果

" Suffixes 用于降低特定后缀的tab补齐优先级
" 以下这些后缀的文件，是正常人不必去编辑的
set suffixes+=.bak,~,.swp,.o,.info,.aux,.log,.dvi
set suffixes+=.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc


" 设置TAB键的长度
"set smarttab                    " 只在行首使用tab
set expandtab                   " 使用空格代替tab
set tabstop=4                   " 设置tab键的宽度
set shiftwidth=4                " 换行时行间交错使用4个空格
set softtabstop=4

" 编程相关的设置
set showmatch                   " 启用括号匹配提示
set autoindent                  " 开启自动对齐
set cindent                     " 强制为C语言模式对齐
set smartindent                 " 智能对齐方式
set tags=tags;                  " 这个值会自动递归查找上级目录
set autochdir

" 开启文件类型探测，并加载插件，智能缩进（v模式下选中若干行，=键）
filetype plugin indent on
"set completeopt=longest,menu   " 关掉智能补全时的预览窗口

" 代码折叠
set foldmethod=syntax
set foldlevel=100               " 默认不折叠代码（依然可手动 zc 折叠）

" 打印设置（命令:ha 或 :ha > out.ps），也可以试试输出为Html :TOhtml
if (!has("win32"))
    "encoding of printing. use encoding if not set.
    set printencoding=utf-8
    "charset of print. should be compatible with printencoding.
    "set printmbcharset=ISO10646
    "打印所用字体, 在linux下, 要用ghostscript里已有的字体, 不然会打印乱码.
    set printmbfont=r:ZhunYuan-Regular,c:yes
    "打印可选项, formfeed: 是否处理换页符, header: 页眉大小, paper: 用何种
    "纸, duplex: 是否双面打印, syntax: 是否支持语法高
    set printoptions=formfeed:y,paper:A4,duplex:on,syntax:y",header:3
    "打印时页眉的格式
    "set printheader=%<%f%h%m%=Page\ %N
else
    runtime! extra/mswin.vim
endif

"let do_syntax_sel_menu = 1
"
" Konsole 光表样式设置
" ==============================================================
if &term =~ "xterm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" GVIM配置
" ==============================================================
if has("gui_running")
    colorscheme wombat              " 这个主题比较不错
    set guifont=Monaco
    set guioptions-=T
    set guioptions-=m
    map <S-Right>   :bnext<CR>
    map <S-Left>    :bpre<CR>
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>
endif

" 其他
" ==============================================================
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal g`\"" |
     \ endif

" 快捷键绑定
runtime! extra/shortcuts_extra.vim
" 源代码Tag操作等
runtime! extra/tags_extra.vim
" 插件设置
runtime! extra/plugins_extra.vim

