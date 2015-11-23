""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Vim: windows config(c:\Program Files\Vim\_vimrc) 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Use Vim defaults (much better!)  
" This should the priority setting, otherwise problems can appear  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
set nocompatible      
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 编码设置 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set fileencodings=utf-8,gb2312,gbk,gb18030  
set termencoding=utf-8  
"set fileformats=unix  
set fileformat=unix  
set encoding=prc  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 字体大小设置 
" h 是字体大小 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set guifont=Consolas:h14 
" 如果字体间有空格的话，则使用下划线表示空格，例如下面 
"set guifont=Courier_New:h11 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 



source $VIMRUNTIME/vimrc_example.vim 
source $VIMRUNTIME/mswin.vim 
behave mswin 

set diffexpr=MyDiff() 
function MyDiff() 
  let opt = '-a --binary ' 
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif 
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif 
  let arg1 = v:fname_in 
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif 
  let arg2 = v:fname_new 
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif 
  let arg3 = v:fname_out 
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif 
  let eq = '' 
  if $VIMRUNTIME =~ ' ' 
    if &sh =~ '\<cmd' 
      let cmd = '""' . $VIMRUNTIME . '\diff"' 
      let eq = '"' 
    else 
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"' 
    endif 
  else 
    let cmd = $VIMRUNTIME . '\diff' 
  endif 
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq 
endfunction 


set number	                " 显示行号 
set tabstop=4                " 设定tab长度为4 
set shiftwidth=4             " 缩进的空格数 
set expandtab                " 是否在缩进和遇到Tab键时使用空格代替; 
                    " 使用noexpandtab取消设置 
set autoindent               " 自动缩进 
set smartindent 
set cindent     

set showmatch                   " 显示括号配对情况 
set paste                       " 支持外部复制(好像不管用) 
set clipboard+=unnamed          " 与windows共享剪贴板 

set history=50                  " keep 50 lines of command history 
set scrolloff=3                 " 光标移动到buffer的顶部和底部时保持3行距离 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" color set 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
colorscheme desert	            " windows下深色主题 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" windows下gui去掉显示，如果需要显示，只需要将-改为+即可 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set guioptions-=T               " windows下隐藏工具栏 
set guioptions-=r               " 把gui右边的滑动条去掉 
set guioptions-=L               " 把gui左边的滑动条去掉 
set guioptions-=m               " 把gui的菜单栏去掉 
set shortmess=atI               " 启动的时候不显示援助索马里儿童的提示(是I而不是L) 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" windows下启动vim最大化 
"autocmd GUIEnter * simalt ~x 

set gcr=a:block-blinkon0        " windows下去掉光标闪动 

set nobackup                    " 关闭自动备份功能,backup自动备份 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" windows下python配置 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 自动补全: 
" 配置说明 
" 1. 下载pydiction, pydiction包括了complete-dict和python_pydiction.vim 
" 2. cp complete-dict to C:\Program Files\Vim\vimfiles\ftplugin\pydiction 
"    cp python_pydiction to C:\Program Files\Vim\vimfiles\ftplugin 
" 3. modify _vimrc 
"    add: 
"       filetype plugin on 
"       let g:pydiction_location='C:\Program Files\Vim\vimfiles\ftplugin\pydiction\complete-dict' 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 快捷键说明 
" 需要补全的时候，按住tab键，便可以看到补全的内容 
" 然后通过ctrl-n, ctrl-p可以上下选择 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"filetype plugin on 
"let g:pydiction_location='C:\Program Files\Vim\vimfiles\ftplugin\pydiction\complete-dict' 
" 自动编译python, 
" python需要加入path路径，以后只要编写python的时候，按住f12，便可直接编译 
" %代表的就是当前的文件 
"map <F12> :!python.exe % 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Tag list(ctags) 
" 配置说明: 
" 1. 下载ctags， 解压缩，会发现里面有一个ctags.exe 
" 1. cp ctags.exe to c:\windows\system32\, 这之后，cmd下便有了ctags命令 
" 3. 下载taglist, 解压缩, 里面有doc/taglist.txt和plugin/taglist.vim 
" 4. cp taglist.vim to C:\Program Files\Vim\vimfiles\plugin\ 
"    cp taglist.txt to C:\Program Files\Vim\vimfiles\doc\ 
" 5. 使用: 
"    同linux类似。 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"let Tlist_Show_One_file=1                  " 不同时显示多个的tag，只显示当前文件的  
"let Tlist_Exit_OnlyWindow=1                " 如果taglist窗口是最后一个窗口，则退出vim 
"nmap  tl :TlistToggle 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" winmanager config 
" 配置说明: 
" 1. 下载winmanager， 解压缩 
" 2. 操作同taglist类似 
" let g:winManagerWindowLayout='TagList|FileExplorer' 显示顺序，TagList在上， 
" FileExplorer在下 
" let g:winManagerWidth=30  30像素的宽度 
" nmap  wm :WMToggle        自定义快捷键                 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"let g:winManagerWindowLayout='TagList|FileExplorer' 
"let g:winManagerWidth=30 
"nmap  wm :WMToggle                         
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

