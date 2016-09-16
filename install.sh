#!/bin/sh
# vimrc install script

#Instala git si no esta instalado 
if ! git --version >/dev/null 2>&1; then
    sudo apt-get install git -y
fi

# Instala curl si no esta instalado
if ! curl --version >/dev/null 2>&1; then
    sudo apt-get install curl -y
    #echo "You need to install Curl to download vim-plug."
    #exit 1
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
curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo Crea un enlace simbolico
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

# Si esta instalado vim ejecuta el el comando para que se carguen los plugins.
if vim --version >/dev/null 2>&1; then
    vim +PlugInstall +qall
else
    echo "Vim no esta instalado"
    echo "Instala vim y despues ejecuta el siguente comando:"
    echo "  vim +PlugInstall +qall"
    read parar
fi
read parar
