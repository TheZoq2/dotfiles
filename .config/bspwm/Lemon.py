
class LemonTextFormat:
    def __init__(self):
        self.cString = ""

    def addParam(self, paramName, paramValue):
        self.cString += "%{{{0}{1}}}".format(paramName, paramValue)
    
    def addText(self, text, bgColor="-", fgColor="-", underlineColor="-", underline=False):
        self.addParam("B", bgColor)
        self.addParam("F", fgColor)
        self.addParam("U", underlineColor)
        
        if underline:
            self.addParam("+u", "")

        self.cString += text

    def getText(self):
        return self.cString
    
    def setRestCentered(self):
        self.addParam("c","")

    def setRestRight(self):
        self.addParam("r","")
