from PyQt6.QtWidgets import (
    QMainWindow, QWidget, QVBoxLayout, QPushButton, QStackedWidget, QLabel
)
from PyQt6.QtCore import Qt

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

        self.stacked = QStackedWidget()
        self.stacked.setContentsMargins(0, 0, 0, 0)
        layout.addWidget(self.stacked)

        # ----- Page 0: Home -----
        home = QWidget()
        home_layout = QVBoxLayout(home)

        title = QLabel("Main Window / Home")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)

        btn_dashboard = QPushButton("Go to Dashboard")
        btn_dashboard.clicked.connect(lambda: self.stacked.setCurrentIndex(1))

        home_layout.addWidget(title)
        home_layout.addWidget(btn_dashboard, alignment=Qt.AlignmentFlag.AlignCenter)
        home_layout.addStretch()

        # ----- Page 1: Dashboard (QML) -----  ← pass dhi_backend here
        dashboard = DashboardQmlPage(self.stacked, api_key=api_key, dhi_backend=dhi_backend)

        self.stacked.addWidget(home)       # index 0
        self.stacked.addWidget(dashboard)  # index 1