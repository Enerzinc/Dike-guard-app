import QtQuick
import QtQuick.Window

Window {
    visible: true
    title: "DikeGuard"

    Loader {
        anchors.fill: parent
        source: "Dashboard.ui.qml"
    }
}