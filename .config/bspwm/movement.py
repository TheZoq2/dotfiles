#!/bin/python

import subprocess
import sys

def windowIsFocused():
    print("Checking window")
    try:
        query = subprocess.check_output(["bspc", "query", "-W", "-w", "focused"])
    except subprocess.CalledProcessError:
        query = "\n"
    
    #Remove endline
    query = query[1:]

    if(query == ""):
        return False
    return True

def moveDir(direction):
    if getWindowExistsDir(direction):
        subprocess.call(["bspc", "window", "focused", "-s", direction])
    elif getMonitorExistsDir(direction):
        subprocess.call(["bspc", "window", "focused", "-m", direction])

def focusDir(direction):
    print("Testing")
    #If the currently focused desktop is empty
    if not windowIsFocused():
        #Focus on the next monitor
        subprocess.call(["bspc", "monitor", "focused", "-f", direction])

        print("Running")
        
        #We don't want to do window stuff now
        return

    #If there is a window that can be focused
    if getWindowExistsDir(direction):
        subprocess.call(["bspc", "window", "focused", "-f", direction])
    elif getMonitorExistsDir(direction):
        subprocess.call(["bspc", "monitor", "focused", "-f", direction])
    
    #No monitor or window to focus to, exit
        

def getWindowExistsDir(direction):
    try:
        query = subprocess.check_output(["bspc", "query", "-W", "-w", direction], universal_newlines=True)
    except subprocess.CalledProcessError:
        #For some reason, query exits with statuscode 1 if it fails to locate a window
        query = "\n"
        pass
    
    #Remove last endline
    query = query[1:]

    #No windows
    if query == "":
        return False

    return True


def getMonitorExistsDir(direction):
    try:
        query = subprocess.check_output(["bspc", "query", "-M", "-m", direction], universal_newlines=True)
    except subprocess.CalledProcessError:
        #For some reason, query exits with statuscode 1 if it fails to locate a window
        query = "\n"
        pass
    #Remove endline
    query = query[1:]

    if(query == ""):
        return False
    return True

if len(sys.argv) == 3:
    if sys.argv[1] == "focus":
        focusDir(sys.argv[2])

    if sys.argv[1] == "move":
        moveDir(sys.argv[2])
else:
    print("Specify command and direction")
