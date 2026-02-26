from PyQt6.QtCore import QObject, pyqtSignal, pyqtProperty

class WeatherModel(QObject):
    tempChanged = pyqtSignal()
    dayChanged = pyqtSignal()
    dateTimeChanged = pyqtSignal()
    conditionChanged = pyqtSignal()

    def __init__(self, api_key: str):
        super().__init__()
        self.api_key = api_key
        self._temp = "—°C"
        self._day = "—"
        self._date_time = "—"
        self._condition = "—"

    def getTemp(self): return self._temp
    def setTemp(self, v):
        if self._temp != v:
            self._temp = v
            self.tempChanged.emit()

    def getDay(self): return self._day
    def setDay(self, v):
        if self._day != v:
            self._day = v
            self.dayChanged.emit()

    def getDateTime(self): return self._date_time
    def setDateTime(self, v):
        if self._date_time != v:
            self._date_time = v
            self.dateTimeChanged.emit()

    def getCondition(self): return self._condition
    def setCondition(self, v):
        if self._condition != v:
            self._condition = v
            self.conditionChanged.emit()

    temp = pyqtProperty(str, fget=getTemp, fset=setTemp, notify=tempChanged)
    day = pyqtProperty(str, fget=getDay, fset=setDay, notify=dayChanged)
    dateTime = pyqtProperty(str, fget=getDateTime, fset=setDateTime, notify=dateTimeChanged)
    condition = pyqtProperty(str, fget=getCondition, fset=setCondition, notify=conditionChanged)