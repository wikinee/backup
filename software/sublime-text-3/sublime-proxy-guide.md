
sublime的package control的相关网络接口在国内不是很稳定，所以想到了利用shadowsocks 作为代理。

### 安装nodejs

### 安装shadowsocks
```
npm install -g shadowsocks
```
### 创建一个config.json， 设置shadowsocks配置
```
{
    "server":"xxx",
    "server_port":1000,
    "local_port":1000,
    "password":"1000",
    "timeout":600,
    "method":"table",
    "local_address":"127.0.0.1"
}
```
### 开启本地的shadowsocks客户端
```
  sslocal
```

### sublime安装package control

解压缩到sublime选项preferences > browse packages对应的目录，然后重启sublime， 即安装完成了package control。

### 配置sublime的package control的网络代理

打开package control的配置选项preferences > package settings > package control > settings - user
```
{
    "http_proxy": "http://127.0.0.1:1080",
    "https_proxy": "http://127.0.0.1:1080"
}
```
