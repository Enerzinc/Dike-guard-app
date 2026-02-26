import QtQuick
import QtQuick.Window

Window {
    visible: true
    title: "DikeGuard"

    Loader {
        anchors.fill: parent
        source: "Frame_1.ui.qml"
    }
}