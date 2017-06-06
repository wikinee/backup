vim install
------

### VIM

[home](http://www.vim.org/)

[github](https://github.com/vim/vim)

### VIM install

|ways\OS|windows|Ubuntu|Mac|
| ------------- |:-------------:|:-------------:|:-------------:|
|gVIM|√|√|√|
|Source Code|√|√|√|
|binary packages|√|√|×|
|macVim|×|×|√|

### Compile

- in Mac

```shell
brew install vim --with-lua \
--with-override-system-vim --with-python --with-python3
```

- use Source code

    1. 卸载系统自带的vim.
    ```
    sudo apt-get remove vim vim-runtime  vim-tiny vim-common vim-gui-common
    sudo apt-get purge vim vim-runtime  vim-tiny vim-common vim-gui-common
    ```
    2. 安装依赖文件。
    
    ```
    sudo apt-get install luajit libluajit-5.1 libncurses5-dev libgnome2-dev \
    libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev \
    libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial python3-dev
    ```
    3. 下载vim代码。
    ```
    Ubunu:apt-get source vim
    Other:https://github.com/vim/vim
    ```

    4. 编译安装。
    ```
    ./configure --prefix=/usr/local \
                --with-features=huge \
                --enable-multibyte \
                --enable-luainterp=yes \
                --enable-pythoninterp=yes \
                --enable-python3interp=yes \
                --enable-termguicolors=yes \
                --enable-gui=auto \
                --enable-gnome-check \
                --enable-xim \
                --with-x \
                --with-vim-name=vi \
                --with-compiledby=$USER \
                --enable-fail-if-missing
            

    make VIMRUNTIMEDIR=/usr/share/vim/vim80 && sudo make install

    sudo ln -s /usr/bin/vi /usr/bin/vim

    ```

需要重新配置可 输入 `# make distclean `清理一下上一次编译生成的所有文件

### QA

**Q**: error while loading shared libraries: libgnomeui-2.so.0: cannot open shared object file: No such file or directory

**A**: sudo apt-get install libgnomeui-0

