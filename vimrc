#!/bin/vim
" INDICE DE CONTENICOS:
" 1. Configuración generica
" 2. Vim-Plug plugins
" 3. Archivo de configuracion
" 4. Specific filetype settings
" 5. Colores del interfaz
" 6. Mapa de funciones

" ===================
" 1. Configuración generica
" ===================
set nocompatible " Que no sea compatible con vi
set history=1000 " Tamaño del historico.

" =================
" 2. VUNDLE PLUGINS https://github.com/VundleVim/Vundle
" =================

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternativamente, pasar una ruta donde Vundle debería instalar complementos
"call vundle#begin('~/some/path/here')

  Plug 'scrooloose/nerdtree'      "Arbol de directorios
  Plug 'tpope/vim-fugitive'       "Para git
  Plug 'airblade/vim-gitgutter'   "Pone + cuando cambias una linea
  Plug 'majutsushi/tagbar'        "Lita de funciones que hay un archivo
  Plug 'ctrlpvim/ctrlp.vim'       "Un busacador de archivos con sugerencias

  Plug 'mattn/emmet-vim'          "Para escribir html más rapido.

  Plug 'jlanzarotta/bufexplorer'  " Abre una bentana con los buffers activos
  Plug 'scrooloose/nerdcommenter' " Para crear comentarios
  Plug 'itchyny/lightline.vim'    " Barras de colores github.com/itchyny/lightline.vim

  "Plug 'm2mdas/phpcomplete-extended'          "Auto completar para php falla
  Plug 'Shougo/unite.vim'                     "Buscador de archivos necesario para autocompletar php
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}  "Necesario para el autocompletar de
  Plug 'terryma/vim-multiple-cursors'     " Multiples cousores
  Plug 'tpope/vim-commentary'             " Para añadir comentarios
  Plug 'scrooloose/syntastic'             " Verifica la sintaxis https://github.com/scrooloose/syntastic

  "Plug 'editorconfig/editorconfig-vim'
  "Plug 'Valloric/YouCompleteMe'

  " Colorschemes
  Plug 'cschlueter/vim-wombat'

  """""""" MAS PLUGINS""""""""""""""""""
  Plug 'ap/vim-buftabline'        "Aparecen pestañas en la parte superior
  "Plug 'othree/vim-autocomplpop'  " Buscar archivos con auto completado ctrl+p
  "Plug 'garbas/vim-snipmate'      " Para crear snippets
  "Plug 'MarcWeber/vim-addon-mw-utils' " Requerido por vim-snipmate
  "Plug 'tomtom/tlib_vim'              " Requerido por vim-snipmate
  "Plug dsfñkladhgñaklhdfiiikdsafñlkjadsflk'garbas/vim-snipmate'          " Requerido por vim-snipmate
  "Plug 'honza/vim-snippets'       " Repositorio de snippets para diferentes lenguajes
  "Plug 'mileszs/ack.vim'          " Buscar archivos con sugerencias

call vundle#end()            " required
filetype plugin indent on    " required



" ================
" 3. FILE SETTINGS
" ================

" Hace que no cree archivos temporales.
set noswapfile
set nobackup

" Modify indenting settings
set autoindent              " autoindent siempre encendido.
set expandtab               " expandir pestañas
set shiftwidth=4            " espacios para autoindentar
set softtabstop=4           " eliminar un pseudo-TAB completo cuando presiono <BS>

" Modificar algunas otras configuraciones sobre archivos
set encoding=utf-8             " siempre use unicode (dios maldito, ventanas) (god damnit, windows)
set backspace=indent,eol,start " el retroceso siempre funciona en modo insertar
set hidden

" =============================
" 4. SPECIFIC FILETYPE SETTINGS
" =============================

" Algunos lenguajes de programación funcionan mejor cuando se usa solo 2 espacios de relleno.
autocmd FileType html,css,sass,scss,javascript setlocal sw=2 sts=2
autocmd FileType json setlocal sw=2 sts=2
autocmd FileType ruby,eruby setlocal sw=2 sts=2
autocmd FileType yaml setlocal sw=2 sts=2

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.html.erb,*.xml.erb,*.xml"

"let g:racer_cmd="/Users/danirod/.cargo/bin/racer"
"let $RUST_SRC_PATH="/usr/local/src/rustc/src"


" ================
" 5. COLORS AND UI
" ================
" ¿Apoyamos los colores?
if &t_Co > 2 || has("gui_running")
   syntax on
   set colorcolumn=90
   silent! color wombat
endif

" Extra fancyness if full pallete is supported.
if &t_Co >= 256 || has("gui_running")
    set cursorline
    set cursorcolumn
    silent! color wombat256
endif

" Trailing spaces
if &t_Co > 2 || has("gui_running")
    " Because we have color, colourize them
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
else
    " Fallback
    set listchars=trail:~
    set list
endif

set fillchars+=vert:\   " Retire las tuberías desagradables de las divisiones verticales
                        " Salsa en esto: http://stackoverflow.com/a/9001540

set showmode            " Muestra en que modo estamos
set laststatus=2        " mostrar siempre la barra de estado
set wildmenu            " habilitar visual wildmenu

set nowrap              " no envuelva las largas colas
set number              " mostrar los números de línea
set relativenumber      " mostrar los números como relativos por defecto
set showmatch           " resaltar paréntesis y paréntesis correspondientes

if &t_Co >= 256 || has("gui_running")
    set cursorcolumn    " la columna del cursor está bien pero solo con suficientes colores
endif

" =====================
" 6. MAPS AND FUNCTIONS
" =====================
let mapleader="," " La tecla que utilizaremos para iniciar el comando.

" Para pasar de una ventana a otra utilizaremso al combinación de
" utilizando la misma configuración que la de moverse con CTRL.
" Ctrl + h Va a la ventana de la izquierda
" Ctrl + j Va a la ventana de la abajo
" Ctrl + k Va a la ventana de la arriva
" Ctrl + l Va a la ventana de la derecha
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Move CtrlP to CtrlT (CtrlP is for buffers)
let g:ctrlp_map = '<C-t>'

" Working with buffers is cool.
set hidden
"Ctrl+n Ctrl+P Para cambiar de buffer
map <C-N>  :bnext<CR>
map <C-P>  :bprev<CR>

imap <C-N> <Esc>:bnext<CR>a
imap <C-P> <Esc>:bprev<CR>a

" NERDTree: map ,nt for toggling NERDTree. Faster than the old :NT command
" since I don't have to hold Shift whenever I want to display NERDTree.
nmap <Leader>nt :NERDTreeToggle<cr>
:let g:NERDTreeWinSize=30

" Relative numbering is pretty useful for motions (3g, 5k...). However I'd
" prefer to have a way for switching relative numbers with a single map.
nmap <F5> :set invrelativenumber<CR>
imap <F5> <ESC>:set invrelativenumber<CR>a

let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '|', 'right': '|' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '* '.branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
