

" =============================================
" 本文件针对Alt键进行快捷绑定
" =============================================

" BUG: 
" <M-xxx>的设定模式只针对GVIM有效。
" 普通的终端(konsole)需要另行设定。
" =============================================
if has("gui_running")
    " 窗口移动操作
    " （插入模式下的定义）
    inoremap <M-Left>   <C-o><C-w>h
    inoremap <M-Down>   <C-o><C-w>j
    inoremap <M-Up>     <C-o><C-w>k
    inoremap <M-Right>  <C-o><C-w>l

    inoremap <M-h> <C-o><C-W>h
    inoremap <M-j> <C-o><C-W>j
    inoremap <M-k> <C-o><C-W>k
    inoremap <M-l> <C-o><C-W>l

    " （正常模式下的定义）
    nmap <M-Left>   <C-w>h
    nmap <M-Down>   <C-w>j
    nmap <M-Up>     <C-w>k
    nmap <M-Right>  <C-w>l

    nmap <M-h> <C-W>h
    nmap <M-j> <C-W>j
    nmap <M-k> <C-W>k
    nmap <M-l> <C-W>l

    " 关闭窗口
    nmap <M-c> :close<CR>
    " 关闭文件
    nmap <M-d> :bdelete<CR>

    " 模式切换：Alt_Mode
    map! <M-m> <ESC>
    " 在新窗口中查询当前单词：Alt_Nextword
    nmap <M-n> <C-w>]
else
    " 窗口移动操作
    " （插入模式下的定义）
    inoremap [1;3D   <C-o><C-w>h
    inoremap [1;3B   <C-o><C-w>j
    inoremap [1;3A   <C-o><C-w>k
    inoremap [1;3C   <C-o><C-w>l

    inoremap h <C-o><C-W>h
    inoremap j <C-o><C-W>j
    inoremap k <C-o><C-W>k
    inoremap l <C-o><C-W>l

    " （正常模式下的定义）
    nmap [1;3D  <C-w>h
    nmap [1;3B  <C-w>j
    nmap [1;3A  <C-w>k
    nmap [1;3C  <C-w>l

    nmap h <C-W>h
    nmap j <C-W>j
    nmap k <C-W>k
    nmap l <C-W>l


    " 关闭窗口
    nmap c :close<CR>
    " 关闭文件
    nmap d :bdelete<CR>


    " 模式切换：Alt_Mode
    imap o <C-[>
    " 在新窗口中查询当前单词：Alt_Nextword
    nmap n <C-w>]

    map . :bnext<CR>
    map , :bprev<CR>

endif " has("gui_running")
