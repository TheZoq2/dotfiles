#!/bin/python

import Monitor
import subprocess
import style

#Locate screens
screens = Monitor.getMonitorSetup()

desktopsPerScreen = 7

for s in screens:
    #s.name = s.name.replace("\n", "")
    print(s.name)

    desktopList = []
    for i in range(desktopsPerScreen):
        desktopList.append(str(i+1) + "_" + s.getName())

    callList = ["bspc", "monitor", s.getName(), "-d"] + desktopList
    #Reset the desktops
    subprocess.call(callList, universal_newlines = True)
    print(callList)

#Add padding to the top to make room for  the bar
#subprocess.call(["bspc", "config", "right_padding", str(style.BAR_HEIGHT + style.BAR_PADDING * 2)])
