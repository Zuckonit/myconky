#!/bin/bash
#=============================================================================
#     FileName: qqonline.sh
#         Desc: judge whether the qq is online or not
#       Author: Mocker
#        Email: Zuckerwooo@gmail.com
#     HomePage: zuckonit.github.com
#      Version: 0.0.1
#   LastChange: 2012-09-25 15:14:33
#      History:
#=============================================================================

url="http://wpa.qq.com/pa?p=1:$1:1"
size=`curl -I $url | grep Content-Length | awk -F':' '{printf"%d",$2}'`

file_online=/tmp/qqonline
file_offline=/tmp/qqoffline

`rm -f $file_online &>> /dev/null`
`touch $file_offline &>> /dev/null`

if [ $size -eq 2329 ]; then
    `mv $file_offline $file_online >> /dev/null`
elif [ $size -eq 2262 ]; then
    `mv $file_online $file_offline >> /dev/null`
fi

exit 0

