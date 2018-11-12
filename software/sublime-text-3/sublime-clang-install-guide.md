SublimeClang
------

### Install

- 自己编译(不推荐)

```
    sudo apt-get install cmake build-essential clang git
    cd ~/.config/sublime-text-3/Packages
    git clone --recursive https://github.com/quarnster/SublimeClang SublimeClang
    cd SublimeClang
    cp /usr/lib/x86_64-linux-gnu/libclang-3.4.so.1 internals/libclang.so
    #这一步很重要，如果你的clang库不是3.4版本的话，请将对应版本的库拷贝到internals中
    cd src
    mkdir build
    cd build
    cmake ..
    make
```

- 作者发布(推荐)

  - 使用已经编译好的版本 [downloads](https://github.com/quarnster/SublimeClang/downloads)
  - 使用Package Control安装

### Configuration

一切成功的话将会在SublimeClang/internals目录中生成libcache.so库文件。重启Sublime Text，

然后按快捷键Ctrl + `(Esc下面那个键)打开自带的控制输出，看看有没有错误，如果没有错误就说明一切OK了。

接下来就是配置自己的文件了，按下ctrl + shift + p快捷键，在弹出的输入框中输入

sublimeclang settings ，然后选择带User那一行，在打开的文件中输入如下信息：


```JSON
{
    "show_output_panel": false,
    "dont_prepend_clang_includes": true,
    "inhibit_sublime_completions": false,

    "options":
    [
        "-std=gnu++11",
        "-isystem", "/usr/include",
        "-isystem", "/usr/include/c++/*",
        "-isystem", "/usr/include/c++/4.8",
        "-isystem", "/usr/include/c++/4.8/*",
        "-isystem", "/usr/include/glib-2.0/",
        "-isystem", "/usr/include/glib-2.0/*",
        "-isystem", "/usr/include/gtk-3.0/",
        "-isystem", "/usr/include/gtk-3.0/*",
        "-isystem", "/usr/include/boost",
        "-isystem", "/usr/include/boost/**",
        "-isystem", "/usr/lib/gcc/x86_64-linux-gnu/4.8/include",
        "-isystem", "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/*"

        # for Mac
        "-I/usr/lib/clang/4.2/include/**",
        "-I/Applications/Xcode.app/Contents/Developer/usr/lib/llvm-gcc/4.2.1/include"
    ]
}
```

**注释**

    我的gcc版本为4.8，如果你的不是请替换对应的版本，在#include相应的头文件后保存当前文件，

    在接下来的操作中将更快的提示所包含在头文件的函数或者变量。

### Example

通过菜单栏中的Project -> Add Folder To Project...把你已有的原代码目录加入到

Sublime Text中，然后通过Project -> Save Project As...来保存你的项目。

例如我的机器在/media/WinE/WorkStation/Swift中有个C++项目，

代码分别放在了Swift下的swift/base和swift/disruptor两个目录下，

现在想要把这两个目录中的内容在写代码时能够自动提示则需要相应的配置修改。

Project -> Edit Project，在所打开的配置文件中我更改如下：

```JSON
{
    "folders":
    [
        {
            "follow_symlinks": true,
            "path": "/media/WinE/WorkStation/Swift"
        }
    ],

    "settings":
    {
        "sublimeclang_options":
        [
            "-I/media/WinE/WorkStation/Swift",
            "-I/media/WinE/WorkStation/Swift/swift/base",
            "-I/media/WinE/WorkStation/Swift/swift/disruptor",
       ]
    }
}
```

综合以上，如果你有什么问题，请能提出，大家一起进步，希望你能爱上个家伙。