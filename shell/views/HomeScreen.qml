import QtQuick
import QtQuick.Layouts
import QLoopOS.Shell

Item {
    id: root

    anchors.fill: parent

    signal launchApp(var appData)

    // Current time for widget
    property var currentTime: new Date()

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            root.currentTime = new Date();
        }
    }

    // Wallpaper Background
    Wallpaper {
        id: wallpaper
    }

    // Top Status Bar
    StatusBar {
        id: statusBar
        z: 10
    }

    // Main Content Column
    Item {
        anchors.top: statusBar.bottom
        anchors.bottom: dock.top
        anchors.left: parent.left
        anchors.right: parent.right

        // Homescreen Widget (Time, Date, Weather Pill)
        ColumnLayout {
            id: widgetContainer
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: root.height < 650 ? 12 : 28
            spacing: 4

            // Large Hero Clock
            Text {
                text: Qt.formatDateTime(root.currentTime, "hh:mm")
                color: Theme.textPrimary
                font.family: Theme.fontFamily
                font.pixelSize: root.height < 650 ? 36 : Theme.fontHero
                font.weight: Font.DemiBold
                Layout.alignment: Qt.AlignHCenter
            }

            // Date text
            Text {
                text: Qt.formatDateTime(root.currentTime, "dddd, MMMM d")
                color: Theme.textSecondary
                font.family: Theme.fontFamily
                font.pixelSize: root.height < 650 ? 12 : Theme.fontBody
                font.weight: Font.Normal
                Layout.alignment: Qt.AlignHCenter
            }

            // Weather pill badge
            Rectangle {
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 6
                width: weatherRow.implicitWidth + 20
                height: 24
                radius: 12
                color: Theme.surfaceTranslucent
                border.color: Theme.highlightBorder
                border.width: 1

                RowLayout {
                    id: weatherRow
                    anchors.centerIn: parent
                    spacing: 6

                    // Weather glyph dot
                    Rectangle {
                        width: 7
                        height: 7
                        radius: 3.5
                        color: "#f59e0b"
                    }

                    Text {
                        text: "22°C · Partly Cloudy"
                        color: Theme.textSecondary
                        font.family: Theme.fontFamily
                        font.pixelSize: 11
                        font.weight: Font.Medium
                    }
                }
            }
        }

        // Application Grid Container (Adaptive)
        Flickable {
            id: gridFlickable
            anchors.top: widgetContainer.bottom
            anchors.topMargin: root.height < 650 ? 14 : 28
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: Math.max(12, (width - Math.min(width, 680)) / 2)
            anchors.rightMargin: anchors.leftMargin
            contentWidth: width
            contentHeight: appGrid.implicitHeight + 20
            clip: true
            boundsBehavior: Flickable.StopAtBounds

            AppGrid {
                id: appGrid
                width: parent.width
                implicitHeight: 330

                onAppSelected: function(appData) {
                    root.launchApp(appData);
                }
            }
        }
    }

    // Floating Bottom Dock
    FloatingDock {
        id: dock
        z: 10
        onAppSelected: function(appData) {
            root.launchApp(appData);
        }
    }

    // Bottom Home Indicator
    HomeIndicator {
        id: homeIndicator
        z: 20
    }
}
