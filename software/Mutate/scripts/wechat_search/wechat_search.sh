#!/bin/bash
echo [$@]
echo "command=xdg-open \"http://weixin.sogou.com/weixin?type=2&query=$@\""
echo "icon="
echo "subtext=微信搜索 $@"
