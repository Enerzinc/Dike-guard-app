from PyQt6.QtCore import QFileSystemWatcher, QObject, pyqtSignal, pyqtProperty, pyqtSlot
from PyQt6.QtGui import QColor
import json
import os


class DHIBackend(QObject):
    stationCountChanged = pyqtSignal()
    selectedStationChanged = pyqtSignal(int)
    percentChanged=pyqtSignal()

    def __init__(self, json_path: str = "data.json"):
        super().__init__()
        self._percent = 0
        self._json_path = json_path
        
        # default json if not exists
        if not os.path.exists(self._json_path):
            self._write_default()
            
        # load initial data
        self._load_json()
        # watch file for changes (in a real app, consider using watchdog or similar)
        self._watcher = QFileSystemWatcher([self._json_path])
        self._watcher.fileChanged.connect(self._on_file_changed)
        
    # file watching
    def _on_file_changed(self, path: str):
        self._load_json()
        #re-add to watcher (some platforms require this)
        if path not in self._watcher.files():
            self._watcher.addPath(path)
    def _load_json(self):
        try:
            with open(self._json_path, "r") as f:
                data = json.load(f)
            self.percent = data.get("percent", 0)
        except (json.JSONDecodeError, FileNotFoundError) as e:
            print(f"Error loading JSON: {e}")
    def _write_default(self):
        with open(self._json_path, "w") as f:
            json.dump({"percent": 0}, f, indent=2)

    # ── percent ────────────────────────────────────────────────────
    @pyqtProperty(int, notify=percentChanged)
    def percent(self):
        return self._percent

    @percent.setter
    def percent(self, value: int):
        value = max(0, min(100, int(value)))
        if self._percent != value:
            self._percent = value
            self.percentChanged.emit()

    # ── derived colour & label ─────────────────────────────────────
    @pyqtProperty(str, notify=percentChanged)
    def progressColor(self):
        return self._level_from_percent(self._percent)[1]

    @pyqtProperty(str, notify=percentChanged)
    def progressLabel(self):
        return self._level_from_percent(self._percent)[0]

    # ── internal helper ────────────────────────────────────────────
    def _level_from_percent(self, p: int) -> tuple[str, str]:
        if p >= 80:
            return "Good condition",    "#0B3D0B"
        elif p >= 60:
            return "Low Severity",      "#1E8E1E"
        elif p >= 40:
            return "Moderate Severity", "#F2C94C"
        elif p >= 20:
            return "High Severity",     "#E53935"
        else:
            return "Extreme Severity",  "#7F0000"