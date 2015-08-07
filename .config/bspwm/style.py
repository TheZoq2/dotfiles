import util

LIGHT_THEME = True

BAR_TEXT_COLOR = "#ffffff"
BAR_BG = "#88222222"

dStatusColorDict = { util.DesktopStatus.EMPTY: BAR_BG, util.DesktopStatus.URUGENT: BAR_BG, util.DesktopStatus.FULL: BAR_BG}
dStatusFGDict = { util.DesktopStatus.EMPTY: "#ffaaaaaa", util.DesktopStatus.URUGENT: "#ff7777ff", util.DesktopStatus.FULL: "#FFFFFFFF"}

dFocusedUnderline = "#FFAAAAFF"

fallbackIcon = "media/default.png"

BAR_HEIGHT = 20;
BAR_PADDING = 5;
ICON_SIZE = (BAR_HEIGHT - 4, BAR_HEIGHT - 4)

if LIGHT_THEME:
    BAR_BG = "#FFFFFF"
    BAR_TEXT_COLOR = "#000000"
    
    dStatusColorDict = { util.DesktopStatus.EMPTY: BAR_BG, util.DesktopStatus.URUGENT: BAR_BG, util.DesktopStatus.FULL: BAR_BG}
    dStatusFGDict = { util.DesktopStatus.EMPTY: "#444444", util.DesktopStatus.URUGENT: "#990000", util.DesktopStatus.FULL: "#000000"}
    
    dFocusedUnderline = "#FF0000"

