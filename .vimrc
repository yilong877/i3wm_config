"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"								显示设置									"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 开启语法高亮功能
syntax enable

" 自动语法高亮
syntax on

" 显示行号
set number

" 总是显示状态行
set laststatus=2

" 打开状态栏标尺
set ruler

" 隐藏工具栏(GUI)
set guioptions-=T

" 隐藏状态栏(GUI)
set guioptions-=m

" 突出显示当前行
set cursorline

" 显示命令
set showcmd

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1

" 设置命令行高度为 1
set cmdheight=1

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 搜索逐字符高亮
set hlsearch
set incsearch

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 设置光标不闪烁
set novisualbell

" 设置折叠
set foldcolumn=0
set foldmethod=indent
set foldlevel=3
set foldenable






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"								一般设置									"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set cul

autocmd InsertEnter * se cul

set completeopt=preview,menu

" 设置编码集
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

" 让光标回到上次退出时的位置
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 侦测文件类型
filetype on

" 开启插件
filetype plugin on

" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 历史记录为 1000 行
set history=1000

" 不使用 vi 键盘模式
set nocompatible

" 可以在 buffer 的任何地方使用鼠标（类似 office 中在工作区双击鼠标定位)
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 设置魔术
set magic

" 行尾有多余的空格(包括 tab 键)会显示小方块
set listchars=tab:»■,trail:■
set invlist

" 搜索时忽略大小写
set ignorecase

" 智能大小写搜索
set smartcase

" 去除错误提示音
set noeb

" 拼写检查
"set spell

" 增强模式中的命令行自动完成操作
set wildmenu

"启动的时候不显示援助索马里儿童的提示
set shortmess=atI 





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"								文件排版									"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 特定文件类型载入相关缩进
filetype indent on 

" 插件相关缩进
filetype plugin indent on

" 自动格式化
set formatoptions=tcrqn

" 不要换行
set nowrap

" 用空格代替制表符, expandtab 的作用是将 tab 换成等长的空格,如果设置为 noexpantab ,插件 indentline 将无法显示
set expandtab

" 设置全局 tab 宽度为 4
" 继承前一行的缩进方式，特别适用于多行注释
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 设置 javascript，html，css，xml，yaml，yml 文件的 tab 宽度为 2
autocmd FileType javascript,html,css,xml,yaml,yml,markdown setlocal autoindent
autocmd FileType javascript,html,css,xml,yaml,yml,markdown setlocal shiftwidth=2
autocmd FileType javascript,html,css,xml,yaml,yml,markdown setlocal tabstop=2
autocmd FileType javascript,html,css,xml,yaml,yml,markdown setlocal softtabstop=2

" C/C++ 自动缩进
set smartindent

