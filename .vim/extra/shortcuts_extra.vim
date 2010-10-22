" 各种快捷键绑定
" ==============================================================

" 使用空白键来进行代码折叠
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
vmap <space> <C-D>

" Fn系列绑定
" F3: 查找当前单词
" F4: 切换Tag列表
" F5: （以下定义）编译、运行当前文件
" F10:文字自动换行
nmap <F3> /<C-R>=expand("<cword>")<CR><CR>
noremap <F4> :TlistToggle<CR>
au FileType c       map <F5> :!gcc -Wall -g % -o %< && ./%<<CR>
au FileType cpp     map <F5> :!g++ -Wall -g % -o %< && ./%<<CR>
au FileType java    map <F5> :!javac % && java %<
au FileType tcl     map <F5> :!ns %
au FileType ruby,python,sh map <F5> :!chmod a+x % && ./%
map <F10> <ESC>:set wrap!<CR>

" 查询当前单词
nmap <C-q> :q<CR>
nmap <C-s> :w<CR>
nmap <Leader>l :tj
nmap <Leader>j <C-T>

" （插入状态下）单词自动替换(Z模式 ^_^)
imap zsj <c-r>=strftime("20%y-%m-%d %H:%M:%S")<cr>
imap zrq <c-r>=strftime("20%y-%m-%d")<cr>

" 窗口间跳转
nmap <C-j> :bn<CR>
nmap <C-l> :bp<CR>

