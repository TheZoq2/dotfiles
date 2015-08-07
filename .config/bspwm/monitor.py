import subprocess
from util import Vec2d
from Lemon import LemonTextFormat
import Lemon
import style

class Monitor:
    def __init__(self, name, size, pos):
        self.size = size
        self.name = name
        self.pos = pos
        self.desktops = []

    def getName(self):
        return self.name

    def getSize(self):
        return self.size
    
    def getPos(self):
        return self.pos

    def __str__(self):
        return self.name + " -- s:" + self.size.__str__() + " p:" + self.pos.__str__()
    
    def addDesktop(self, desktop):
        self.desktops.append(desktop)

    def setServerConnection(self, conn):
        self.conn = conn

    def getServerConnection(self):
        return self.conn

    def sendPanelString(self, msg):
        self.conn.send(msg)

    def sendFullPanelInfo(self, statusString, globalInfoString):
        desktopString = self.createDesktopString(statusString)

        panelText = Lemon.LemonTextFormat()

        panelText.addText(desktopString)
        panelText.addParam("B", BAR_BG)

        #panelText.addParam("I", "/home/frans/Downloads/Test.png")


        #Add active programs
        panelText.setRestCentered()
        panelText.addText(self.createWindowString())

        #Add global info
        #Right align
        panelText.setRestRight()
        panelText.addText(globalInfoString)

        self.sendPanelString(panelText.getText())


    def createDesktopString(self, statusString):
        panelText = LemonTextFormat()
        
        desktops = self.getDesktops(statusString)
        
        #Go through all the desktops and set the appropriate colors for them
        for d in desktops:
            color = dStatusColorDict[d.getStatus()]
            fgColor = dStatusFGDict[d.getStatus()]
            underline = "-"
            hasUnderline = False;
            if d.getFocused():
                underline = dFocusedUnderline
                hasUnderline = True

            #Formating strings that contain { } is fun
            #dString = "%{{F{3}}}%{{B{0}}}%{{+u}}%{{U{1}}}{2}%{{-u}} ".format(color, underline, d.getName(), fgColor)
            panelText.addText(d.getName(), fgColor=fgColor, bgColor=color, underlineColor=underline, underline=hasUnderline)
            #add some padding
            panelText.addText(" ")
        
        return panelText.getText()


    def createWindowString(self):
        lemonText = Lemon.LemonTextFormat()

        windows = self.getWindows()
        
        for window in windows:
            iconPath = iconExtractor.saveIcon(window, ICON_SIZE, ICON_SAVE_PATH)
            
            lemonText.addText(" ")
            lemonText.addParam("I", iconPath)
            lemonText.addText(" ")

        return lemonText.getText()



    def getDesktops(self, statusString):
        desktopList = []

        #Finding the start and end of the monitor status
        monitorStart = statusString.find(self.name)
        #Finding end of monitor. This is hard because new monitors start with 'm' or 'M' but monacle layout is
        #also indicated with an m. This means we have to find monitors in some other way. 
        #All montior names have a - in them which means we can look for those
        monitorEnd = statusString.find("-", monitorStart + len(self.name))

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
    
    def getWindows(self):
        #Query bspc for windows on the focused desktop of the monitor
        fDesktop = subprocess.check_output(["bspc", "query", "-W", "-d", "{}:focused".format(self.name)], universal_newlines = True)
        
        #Remove the last \n in the string
        fDesktop = fDesktop[:-1]

        #If there are no windows. Works based on window names being 0x...
        if fDesktop.find("x") == -1:
            return []

        windows = fDesktop.split("\n")
        
        return windows



def getMonitorSetup():
    monitors = [];

    #Find monitor layout using xrandr
    xrandrResult = subprocess.check_output(["xrandr"], universal_newlines=True)

    #Look for the usefull parts of that data
    xrandrSplit = xrandrResult.split("\n")
    for line in xrandrSplit:
        if line.find(" connected") != -1:
            #extracting the info we are interested in
            #output format is: monitorName connected WxH+X+Y...
            words = line.split(" ")
            
            name = words[0]

            #Extracting the dimensions of the monitor
            dim = words[2].split("+")
            
            sizeStr = dim[0].split("x")
            width = int(sizeStr[0])
            height = int(sizeStr[1])

            posX = int(dim[1])
            posY = int(dim[2])

            monitor = Monitor(name, Vec2d(width,height), Vec2d(posX,posY))
            monitors.append(monitor)

    return monitors
