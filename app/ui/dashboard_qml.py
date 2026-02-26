from pathlib import Path
from PyQt6.QtWidgets import QSizePolicy, QWidget, QVBoxLayout, QPushButton
from PyQt6.QtQuickWidgets import QQuickWidget
from PyQt6.QtCore import QObject, QUrl, pyqtSlot

from app.backend.dhi_backend import DHIBackend
from app.backend.weather_backend import WeatherBackend

# from app.backend.weather_backend import WeatherBackend
# from app.backend.dhi_backend import DHIBackend


class DashboardQmlPage(QWidget):
    def __init__(self, stacked, api_key: str, dhi_backend: DHIBackend):
        super().__init__()
        self.stacked = stacked
        self.setContentsMargins(0, 0, 0, 0)

        layout = QVBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(0)

        self.qml = QQuickWidget()
        self.qml.setResizeMode(QQuickWidget.ResizeMode.SizeRootObjectToView)
        self.qml.setSizePolicy(QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding)
        layout.addWidget(self.qml)

        #wire weather backend
        self.weather = WeatherBackend(api_key=api_key)
        print("WeatherBackend created with API key:", bool(api_key))
        
        self.qml.rootContext().setContextProperty("weatherBackend", self.weather)
        
        # 👇 SIMPLE BACK FUNCTION
        class SimpleNav(QObject):
            def __init__(self, stacked):
                super().__init__()
                self.stacked = stacked

            @pyqtSlot()
            def goBack(self):
                print("Back button clicked")
                self.stacked.setCurrentIndex(0)

        self.nav = SimpleNav(self.stacked)

        # register context properties BEFORE setSource
        self.qml.rootContext().setContextProperty("weatherBackend", self.weather)
        self.qml.rootContext().setContextProperty("nav", self.nav)
        self.qml.rootContext().setContextProperty("dhiBackend", dhi_backend) 
        
        # QML path
        qml_path = Path(__file__).resolve().parents[1] / "qml" / "Frame_1.ui.qml"
        qml_dir = qml_path.parent

        # Make QML find components/ and local imports
        self.qml.engine().addImportPath(str(qml_dir))
        self.qml.engine().addImportPath(str(qml_dir / "components"))

        self.qml.setSource(QUrl.fromLocalFile(str(qml_path)))
        
        if self.qml.status() != QQuickWidget.Status.Ready:
            print("Error loading QML:", self.qml.errors())
        else:
            print("QML loaded successfully.")
        #fetch initial weather data
        self.weather.refresh()