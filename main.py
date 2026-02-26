import sys
import os
from dotenv import load_dotenv
from PyQt6.QtWidgets import QApplication
from app.ui.main_window import MainWindow
from app.backend.dhi_backend import DHIBackend


load_dotenv()
API_KEY = os.getenv("OPENWEATHER_API_KEY", "")


def main() -> int:
    app = QApplication(sys.argv)

    BASE_DIR = os.path.dirname(os.path.abspath(__file__))
    JSON_PATH = os.path.join(BASE_DIR, "data.json")
    dhi_backend = DHIBackend(json_path=JSON_PATH)

    w = MainWindow(api_key=API_KEY, dhi_backend=dhi_backend)
    w.showMaximized()
    return app.exec()

if __name__ == "__main__":
    raise SystemExit(main())