from PyQt6.QtWidgets import (
    QMainWindow, QSizePolicy, QWidget, QVBoxLayout, QPushButton, QStackedWidget, QLabel
)
from PyQt6.QtCore import Qt, QUrl, pyqtSlot
from PyQt6.QtQuickWidgets import QQuickWidget
from pathlib import Path

from app.backend.dhi_backend import DHIBackend
from app.ui.dashboard_qml import DashboardQmlPage


class MainWindow(QMainWindow):
    def __init__(self, api_key: str, dhi_backend: DHIBackend):
        super().__init__()
        self.setWindowTitle("DikeGuard")
        self.setMinimumSize(1200, 700)

        root = QWidget()
        self.setCentralWidget(root)

        layout = QVBoxLayout(root)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(0)

        # QStackedWidget to hold multiple pages
        self.stacked = QStackedWidget()
        self.stacked.setSizePolicy(QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding)
        layout.addWidget(self.stacked)

        # ----- Page 0: Home -----
        home = QQuickWidget()
        qml_path = Path(__file__).resolve().parents[1] / "qml" / "Main_Window.ui.qml"
        qml_dir = qml_path.parent
        
        home.engine().addImportPath(str(qml_dir))
        home.setSource(QUrl.fromLocalFile(str(qml_path)))
        home.setResizeMode(QQuickWidget.ResizeMode.SizeRootObjectToView)
        home.setSizePolicy(QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding)

        # ----- Page 1: Dashboard (QML) -----  ← pass dhi_backend here
        dashboard = DashboardQmlPage(self.stacked, api_key=api_key, dhi_backend=dhi_backend)

        self.stacked.addWidget(home)       # index 0
        self.stacked.addWidget(dashboard)  # index 1
        
        # Force connect after everything is added — no statusChanged needed
        self._connect_home_signals(home)

    def _connect_home_signals(self, home: QQuickWidget):
        root = home.rootObject()
        
        if root is None:
            return
        
        root.goToDashboard.connect(self._go_to_dashboard)

    def _go_to_dashboard(self):
        self.stacked.setCurrentIndex(1)