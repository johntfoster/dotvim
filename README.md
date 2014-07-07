Installation:

````
    git clone git://github.com/johntfoster/dotvim.git ~/.vim
````

Create symlinks:

````
    ln -s ~/.vim/vimrc ~/.vimrc
````

Update Vundle submodule

````
    git submodule init
    git submodule update
````

Update bundles:

````
    :PluginInstall!
````

Or from the command line:

````
    vim +PluginInstall +qall
````
