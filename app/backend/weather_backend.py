from datetime import datetime

import requests
from PyQt6.QtCore import QObject, QTimer, pyqtSignal, pyqtSlot, pyqtProperty



class WeatherBackend(QObject):
    tempChanged = pyqtSignal(str)
    dayChanged = pyqtSignal(str)
    dateTimeChanged = pyqtSignal(str)
    iconUrlChanged = pyqtSignal(str)
    errorChanged = pyqtSignal(str)
    
    def __init__(self, api_key: str, city="San Fernando, PH", units="metric"):
        super().__init__()
        self.api_key = api_key
        self.city = city
        self.units = units
        
        self._temp = "—°C"
        self._day = "—"
        self._dateTime = "—"
        self._iconUrl = ""
        
        # auto-refresh every 10 minutes
        self._timer = QTimer()
        self._timer.setInterval(10 * 60 * 1000)
        self._timer.timeout.connect(self.refresh)
        self._timer.start()
        
    # ✅ clock update every second
        self._clock_timer = QTimer()
        self._clock_timer.setInterval(1000)
        self._clock_timer.timeout.connect(self._update_clock)
        self._clock_timer.start()
    
    @pyqtProperty(str, notify=tempChanged)
    def temp(self):
        return self._temp

    @pyqtProperty(str, notify=dayChanged)
    def day(self):
        return self._day

    @pyqtProperty(str, notify=dateTimeChanged)
    def dateTime(self):
        return self._dateTime

    @pyqtProperty(str, notify=iconUrlChanged)
    def iconUrl(self):
        return self._iconUrl
    
    @pyqtSlot()
    def _update_clock(self):
        now = datetime.now()
        new_day = now.strftime("%A")
        new_dt = now.strftime("%Y-%m-%d %H:%M:%S")

        if self._day != new_day:
            self._day = new_day
            self.dayChanged.emit(self._day)

        if self._dateTime != new_dt:
            self._dateTime = new_dt
            self.dateTimeChanged.emit(self._dateTime)
    def refresh(self):
        print("Refreshing weather data...")
        print("api key present:", bool(self.api_key))
        if not self.api_key:
            print("No API key provided for WeatherBackend.")
            self.errorChanged.emit("Missing API key.")
            return

        try:
            r = requests.get(
                "https://api.openweathermap.org/data/2.5/weather",
                params={"q": self.city, "units": self.units, "appid": self.api_key},
                timeout=10
            )
            data = r.json()

            if str(data.get("cod", "200")) != "200":
                self.errorChanged.emit(data.get("message", "API error"))
                return

            self.errorChanged.emit("")

            self._temp = f'{data["main"]["temp"]:.1f}°C'
            
            icon = data["weather"][0]["icon"]
            self._iconUrl = f"http://openweathermap.org/img/wn/{icon}@2x.png"
            
            print("===emittings===")
            print("Temp:", self._temp)
            print("Day:", self._day)
            print("DateTime:", self._dateTime) 
            print("Icon URL:", self._iconUrl)
            
            self.tempChanged.emit(self._temp)
            self.iconUrlChanged.emit(self._iconUrl)
            
        except Exception as e:
            print("Error fetching weather data:", e)
            self.errorChanged.emit(str(e))