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
" �������� 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set fileencodings=utf-8,gb2312,gbk,gb18030  
set termencoding=utf-8  
"set fileformats=unix  
set fileformat=unix  
set encoding=prc  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" �����С���� 
" h �������С 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set guifont=Consolas:h14 
" ���������пո�Ļ�����ʹ���»��߱�ʾ�ո��������� 
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


set number	                " ��ʾ�к� 
set tabstop=4                " �趨tab����Ϊ4 
set shiftwidth=4             " �����Ŀո��� 
set expandtab                " �Ƿ�������������Tab��ʱʹ�ÿո����; 
                    " ʹ��noexpandtabȡ������ 
set autoindent               " �Զ����� 
set smartindent 
set cindent     

set showmatch                   " ��ʾ���������� 
set paste                       " ֧���ⲿ����(���񲻹���) 
set clipboard+=unnamed          " ��windows��������� 

set history=50                  " keep 50 lines of command history 
set scrolloff=3                 " ����ƶ���buffer�Ķ����͵ײ�ʱ����3�о��� 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" color set 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
colorscheme desert	            " windows����ɫ���� 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" windows��guiȥ����ʾ�������Ҫ��ʾ��ֻ��Ҫ��-��Ϊ+���� 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set guioptions-=T               " windows�����ع����� 
set guioptions-=r               " ��gui�ұߵĻ�����ȥ�� 
set guioptions-=L               " ��gui��ߵĻ�����ȥ�� 
set guioptions-=m               " ��gui�Ĳ˵���ȥ�� 
set shortmess=atI               " ������ʱ����ʾԮ���������ͯ����ʾ(��I������L) 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" windows������vim��� 
"autocmd GUIEnter * simalt ~x 

set gcr=a:block-blinkon0        " windows��ȥ��������� 

set nobackup                    " �ر��Զ����ݹ���,backup�Զ����� 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" windows��python���� 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" �Զ���ȫ: 
" ����˵�� 
" 1. ����pydiction, pydiction������complete-dict��python_pydiction.vim 
" 2. cp complete-dict to C:\Program Files\Vim\vimfiles\ftplugin\pydiction 
"    cp python_pydiction to C:\Program Files\Vim\vimfiles\ftplugin 
" 3. modify _vimrc 
"    add: 
"       filetype plugin on 
"       let g:pydiction_location='C:\Program Files\Vim\vimfiles\ftplugin\pydiction\complete-dict' 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" ��ݼ�˵�� 
" ��Ҫ��ȫ��ʱ�򣬰�סtab��������Կ�����ȫ������ 
" Ȼ��ͨ��ctrl-n, ctrl-p��������ѡ�� 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"filetype plugin on 
"let g:pydiction_location='C:\Program Files\Vim\vimfiles\ftplugin\pydiction\complete-dict' 
" �Զ�����python, 
" python��Ҫ����path·�����Ժ�ֻҪ��дpython��ʱ�򣬰�סf12�����ֱ�ӱ��� 
" %����ľ��ǵ�ǰ���ļ� 
"map <F12> :!python.exe % 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Tag list(ctags) 
" ����˵��: 
" 1. ����ctags�� ��ѹ�����ᷢ��������һ��ctags.exe 
" 1. cp ctags.exe to c:\windows\system32\, ��֮��cmd�±�����ctags���� 
" 3. ����taglist, ��ѹ��, ������doc/taglist.txt��plugin/taglist.vim 
" 4. cp taglist.vim to C:\Program Files\Vim\vimfiles\plugin\ 
"    cp taglist.txt to C:\Program Files\Vim\vimfiles\doc\ 
" 5. ʹ��: 
"    ͬlinux���ơ� 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"let Tlist_Show_One_file=1                  " ��ͬʱ��ʾ�����tag��ֻ��ʾ��ǰ�ļ���  
"let Tlist_Exit_OnlyWindow=1                " ���taglist���������һ�����ڣ����˳�vim 
"nmap  tl :TlistToggle 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" winmanager config 
" ����˵��: 
" 1. ����winmanager�� ��ѹ�� 
" 2. ����ͬtaglist���� 
" let g:winManagerWindowLayout='TagList|FileExplorer' ��ʾ˳��TagList���ϣ� 
" FileExplorer���� 
" let g:winManagerWidth=30  30���صĿ�� 
" nmap  wm :WMToggle        �Զ����ݼ�                 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"let g:winManagerWindowLayout='TagList|FileExplorer' 
"let g:winManagerWidth=30 
"nmap  wm :WMToggle                         
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

