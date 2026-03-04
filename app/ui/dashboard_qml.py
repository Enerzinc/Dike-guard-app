from pathlib import Path
from PyQt6.QtWidgets import QSizePolicy, QWidget, QVBoxLayout
from PyQt6.QtQuickWidgets import QQuickWidget
from PyQt6.QtCore import QUrl

from app.backend.dhi_backend import DHIBackend
from app.backend.weather_backend import WeatherBackend


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

        # Wire weather backend
        self.weather = WeatherBackend(api_key=api_key)
        print("WeatherBackend created with API key:", bool(api_key))

        # Register context properties BEFORE setSource
        self.qml.rootContext().setContextProperty("weatherBackend", self.weather)
        self.qml.rootContext().setContextProperty("dhiBackend", dhi_backend)

        # QML path
        qml_path = Path(__file__).resolve().parents[1] / "qml" / "Dashboard.ui.qml"
        qml_dir = qml_path.parent

        self.qml.engine().addImportPath(str(qml_dir))
        self.qml.engine().addImportPath(str(qml_dir / "components"))

        self.qml.setSource(QUrl.fromLocalFile(str(qml_path)))

        if self.qml.status() != QQuickWidget.Status.Ready:
            print("❌ Error loading QML:", self.qml.errors())
        else:
            print("✅ QML loaded successfully.")
            # ✅ Same pattern — connect immediately after setSource since it's already Ready
            self._connect_dashboard_signals()

        # Fetch initial weather data
        self.weather.refresh()

    def _connect_dashboard_signals(self):
        root = self.qml.rootObject()

        if root is None:
            print("rootObject is None")
            return
        root.goToMain.connect(self._go_to_main)


    def _go_to_main(self):
        self.stacked.setCurrentIndex(0)
    
    # Override closeEvent/hideEvent to clear backends before QML tears down
    def closeEvent(self, event):
        self._clear_backends()
        super().closeEvent(event)

    # Also handle when the parent window is destroyed
    def __del__(self):
        try:
            self._clear_backends()
        except Exception:
            pass

    def _clear_backends(self):
        try:
            # Set all context properties to None before QML destroys
            self.qml.rootContext().setContextProperty("dhiBackend", None)
            self.qml.rootContext().setContextProperty("weatherBackend", None)
        except Exception as e:
            print(f"⚠️ Could not clear backends: {e}")