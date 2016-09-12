# vimrc

Instalacíon de vim y configuración de los pluguins
Esta todo esplicado en cada uno de los archivos.

Manejo de Plugins

Problema: quiero instalar plugins.

Hay varias alternativas para manejar plugins, yo particularmente utilizo plug

¿por que? simplemente por velocidad, plug permite instalacion asincrona de plugins. Para instalarlo solo necesitamos bajarlo a una carpeta que vim carga por defecto:

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
Luego, dentro de nuestro .vimrc declaramos los plugins que queremos que maneje:

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'    " Lindo theme, gracias Fede ;)
Plug 'tpope/vim-surround' " Pueden vivir completamente sin plugins excepto este

call plug#end()
Notar que los plugins deben declararse entre el llamado a plug#begin y plug#end

Listo, ahora pueden buscar plugins e instalarlos con solo agregarlos a su vimrc y ejecutar PlugInstall dentro de vim. Para actualizar todos los plugins tienen el comando PlugUpdate y para actualizar al mismo gestor tienen PlugUpgrade.

Normalmente, el flujo para instalar un plugin seria el siguiente:

Google that shit!, seguramente llegaremos a un repo en github.
Copiamos el final de la url, lease: 'nombreDeUsuario/repo'.
Lo agregamos al vimrc como esta declarado mas arriba: Plug 'nombreDeUsuario/repo'
Ejecutamos PlugUpdate
Como funciona esto? a groso modo, lo que hace esto es modificar en tiempo de ejecucion la variable rtp de vim agregando las carpetas de correspondientes a lo declarado en nuestro vimrc.

Entre muchas genialidades de plug esta la carga "on demand", que permite alivianar el tiempo de arranque del editor agregando los plugins de forma lazy recien cuando se los invoque por primera vez. Para mas info referirse a la documentacion.

