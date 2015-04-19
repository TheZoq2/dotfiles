import subprocess
import ctypes
from PIL import Image

icons = []
class CachedIcon:
    def __init__(self, windowID, size, filePath):
        self.windowID = windowID
        self.size = size;
        self.filePath = filePath


def getIcon(windowID):
    propOutput =  subprocess.check_output(["xprop", "-id", windowID, "-notype", "32c", "_NET_WM_ICON"], universal_newlines = True)
    
    #Strip all whitespace from the string
    stripped = propOutput.replace(" ", "")

    #remove the stuff before the first = sign
    stripped = stripped[stripped.find("=") + 1:]
    
    pixelList = stripped.split(",")
    
    #Read the first 2 chars to find the size of the icon
    iconSize = (int(pixelList[0]), int (pixelList[1]))

    pixelArray = []

    for pixel in pixelList:
        #Convert to integer
        pixelInt = int(pixel)

        b = ctypes.c_uint8(pixelInt).value
        g = ctypes.c_uint8(pixelInt>>8).value
        r = ctypes.c_uint8(pixelInt>>16).value
        a = ctypes.c_uint8(pixelInt>>24).value

        pixelArray.append((r,g,b,a))
    
    #Image.fromarray(pixelArray, mode="RGBA")

    icon = Image.new("RGBA", iconSize, color=(0,0,0,0))
    
    #icon.putpixel(pixelArray[0])
    for x in range(iconSize[0]):
        for y in range(iconSize[1]):
            pIndex = x * iconSize[0] + y

            icon.putpixel((y,x), pixelArray[pIndex])
    
    return icon

    
def saveIcon(windowID, size, path):
    for i in icons:
        if i.windowID == windowID and i.size == size:
            return i.filePath;

    #The icon needs to be created
    icon = getIcon(windowID)

    if icon.size != size:
        icon = icon.resize(size, Image.LANCZOS)
    
    filePath = "{}/{}{}{}.png".format(path, windowID, size[0], size[1])

    icon.save(filePath)

    icons.append(CachedIcon(windowID, size, filePath))
    return filePath

#icon = getIcon("0x140009D")
#icon = getIcon("0x1600003")
#icon = getIcon("0x1600082")
#icon = getIcon("0x180001B")
#icon = getIcon("0x15B9A54")

#icon.save("test.png");

