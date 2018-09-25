Installation:

```
    git clone git://github.com/johntfoster/dotvim.git ~/.vim
```

Create symlinks:

For vi/vim
```
    ln -s ~/.vim/vimrc ~/.vimrc
```

For neovim
```
    ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
```

Install vim-plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```


Update plugins from withing vim/nvim:

````
    :PlugInstall!
````

You will need to then follow the installation instructions to build the required
files for `YouCompleteMe` and `command-t`.
