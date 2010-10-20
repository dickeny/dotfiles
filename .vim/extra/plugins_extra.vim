
" 插件设置
" ==============================================================

" for NERT_tree plugin
nmap <F2> :NERDTreeToggle<CR>

" Dox 注释生成器配置
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return "
let g:DoxygenToolkit_authorName="rexliao"
let g:DoxygenToolkit_licenseTag="My own license"
"let g:DoxygenToolkit_blockHeader="-------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="-------------------------------------------------------------------"

" For TagList
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" For cscope
:set cscopequickfix=s-,c-,d-,i-,t-,e-


