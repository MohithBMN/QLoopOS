import QtQuick
import QtQuick.Layouts
import QLoopOS.Shell

Item {
    id: root

    signal appSelected(var appData)

    // Application registry data
    readonly property var appList: [
        { id: "phone", name: "Phone", start: "#10b981", end: "#059669" },
        { id: "messages", name: "Messages", start: "#3b82f6", end: "#1d4ed8" },
        { id: "browser", name: "Browser", start: "#06b6d4", end: "#0284c7" },
        { id: "camera", name: "Camera", start: "#475569", end: "#1e293b" },
        { id: "gallery", name: "Gallery", start: "#f97316", end: "#ea580c" },
        { id: "music", name: "Music", start: "#ec4899", end: "#d946ef" },
        { id: "files", name: "Files", start: "#6366f1", end: "#4338ca" },
        { id: "settings", name: "Settings", start: "#64748b", end: "#334155" },
        { id: "calendar", name: "Calendar", start: "#ef4444", end: "#b91c1c" },
        { id: "clock", name: "Clock", start: "#0f172a", end: "#1e293b" },
        { id: "calculator", name: "Calculator", start: "#f59e0b", end: "#d97706" },
        { id: "weather", name: "Weather", start: "#0ea5e9", end: "#38bdf8" }
    ]

    // Responsive columns: 4 columns in portrait, 6 in wide/landscape
    readonly property int columnsCount: root.width > 620 ? 6 : 4
    readonly property real cellWidth: Math.floor(root.width / columnsCount)
    readonly property real cellHeight: 96

    // Adaptive Grid
    Grid {
        id: grid
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        columns: root.columnsCount
        columnSpacing: 0
        rowSpacing: 14

        Repeater {
            model: root.appList

            Item {
                width: root.cellWidth
                height: root.cellHeight

                AppIcon {
                    anchors.centerIn: parent
                    appId: modelData.id
                    name: modelData.name
                    gradientStart: modelData.start
                    gradientEnd: modelData.end
                    iconSize: root.width < 380 ? 56 : Theme.iconStandardSize

                    onClicked: {
                        root.appSelected(modelData);
                    }
                }
            }
        }
    }
}
