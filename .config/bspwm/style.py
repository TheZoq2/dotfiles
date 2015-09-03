import util

#BAR_BG = "#11FFFFFF"
BAR_BG = "#ff333333"

DESKTOP_FOCUSED = "#ff222222"

dStatusColorDict = { util.DesktopStatus.EMPTY: BAR_BG, util.DesktopStatus.URUGENT: BAR_BG, util.DesktopStatus.FULL: BAR_BG}
dStatusFGDict = { util.DesktopStatus.EMPTY: "#ffaaaaaa", util.DesktopStatus.URUGENT: "#ff7777ff", util.DesktopStatus.FULL: "#FFFFFFFF"}

dFocusedUnderline = "#FFAAAAFF"

fallbackIcon = "media/default.png"

BAR_HEIGHT = 25;
BAR_PADDING = 0;
BAR_PADDING_SIDES = 0;
ICON_SIZE = (BAR_HEIGHT - 8, BAR_HEIGHT - 8)

