#!/bin/bash

dir_full=`pwd`
dir=`basename $dir_full`

/usr/bin/expect << EOF

set timeout 20
set commit $1
set passwd $2
spawn git add .
spawn git commit -m"$commit"
spawn git push https://github.com/wujiaming123/${dir}.git master
expect "'https://github.com':"
send "wujiaming123\n"
expect "'https://wujiaming123@github.com':"
send "${passwd}\n"
expect eof
EOF
