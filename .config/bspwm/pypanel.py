#!/bin/python

import subprocess
import re
from enum import Enum
import multiprocessing.connection
import time
import datetime
import iconExtractor
import util
import Monitor
import style
import Lemon
import config

#Constants for configuration
COMM_PORT = 6723

def createBarForMonitor(monitor):
    size = monitor.getSize()
    pos = monitor.getPos()

    pos.x = pos.x + style.BAR_PADDING
    pos.y = pos.y + style.BAR_PADDING
    size.x = size.x - style.BAR_PADDING * 2
    size.y = style.BAR_HEIGHT

    barPosCmd = "{}x{}+{}+{}".format(size.x,size.y,pos.x,pos.y)

    print(barPosCmd)

    #Open the bar creation script
    subprocess.Popen(["./createPanel.sh", barPosCmd, style.BAR_BG])

def getBatteryStats():
    acpiOut = subprocess.check_output(["acpi", "--battery"], universal_newlines=True)
    acpiOut = acpiOut[:-1] # Strip newline

    acpiSplit = acpiOut.split(" ")
    
    return acpiSplit[3]
    

def generateGlobalInfo():
    infoFormated = Lemon.LemonTextFormat()

    #battery display
    if config.DISPLAY_BATTERY:
        infoFormated.addText(getBatteryStats(), fgColor = style.BAR_TEXT_COLOR)
        infoFormated.addText("  ")

    #timeString = "{0} {1}  {2}:{3}".format(cTimeTupple[1], monthName, cTimeTupple[4], cTimeTupple[5])
    #batteryString = subprocess.check_output("acpi", "--battery", "|", "cut", "-d,", "-f2")
    timeString = time.strftime("%B %d  %H:%M")

    infoFormated.addText(timeString, fgColor = style.BAR_TEXT_COLOR)

    return infoFormated.getText()



def waitForClient(listener):
    return listener.accept()


def main():
    monitors = Monitor.getMonitorSetup();

    subprocess.call(["mkdir", "-p", util.ICON_SAVE_PATH])
    
    #Starting the server that sends data to the panels
    address = ("localhost", COMM_PORT)
    listener = multiprocessing.connection.Listener(address)
    
    for monitor in monitors:
        createBarForMonitor(monitor)
        #Waiting for the new monitor client to connect
        client = waitForClient(listener)
        
        monitor.setServerConnection(client)

    while True:
        time.sleep(0.1)
        globalInfoString = generateGlobalInfo()
        
        #Get the status string from bspwm
        statusString = subprocess.check_output(["bspc", "control", "--get-status"], universal_newlines = True)

        for monitor in monitors:
            monitor.sendFullPanelInfo(statusString, globalInfoString)
        
main()

