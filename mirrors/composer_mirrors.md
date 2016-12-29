Composer
------
[原文](http://composer-proxy.jp)

编辑配置文件 $COMPOSER_HOME/config.json (通过命令 composer config -g -e).
{
    "repositories": [
        { "packagist": false },
        {
            "type": "composer",
            "url": "http://composer-proxy.jp/proxy/packagist"
        }
    ]
}