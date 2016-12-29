安装cpplint
------

Cpplint.py是一个单独的文件，使用不方便，可以安装单独的包。
不要使用$ sudo apt-get install python-pip 安装pip，版本太旧，采用源码安装,解压源码。

```
$ wget https://bootstrap.pypa.io/ez_setup.py -O - | sudo python
$ sudo python setup.py install
$ sudo pip install cpplint
```
