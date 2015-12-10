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

    pos.x = pos.x + style.BAR_PADDING_SIDES
    pos.y = pos.y + style.BAR_PADDING
    size.x = size.x - style.BAR_PADDING_SIDES * 2
    size.y = style.BAR_HEIGHT

    barPosCmd = "{}x{}+{}+{}".format(size.x,size.y,pos.x,pos.y)

    print(barPosCmd)

    #Open the bar creation script
    subprocess.Popen(["./createPanel.sh", barPosCmd, style.BAR_BG])

def createTintForMonitor(monitorIndex):
    subprocess.Popen(["./createTint.sh", "{}".format(monitorIndex), "&"])

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

    #createTintForMonitor(0);
    monitorIndex = 1;
    for monitor in monitors:
        print(monitorIndex);
        monitorIndex += 1

        
print("Starting main")
main()

