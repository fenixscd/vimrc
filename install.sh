#!/bin/sh
# vimrc install script

#Instala git si no esta instalado
if ! git --version >/dev/null 2>&1; then
    sudo apt-get install git -y
fi

# Instala curl si no esta instalado
if ! curl --version >/dev/null 2>&1; then
    sudo apt-get install curl -y
fi


# Si existe el algunos de los archivos de configuracion
# Lo elimina el <archivo>.bak y renombra los archivos de
# Configuracion a .bak
[ -e ~/.vimrc ] && (rm -rf ~/.vimrc.bak; mv ~/.vimrc ~/.vimrc.bak)
[ -e ~/.gvimrc ] && (rm -rf ~/.gvimrc.bak; mv ~/.gvimrc ~/.gvimrc.bak)
[ -e ~/.vim ] && (rm -rf ~/.vim.bak; mv ~/.vim ~/.vim.bak)

echo Clonando mi reposeitorio gitub con la configuracion
git clone https://github.com/fenixscd/vimrc ~/.vim
echo 'Downloading vim-plug...'

echo Descargando y instalando el gestor de paqutes
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim

echo Crea un enlace simbolico
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

if vim --version >/dev/null 2>&1; then
  echo -e "\e[92mTodo instaldo:\e[0m"
  read parar
  #vim +PlugInstall +qall
else
  echo -e "\e[91mVim no esta instalado:\e[0m"
  echo -e "\e[91mInstala vim\e[0m"
  read parar
fi
