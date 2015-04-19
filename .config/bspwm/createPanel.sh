#!/bin/bash

#FONTS=-*-roboto-*-r-normal--15-*-*-*-*-*-*-uni
#FONTS="UnifrakturCook-Bold-20"
#FONTS="FreeSans Bold - 15"
#FONTS="Iceland:pixelsize=5"

#Finding fonts is done by gtk2fontsel. When a good font is found. do fc-list | grep <font name>
FONTS="Thabit:pixelsize=16:Bold"

python3 pyBarEcho.py | lemonbar -g $1 -B $2 -f $FONTS -u 2
#echo "Hello world" | lemonbar -g $1 -B $2 -p
