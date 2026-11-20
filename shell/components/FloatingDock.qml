import QtQuick
import QtQuick.Layouts
import QLoopOS.Shell

Item {
    id: root

    height: 86
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 26

    signal appSelected(var appData)

    // Primary dock applications
    readonly property var dockApps: [
        { id: "phone", name: "Phone", start: "#10b981", end: "#059669" },
        { id: "messages", name: "Messages", start: "#3b82f6", end: "#1d4ed8" },
        { id: "browser", name: "Browser", start: "#06b6d4", end: "#0284c7" },
        { id: "camera", name: "Camera", start: "#475569", end: "#1e293b" }
    ]

    // Dock container width adapts smoothly to item count
    width: Math.min(parent.width - 32, (dockApps.length * 68) + 36)

    // Dock background shadow
    Rectangle {
        anchors.fill: parent
        anchors.topMargin: 4
        radius: 28
        color: Theme.dockShadow
    }

    // Frosted Glass Dock Container
    Rectangle {
        id: dockPill
        anchors.fill: parent
        radius: 28
        color: Theme.dockBackground
        border.color: Theme.dockBorder
        border.width: 1

        // Subtle top glass highlight
        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 1
            height: parent.height * 0.45
            radius: 27
            color: Qt.rgba(1, 1, 1, 0.18)
        }

        // Horizontal Row of Dock Icons
        Row {
            anchors.centerIn: parent
            spacing: 16

            Repeater {
                model: root.dockApps

                AppIcon {
                    appId: modelData.id
                    name: modelData.name
                    gradientStart: modelData.start
                    gradientEnd: modelData.end
                    iconSize: 54
                    showLabel: false
                    isDockItem: true

                    onClicked: {
                        root.appSelected(modelData);
                    }
                }
            }
        }
    }
}
