"==================vundle配置=====================
set nocompatible              " be iMproved, required
filetype off                  " required
"临时文件
set directory=.,$TEMP
"此处规定Vundle的路径
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
"此处规定插件的安装路径
call vundle#begin('$HOME/vimfiles/bundle/')
"中文文档
Plugin 'asins/vimcdoc'
"emmet插件
Plugin 'mattn/emmet-vim'
Plugin 'https://github.com/scrooloose/nerdtree'
"增强状态栏
Plugin 'https://github.com/bling/vim-airline'

"call vundle#end()            " required
filetype plugin indent on    " required
"=================================================
" 设定doc文档目录
let helptags=$VIM."/vimfiles/doc"
set helplang=cn
"关闭兼容模式
set nocompatible
"模仿快捷键，如：Ctrl+A全选、Ctrl+C复制、Ctrl+V粘贴等等
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
behave mswin
"gvim内部编码
set encoding=utf-8
"当前编辑的文件编码
set fileencoding=utf-8
"gvim打开支持编码的文件
set fileencodings=ucs-bom,utf-8,gbk,ccpp93,gb2312,big5,euc-jp,euc-kr,latin1
"set langmenu=zh_CN
"let $LANG = ’zh_CN.UTF-8’
"解决consle输出乱码
language messages zh_CN.utf-8
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"设置终端编码为gvim内部编码encoding
set termencoding=cp936
"防止特殊符号无法正常显示
set ambiwidth=double
"缩进尺寸为4个空格
set sw=4
"tab宽度为4个字符
set ts=4
"编辑时将所有Tab替换为空格
set et
"按一次backspace就删除4个空格
set smarttab
"不生成备份文件，如~index.html
set nobackup
"开启行号标记
set number
"配色方案为desert
colo desert
"关闭上侧工具栏
set guioptions-=T
"关闭右侧滚动条
"get guioptions-=r
"开启自动缩进
set autoindent
"默认开启nerdtree
"autocmd vimenter * NERDTree D:/amp



"编辑vimrc之后，重新加载
autocmd! bufwritepost _vimrc source $VIM/_vimrc
"与Windows共享剪贴板
set clipboard+=unnamed
"根据编辑模式更改输入法光标颜色，同时禁用IME自动切换
if has('multi_byte_ime')
    hi Cursor guifg=bg guibg=Orange gui=NONE
    hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
    set iminsert=0 imsearch=0
endif
"搜索忽略大小写
set ignorecase 
" 自动切换当前目录为当前文件所在的目录
set autochdir

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

"gvim字体设置
if has("gui_running") "如果在 GUI 环境下运行则设置下面语句
set guifont=YaHei_Consolas_Hybrid:h18:cGB2312
endif
"在 Console 环境下是没有效果的 