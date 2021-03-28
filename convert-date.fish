#!/usr/bin/env fish
#

echo $argv[1] | gawk '{printf $1$3}' | python3 -c "import sys; import datetime; _datetime=datetime.datetime.strptime(input(), '%Y年%m月%d日%H:%M:%S'); print(_datetime.strftime('%Y-%m-%d.%H:%M'))"
