#!/bin/bash
echo [$@]
echo "command=xdg-open \"http://zhihu.sogou.com/zhihu?query=$@\""
echo "icon="
echo "subtext=知乎搜索 $@"
