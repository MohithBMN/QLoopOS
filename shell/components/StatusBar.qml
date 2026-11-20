import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import QLoopOS.Shell

Item {
    id: root

    height: 40
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top

    // Simulated prototype telemetry state
    // In production, these properties will bind to hardware services (e.g. UPower, NetworkManager)
    property string simulatedCarrier: "QLoop 5G"
    property int simulatedWifiLevel: 3 // 0 to 3
    property int simulatedBatteryPercent: 86
    property bool simulatedBatteryCharging: false
    property int simulatedVolumePercent: 70
    property bool simulatedVolumeMuted: false

    // System clock update
    property var currentTime: new Date()

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            root.currentTime = new Date();
        }
    }

    // Background overlay (subtle translucency if placed over content)
    Rectangle {
        anchors.fill: parent
        color: "transparent"
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 18
        anchors.rightMargin: 18
        spacing: 12

        // Left section: Clock & Date
        RowLayout {
            spacing: 8
            Layout.alignment: Qt.AlignVCenter

            // Current Time (e.g. "17:42")
            Text {
                text: Qt.formatDateTime(root.currentTime, "hh:mm")
                color: Theme.statusBarText
                font.family: Theme.fontFamily
                font.pixelSize: 13
                font.weight: Font.DemiBold
            }

            // Separator dot
            Rectangle {
                implicitWidth: 3
                implicitHeight: 3
                radius: 1.5
                color: Theme.textMuted
                Layout.alignment: Qt.AlignVCenter
            }

            // Current Date (e.g. "Thu, Nov 20")
            Text {
                text: Qt.formatDateTime(root.currentTime, "ddd, MMM d")
                color: Theme.textSecondary
                font.family: Theme.fontFamily
                font.pixelSize: 12
                font.weight: Font.Normal
            }
        }

        Item {
            Layout.fillWidth: true
        }

        // Right section: Status indicators
        RowLayout {
            spacing: 12
            Layout.alignment: Qt.AlignVCenter

            // Cellular signal & network indicator
            RowLayout {
                spacing: 4
                Layout.alignment: Qt.AlignVCenter

                Text {
                    text: root.simulatedCarrier
                    color: Theme.textSecondary
                    font.family: Theme.fontFamily
                    font.pixelSize: 11
                    font.weight: Font.Medium
                }

                // Cellular 4-bar indicator
                Row {
                    spacing: 1.5
                    Layout.alignment: Qt.AlignVCenter

                    Repeater {
                        model: 4
                        Rectangle {
                            required property int index
                            width: 2.5
                            height: 4 + (index * 2.2)
                            radius: 1
                            anchors.bottom: parent.bottom
                            color: index < 3 ? Theme.statusBarIcon : Theme.textSubtle
                        }
                    }
                }
            }

            // Wi-Fi glyph (reusable geometric arcs)
            Item {
                implicitWidth: 17
                implicitHeight: 13
                Layout.alignment: Qt.AlignVCenter

                Shape {
                    anchors.fill: parent
                    layer.enabled: true
                    layer.samples: 4

                    // Outer arc
                    ShapePath {
                        strokeColor: root.simulatedWifiLevel >= 3 ? Theme.statusBarIcon : Theme.textSubtle
                        strokeWidth: 1.6
                        fillColor: "transparent"
                        capStyle: ShapePath.RoundCap

                        startX: 1
                        startY: 3
                        PathQuad {
                            x: 16
                            y: 3
                            controlX: 8.5
                            controlY: -2
                        }
                    }

                    // Middle arc
                    ShapePath {
                        strokeColor: root.simulatedWifiLevel >= 2 ? Theme.statusBarIcon : Theme.textSubtle
                        strokeWidth: 1.6
                        fillColor: "transparent"
                        capStyle: ShapePath.RoundCap

                        startX: 4
                        startY: 7
                        PathQuad {
                            x: 13
                            y: 7
                            controlX: 8.5
                            controlY: 3.5
                        }
                    }

                    // Base signal dot
                    ShapePath {
                        strokeColor: root.simulatedWifiLevel >= 1 ? Theme.statusBarIcon : Theme.textSubtle
                        fillColor: root.simulatedWifiLevel >= 1 ? Theme.statusBarIcon : Theme.textSubtle
                        strokeWidth: 0

                        startX: 7
                        startY: 11.5
                        PathArc {
                            x: 10
                            y: 11.5
                            radiusX: 1.5
                            radiusY: 1.5
                        }
                        PathArc {
                            x: 7
                            y: 11.5
                            radiusX: 1.5
                            radiusY: 1.5
                        }
                    }
                }
            }

            // Volume indicator (click to toggle mute in prototype)
            Item {
                implicitWidth: 15
                implicitHeight: 14
                Layout.alignment: Qt.AlignVCenter

                Shape {
                    anchors.fill: parent
                    layer.enabled: true
                    layer.samples: 4

                    // Speaker body
                    ShapePath {
                        strokeColor: Theme.statusBarIcon
                        fillColor: Theme.statusBarIcon
                        strokeWidth: 0.5
                        joinStyle: ShapePath.RoundJoin

                        startX: 1
                        startY: 5
                        PathLine { x: 4; y: 5 }
                        PathLine { x: 8; y: 2 }
                        PathLine { x: 8; y: 12 }
                        PathLine { x: 4; y: 9 }
                        PathLine { x: 1; y: 9 }
                        PathLine { x: 1; y: 5 }
                    }

                    // Sound wave arc (or mute cross)
                    ShapePath {
                        strokeColor: root.simulatedVolumeMuted ? Theme.danger : Theme.statusBarIcon
                        strokeWidth: 1.3
                        fillColor: "transparent"
                        capStyle: ShapePath.RoundCap

                        startX: 11
                        startY: root.simulatedVolumeMuted ? 4 : 4.5
                        PathLine {
                            x: root.simulatedVolumeMuted ? 14 : 13
                            y: root.simulatedVolumeMuted ? 10 : 7
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        root.simulatedVolumeMuted = !root.simulatedVolumeMuted;
                    }
                }
            }

            // Battery indicator
            RowLayout {
                spacing: 5
                Layout.alignment: Qt.AlignVCenter

                Text {
                    text: root.simulatedBatteryPercent + "%"
                    color: Theme.statusBarText
                    font.family: Theme.fontFamily
                    font.pixelSize: 11
                    font.weight: Font.DemiBold
                }

                // Battery body
                Item {
                    implicitWidth: 22
                    implicitHeight: 12
                    Layout.alignment: Qt.AlignVCenter

                    Rectangle {
                        anchors.fill: parent
                        radius: 3
                        color: "transparent"
                        border.color: Theme.statusBarIcon
                        border.width: 1.2

                        // Fill meter
                        Rectangle {
                            x: 2
                            y: 2
                            height: parent.height - 4
                            width: Math.max(2, (parent.width - 4) * (root.simulatedBatteryPercent / 100))
                            radius: 1.5
                            color: root.simulatedBatteryPercent < 20 ? Theme.danger : (root.simulatedBatteryPercent < 35 ? Theme.warning : Theme.success)
                        }
                    }

                    // Positive terminal knob
                    Rectangle {
                        x: parent.width + 1
                        anchors.verticalCenter: parent.verticalCenter
                        width: 1.5
                        height: 5
                        radius: 0.75
                        color: Theme.statusBarIcon
                    }
                }
            }
        }
    }
}
