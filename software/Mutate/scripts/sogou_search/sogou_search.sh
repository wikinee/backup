#!/bin/bash
echo [$@]
echo "command=xdg-open \"https://www.sogou.com/web?query=$@\""
echo "icon="
echo "subtext=搜狗搜索 $@"