" 使用 C 样式的缩进
set cindent
set cinoptions=g0,:0,N-s,(0

" 在行和段开始处使用制表符
set smarttab

" 使回格键（ backspace ）正常处理 indent, eol, start 等
set backspace=2

" 允许 backspace 和光标键跨越行边界
set whichwrap+=<,>,h,l

" 字符间插入的像素行数目
set linespace=0

" 设置 C/C++, Java, Python, sh, vim 等文件列数为 120 时给个提示
"autocmd FileType c,cpp,java,py,sh,vim set colorcolumn=120
set colorcolumn=120






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"								文件设置									"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 不要备份文件
set nobackup

" 不要 .swp 文件
set noswapfile

" 当文件被改动时自动载入
set autoread

" 自动保存
set autowrite
set autowriteall

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 通过使用: commands 命令，告诉我们文件的哪一行被改变过
set report=0

" 自动添加相关文件头
autocmd BufNewFile *.cpp,*.c,*.hpp,*.h,*.sh,*.py exec ":call AddTitle()"
func AddTitle()
    if expand("%:e") == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif expand("%:e") == 'py'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")
    elseif expand("%:e") == 'cpp'
        call setline(1,"#include <iostream>")
        call append(line("."),"using namespace std;")
        call append(line(".")+1,"")
    elseif expand("%:e") == 'c'
        call setline(1,"#include <stdio.h>")
        call append(line("."),"#include <stdlib.h>")
        call append(line(".")+1, "")
    elseif expand("%:e") == 'h'
        call setline(1, "#pragma once")
    elseif expand("%:e") == 'hpp'
        call setline(1, "#pragma once")
    endif
endfunc
" 将光标自动定位到文件末尾
autocmd BufNewFile * normal G






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							    映射设置									"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 定义前置映射键位为 “,”
let mapleader=","

" 清除搜索后的高亮显示
nnoremap <Leader>c :noh<CR>

" 定义 Y 为复制到行尾
noremap Y y$

" 定义 U 为恢复上一次操作
noremap U <C-r>


" 定义 <Leader>q 退出文件
nmap <Leader>q :q<CR>

" 定义 <Leader>x 保存退出
nmap <Leader>x :xa<CR>

" 移动光标到另外的窗口, h 为左边的窗口, j 为下个窗口, k 为上个窗口, l 为右的窗口
nmap H <C-w>h
nmap J <C-w>j
nmap K <C-w>k
nmap L <C-w>l

" 移动窗口
" 向左移动
nmap <C-h> <C-w>H
" 向下移动
nmap <C-j> <C-w>J
" 向上移动
nmap <C-k> <C-w>K
" 向右移动
nmap <C-l> <C-w>L

" 分屏
nnoremap <Leader>v :split<CR>
nnoremap <Leader>h :vsplit<CR>

" 切换文件
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>

" 强制写入没有权限的文件，需要有 sudo 权限
cmap w!! w!sudo tee > /dev/null %



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"								  插件总成									"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 插件设置,插件管理器为 vim-plug
call plug#begin('~/.vim/plugged')

    " 主题
    Plug 'tomasr/molokai'
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'

    " 自动匹配
    Plug 'jiangmiao/auto-pairs'

    " 匹配符号
    Plug 'tpope/vim-surround'

    " git 相关
    Plug 'tpope/vim-fugitive'

    " 注释
    Plug 'tpope/vim-commentary'

    " 加强重复功能
    Plug 'tpope/vim-repeat'

    " C/C++ 相关？
    Plug 'tpope/vim-endwise'

    " vim-airline 插件及主题
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " 图标相关
    Plug 'ryanoasis/vim-devicons'

    " markdown 插件
    Plug 'plasticboy/vim-markdown'
    Plug 'instant-markdown/vim-instant-markdown'

    " LaTeX 插件
    Plug 'lervag/vimtex'
    Plug 'xuhdev/vim-latex-live-preview'

    " incsearch 插件
    Plug 'haya14busa/incsearch.vim'

    " 缩进补齐线
    Plug 'yggdroot/indentline'

    " 加强移动功能
    Plug 'easymotion/vim-easymotion'

    " 补全插件
    Plug 'neoclide/coc.nvim', { 'branch':'release' }

    " 函数相关插件
    Plug 'preservim/tagbar'

    " 模糊查找
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

call plug#end()

" 加载 vim 默认插件
runtime macros/matchit.vim




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							  插件具体设置									"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto-pairs 配置
" 相关类型文件自动补全 ”<“ 和 ”<!--“ ,这个配置会让自动缩进失效，原因不明。使用的时候配合 COC 会自动对齐
autocmd FileType javascript,html,css,xml,markdown let b:AutoPairs=AutoPairsDefine({'<!--':'-->','<':'>'})
autocmd FileType c,cpp,java let b:AutoPairs=AutoPairsDefine({'/*':'*/'})



" markdown 相关配置
" 关闭 markdown 的自动折叠
autocmd BufNewFile,BufRead *.md setlocal nofoldenable
let g:instant_markdown_browser = "google-chrome-stable"



" tagbar 配置
" 打开 tagbar
nmap <silent><Leader>t :TagbarToggle<CR>
"
let g:tagbar_ctags_bin='ctags'
" 设置 tagbar 的宽度为 30
let g:tagbar_width=30
" 设置 tagbar 打开时光标在 tagbar 里
let g:tagbar_autofocus=1
" 设置标签不排序
let g:tagbar_sort=0



" easymotion 相关配置
let g:EasyMotion_smartcase=1
let g:EasyMotion_startofline=0
nmap <Leader>s <Plug>(easymotion-s)
" 重复上一次操作
map <Leader><Leader>. <Plug>(easymotion-repeat)



" 修改 commentary 的注释风格
" 修改 Python, Shell 文件的注释为 “#”
autocmd FileType python,shell setlocal commentstring=#\ %s
" 修改 Java, C/C++ 的注释为 “//”
autocmd FileType java,c,cpp setlocal commentstring=//\ %s
" 修改 Html, Markdown, Xml, css, javascript 文件的注释为 “<!-- -->”
autocmd FileType html,markdown,xml,css,javascript setlocal commentstring=<!--%s-->
" 修改 vim 的注释为 “ " ”
autocmd FileType vim setlocal commentstring=\"\ %s
" 将 Commentary 命令 映射为 <Leader>gc
nmap <Leader>gc Commentary



" airline 配置
let g:airline_theme="gruvbox"
let g:airline_powerline_fonts=1
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='default'
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''



" devicons 配置
" 加载插件
let g:webdevicons_enable=1
" airline tabline 生效
let g:webdevicons_enable_airline_tabline=1
" airline statusline 生效
let g:webdevicons_enable_airline_statusline=1



" indentline 配置
let g:indentLine_enabled=1
let g:indentLine_char='┊'
let g:indentLine_color_term=239



" coc-explorer 相关配置
" “，+ f ” 打开文件夹
nnoremap <Leader>f :CocCommand explorer<CR>
" tab 选词, shift-tab 上一个, tab 下一个
inoremap <expr><TAB> pumvisible() ? "\<C-n>" :"\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"



" fzf 配置
nnoremap <C-p> :Files<CR>
nnoremap <C-e> :Buffers<CR>
let g:fzf_action={ 'ctrl-e' : 'edit' }



" LaTex 相关设置
" 设置 tex 文件的刷新频率为 1 秒
autocmd FileType tex setlocal updatetime=1
" vimtex 相关配置
let g:tex_flavor='latex'
" 设置默认编译器为xelatex
" let g:vimtex_compiper_latexmk_engines={'_':'-xelatex'}
" let g:vimtex_compiper_latexrun_engines={'_':'-xelatex'}
" 设置 zathura 为默认的 PDF 阅读器
let g:vim_tex_view_method='zathura'
" 不显示编译错误提示
let g:vimtex_quickfix_mode=0
set conceallevel=1
" 补全设置
let g:vimtex_fold_manual=1



" vim-latex-live-preview
let g:livepreview_previewer='zathura'
let g:livepreview_engine='xelatex'
nnoremap <Leader>P :LLPStartPreview<cr>





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							  主题颜色设置									"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置背景颜色为 dark
set background=dark
set t_Co=256


" 设置主题为 solarized,molokai
let g:gruvbox_hls_cursoor='orange'
colorscheme gruvbox

" 设置颜色为 256 色
" let g:molokai_original=1
" let g:onedark_termcolors=256
" let g:rehash256=1
