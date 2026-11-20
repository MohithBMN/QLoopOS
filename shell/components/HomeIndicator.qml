import QtQuick
import QLoopOS.Shell

Item {
    id: root

    width: 140
    height: 16
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 6

    signal clicked()

    Rectangle {
        id: indicatorBar
        anchors.centerIn: parent
        width: 134
        height: 5
        radius: 2.5
        color: Theme.darkMode ? Qt.rgba(1, 1, 1, 0.45) : Qt.rgba(0.1, 0.15, 0.25, 0.35)

        scale: mouseArea.containsPress ? 0.92 : (mouseArea.containsMouse ? 1.08 : 1.0)
        opacity: mouseArea.containsMouse ? 0.85 : 0.60

        Behavior on scale {
            NumberAnimation { duration: Theme.animFast; easing.type: Easing.OutCubic }
        }
        Behavior on opacity {
            NumberAnimation { duration: Theme.animFast }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            root.clicked();
        }
    }
}
