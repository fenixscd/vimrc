#!/bin/sh
# vimrc install script

echo Descargando y instalando el gestor de paqutes 
curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


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
