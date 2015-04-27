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

#Constants for configuration
COMM_PORT = 6723

def getDesktopsOnMonitor(statusString, monitorName):
    desktopList = []

    #Finding the start and end of the monitor status
    monitorStart = statusString.find(monitorName)
    #Finding end of monitor. This is hard because new monitors start with 'm' or 'M' but monacle layout is
    #also indicated with an m. This means we have to find monitors in some other way. 
    #All montior names have a - in them which means we can look for those
    monitorEnd = statusString.find("-", monitorStart + len(monitorName))

    #Get a substring of the monitor string
    monitorString = statusString[monitorStart:monitorEnd]

    #Find individual pieces
    monitorSplit = monitorString.split(":")

    #We now have an array with the current desktop layout on the monitor.
    #The first element is the name of the monitor itself which we don't want to use. The last two elements
    #are the layout and the start of the next monitor. Im not interested in those either
    monitorInfo = monitorSplit[1:-2]
    
    for mi in monitorInfo:
        dFocused = False

        #Get the status of the monitor
        
        #the first character is the status of the desktop
        desktopChar = mi[0]
        lc = desktopChar.lower()

        #finding the status of the desktop
        dStatus = dStatusDict[lc]

        if desktopChar.isupper():
            dFocused = True
        
        #The rest of the string is the desktop name
        dName = mi[1:]

        #Adding the desktop to the list
        desktopList.append(Desktop(dName, dStatus, dFocused))

    return desktopList


def createBarForMonitor(monitor):
    size = monitor.getSize()
    pos = monitor.getPos()

    pos.x = pos.x + style.BAR_PADDING
    pos.y = pos.y + style.BAR_PADDING
    size.x = size.x - style.BAR_PADDING * 2
    size.y = style.BAR_HEIGHT

    barPosCmd = "{}x{}+{}+{}".format(size.x,size.y,pos.x,pos.y)

    #Open the bar creation script
    subprocess.Popen(["./createPanel.sh", barPosCmd, style.BAR_BG])

def getBatteryStats():
    acpiOut = subprocess.check_output(["acpi", "--battery"], universal_newlines=True)
    acpiOut = acpiOut[:-1] # Strip newline

    acpiSplit = acpiOut.split(" ")
    
    return acpiSplit[3]
    

def generateGlobalInfo():
    infoFormated = Lemon.LemonTextFormat()

    #battery
    infoFormated.addText(getBatteryStats())
    infoFormated.addText("  ")
    #fetch the time
    #time format (year, month, day, hour, minutes, seconds, miliseconds?)

    #timeString = "{0} {1}  {2}:{3}".format(cTimeTupple[1], monthName, cTimeTupple[4], cTimeTupple[5])
    #batteryString = subprocess.check_output("acpi", "--battery", "|", "cut", "-d,", "-f2")
    timeString = time.strftime("%B %d  %H:%M")

    infoFormated.addText(timeString)

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

