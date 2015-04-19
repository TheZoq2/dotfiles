from enum import Enum

#Status format 
#Desktop fullness
#Uppercase if the desktop is in focus

class DesktopStatus(Enum):
    EMPTY = 0
    FULL = 1
    URUGENT = 2

dStatusDict = {"f": DesktopStatus.EMPTY, "o": DesktopStatus.FULL, "u": DesktopStatus.URUGENT}

ICON_SAVE_PATH = "/tmp/barIcons"

class Vec2d:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __str__(self):
        return "({},{})".format(self.x, self.y)
