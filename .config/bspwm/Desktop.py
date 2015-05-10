
class Desktop:
    def __init__(self, name, status, focused):
        self.name = name
        self.status = status
        self.focused = focused

    def getName(self):
        return self.name
    def getStatus(self):
        return self.status
    def getFocused(self):
        return self.focused

