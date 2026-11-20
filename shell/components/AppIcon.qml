import QtQuick
import QtQuick.Shapes
import QLoopOS.Shell

Item {
    id: root

    property string appId: "generic"
    property string name: "App"
    property real iconSize: Theme.iconStandardSize
    property color gradientStart: "#3b82f6"
    property color gradientEnd: "#1d4ed8"
    property bool showLabel: true
    property bool isDockItem: false

    signal clicked()

    width: showLabel ? Math.max(iconSize + 16, 76) : iconSize
    height: showLabel ? (iconSize + 26) : iconSize

    // Icon Container
    Item {
        id: iconContainer
        width: root.iconSize
        height: root.iconSize
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top

        // Subtle drop shadow under icon
        Rectangle {
            anchors.fill: parent
            anchors.topMargin: 4
            radius: root.iconSize * 0.28
            color: root.isDockItem ? Qt.rgba(0, 0, 0, 0.12) : Qt.rgba(0.05, 0.08, 0.18, 0.14)
            opacity: mouseArea.containsPress ? 0.05 : (mouseArea.containsMouse ? 0.25 : 0.15)
            scale: mouseArea.containsPress ? 0.90 : 1.0

            Behavior on scale {
                NumberAnimation { duration: Theme.animFast; easing.type: Easing.OutCubic }
            }
            Behavior on opacity {
                NumberAnimation { duration: Theme.animFast }
            }
        }

        // Main Icon Body (Squircle with gradient)
        Rectangle {
            id: iconBody
            anchors.fill: parent
            radius: root.iconSize * 0.28
            clip: true

            gradient: Gradient {
                GradientStop { position: 0.0; color: root.gradientStart }
                GradientStop { position: 1.0; color: root.gradientEnd }
            }

            // Top highlight reflection
            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                height: parent.height * 0.45
                radius: parent.radius
                color: Qt.rgba(1, 1, 1, 0.16)
            }

            // Subtle outer border highlight
            Rectangle {
                anchors.fill: parent
                radius: parent.radius
                color: "transparent"
                border.color: Qt.rgba(1, 1, 1, 0.30)
                border.width: 1
            }

            // Vector Glyphs (Original geometric designs — NO EMOJIS)
            Item {
                anchors.fill: parent

                // PHONE GLYPH
                Shape {
                    visible: root.appId === "phone"
                    anchors.centerIn: parent
                    width: parent.width * 0.52
                    height: parent.height * 0.52
                    layer.enabled: true
                    layer.samples: 4

                    ShapePath {
                        strokeColor: "#ffffff"
                        strokeWidth: 2.8
                        fillColor: "transparent"
                        capStyle: ShapePath.RoundCap
                        joinStyle: ShapePath.RoundJoin

                        startX: parent.width * 0.22
                        startY: parent.height * 0.25
                        PathLine { x: parent.width * 0.38; y: parent.height * 0.22 }
                        PathLine { x: parent.width * 0.44; y: parent.height * 0.38 }
                        PathLine { x: parent.width * 0.34; y: parent.height * 0.46 }
                        PathCubic {
                            x: parent.width * 0.54
                            y: parent.height * 0.66
                            control1X: parent.width * 0.38
                            control1Y: parent.height * 0.58
                            control2X: parent.width * 0.44
                            control2Y: parent.height * 0.62
                        }
                        PathLine { x: parent.width * 0.62; y: parent.height * 0.56 }
                        PathLine { x: parent.width * 0.78; y: parent.height * 0.62 }
                        PathLine { x: parent.width * 0.75; y: parent.height * 0.78 }
                    }
                }

                // MESSAGES GLYPH
                Item {
                    visible: root.appId === "messages"
                    anchors.centerIn: parent
                    width: parent.width * 0.54
                    height: parent.height * 0.50

                    Rectangle {
                        anchors.fill: parent
                        radius: width * 0.35
                        color: "#ffffff"

                        // Speech tail
                        Shape {
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.bottomMargin: -2
                            anchors.leftMargin: 2
                            width: 10
                            height: 8
                            ShapePath {
                                fillColor: "#ffffff"
                                strokeWidth: 0
                                startX: 0
                                startY: 0
                                PathLine { x: 8; y: 0 }
                                PathLine { x: 0; y: 7 }
                                PathLine { x: 0; y: 0 }
                            }
                        }

                        // Message dots
                        Row {
                            anchors.centerIn: parent
                            spacing: 3
                            Repeater {
                                model: 3
                                Rectangle {
                                    width: 4
                                    height: 4
                                    radius: 2
                                    color: "#3b82f6"
                                }
                            }
                        }
                    }
                }

                // BROWSER GLYPH
                Item {
                    visible: root.appId === "browser"
                    anchors.centerIn: parent
                    width: parent.width * 0.54
                    height: parent.height * 0.54

                    Rectangle {
                        anchors.fill: parent
                        radius: width / 2
                        color: "transparent"
                        border.color: "#ffffff"
                        border.width: 2.2
                    }

                    // Latitude lines
                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width * 0.94
                        height: 2.2
                        color: "#ffffff"
                    }

                    // Longitude ellipse
                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width * 0.48
                        height: parent.height
                        radius: width / 2
                        color: "transparent"
                        border.color: "#ffffff"
                        border.width: 1.8
                    }

                    // Pointer needle
                    Shape {
                        anchors.centerIn: parent
                        width: parent.width * 0.5
                        height: parent.height * 0.5
                        ShapePath {
                            fillColor: "#ef4444"
                            strokeWidth: 0
                            startX: parent.width * 0.5
                            startY: parent.height * 0.1
                            PathLine { x: parent.width * 0.7; y: parent.height * 0.5 }
                            PathLine { x: parent.width * 0.5; y: parent.height * 0.4 }
                            PathLine { x: parent.width * 0.5; y: parent.height * 0.1 }
                        }
                        ShapePath {
                            fillColor: "#ffffff"
                            strokeWidth: 0
                            startX: parent.width * 0.5
                            startY: parent.height * 0.9
                            PathLine { x: parent.width * 0.3; y: parent.height * 0.5 }
                            PathLine { x: parent.width * 0.5; y: parent.height * 0.6 }
                            PathLine { x: parent.width * 0.5; y: parent.height * 0.9 }
                        }
                    }
                }

                // CAMERA GLYPH
                Item {
                    visible: root.appId === "camera"
                    anchors.centerIn: parent
                    width: parent.width * 0.54
                    height: parent.height * 0.44

                    Rectangle {
                        anchors.fill: parent
                        radius: 7
                        color: "transparent"
                        border.color: "#ffffff"
                        border.width: 2.2

                        // Top bump
                        Rectangle {
                            anchors.top: parent.top
                            anchors.topMargin: -4
                            anchors.left: parent.left
                            anchors.leftMargin: 8
                            width: 10
                            height: 4
                            radius: 2
                            color: "#ffffff"
                        }

                        // Lens outer ring
                        Rectangle {
                            anchors.centerIn: parent
                            width: parent.height * 0.68
                            height: width
                            radius: width / 2
                            color: "transparent"
                            border.color: "#ffffff"
                            border.width: 2
                        }

                        // Lens inner reflection
                        Rectangle {
                            anchors.centerIn: parent
                            width: parent.height * 0.32
                            height: width
                            radius: width / 2
                            color: "#38bdf8"
                        }

                        // Flash dot
                        Rectangle {
                            anchors.top: parent.top
                            anchors.topMargin: 4
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            width: 3.5
                            height: 3.5
                            radius: 2
                            color: "#fbbf24"
                        }
                    }
                }

                // GALLERY GLYPH
                Item {
                    visible: root.appId === "gallery"
                    anchors.centerIn: parent
                    width: parent.width * 0.52
                    height: parent.height * 0.48

                    // Sun
                    Rectangle {
                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.topMargin: 2
                        anchors.rightMargin: 4
                        width: 7
                        height: 7
                        radius: 3.5
                        color: "#fef08a"
                    }

                    // Mountains
                    Shape {
                        anchors.fill: parent
                        ShapePath {
                            fillColor: "#ffffff"
                            strokeWidth: 0
                            startX: 0
                            startY: parent.height
                            PathLine { x: parent.width * 0.4; y: parent.height * 0.35 }
                            PathLine { x: parent.width * 0.7; y: parent.height * 0.7 }
                            PathLine { x: parent.width; y: parent.height * 0.45 }
                            PathLine { x: parent.width; y: parent.height }
                            PathLine { x: 0; y: parent.height }
                        }
                    }
                }

                // MUSIC GLYPH
                Item {
                    visible: root.appId === "music"
                    anchors.centerIn: parent
                    width: parent.width * 0.50
                    height: parent.height * 0.54

                    Shape {
                        anchors.fill: parent
                        layer.enabled: true
                        layer.samples: 4

                        // Beamed eighth note
                        ShapePath {
                            strokeColor: "#ffffff"
                            strokeWidth: 2.4
                            fillColor: "#ffffff"
                            capStyle: ShapePath.RoundCap
                            joinStyle: ShapePath.RoundJoin

                            startX: parent.width * 0.28
                            startY: parent.height * 0.72
                            PathArc {
                                x: parent.width * 0.36
                                y: parent.height * 0.88
                                radiusX: 5; radiusY: 4
                            }
                            PathArc {
                                x: parent.width * 0.28
                                y: parent.height * 0.72
                                radiusX: 5; radiusY: 4
                            }
                            PathLine { x: parent.width * 0.36; y: parent.height * 0.22 }
                            PathLine { x: parent.width * 0.78; y: parent.height * 0.14 }
                            PathLine { x: parent.width * 0.78; y: parent.height * 0.62 }
                        }

                        // Right notehead
                        ShapePath {
                            fillColor: "#ffffff"
                            strokeWidth: 0
                            startX: parent.width * 0.70
                            startY: parent.height * 0.62
                            PathArc {
                                x: parent.width * 0.78
                                y: parent.height * 0.78
                                radiusX: 5; radiusY: 4
                            }
                            PathArc {
                                x: parent.width * 0.70
                                y: parent.height * 0.62
                                radiusX: 5; radiusY: 4
                            }
                        }
                    }
                }

                // FILES GLYPH
                Item {
                    visible: root.appId === "files"
                    anchors.centerIn: parent
                    width: parent.width * 0.54
                    height: parent.height * 0.46

                    Shape {
                        anchors.fill: parent
                        ShapePath {
                            fillColor: "#ffffff"
                            strokeWidth: 0
                            startX: 0
                            startY: 4
                            PathLine { x: parent.width * 0.38; y: 4 }
                            PathLine { x: parent.width * 0.48; y: 8 }
                            PathLine { x: parent.width; y: 8 }
                            PathLine { x: parent.width; y: parent.height }
                            PathLine { x: 0; y: parent.height }
                            PathLine { x: 0; y: 4 }
                        }

                        // Front folded sheet
                        ShapePath {
                            fillColor: Qt.rgba(1, 1, 1, 0.82)
                            strokeWidth: 0
                            startX: 0
                            startY: 10
                            PathLine { x: parent.width; y: 10 }
                            PathLine { x: parent.width * 0.94; y: parent.height }
                            PathLine { x: parent.width * 0.06; y: parent.height }
                            PathLine { x: 0; y: 10 }
                        }
                    }
                }

                // SETTINGS GLYPH
                Item {
                    visible: root.appId === "settings"
                    anchors.centerIn: parent
                    width: parent.width * 0.52
                    height: parent.height * 0.52

                    // Central gear circle
                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width * 0.70
                        height: width
                        radius: width / 2
                        color: "transparent"
                        border.color: "#ffffff"
                        border.width: 3.5
                    }

                    // Inner hollow
                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width * 0.28
                        height: width
                        radius: width / 2
                        color: "#ffffff"
                    }

                    // 4 Gear cross teeth
                    Repeater {
                        model: 4
                        Rectangle {
                            anchors.centerIn: parent
                            width: 4
                            height: parent.height * 0.98
                            radius: 1.5
                            color: "#ffffff"
                            rotation: index * 45
                        }
                    }
                }

                // CALENDAR GLYPH
                Item {
                    visible: root.appId === "calendar"
                    anchors.centerIn: parent
                    width: parent.width * 0.52
                    height: parent.height * 0.52

                    Rectangle {
                        anchors.fill: parent
                        radius: 6
                        color: "#ffffff"
                        clip: true

                        // Red header strip
                        Rectangle {
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.right: parent.right
                            height: parent.height * 0.32
                            color: "#dc2626"
                        }

                        // Date numeral
                        Text {
                            anchors.centerIn: parent
                            anchors.verticalCenterOffset: 4
                            text: Qt.formatDateTime(new Date(), "d")
                            color: "#1e293b"
                            font.family: Theme.fontFamily
                            font.pixelSize: 13
                            font.weight: Font.Bold
                        }
                    }
                }

                // CLOCK GLYPH
                Item {
                    visible: root.appId === "clock"
                    anchors.centerIn: parent
                    width: parent.width * 0.54
                    height: parent.height * 0.54

                    Rectangle {
                        anchors.fill: parent
                        radius: width / 2
                        color: "#0f172a"
                        border.color: "#ffffff"
                        border.width: 2.2

                        // Center pin
                        Rectangle {
                            anchors.centerIn: parent
                            width: 3.5
                            height: 3.5
                            radius: 2
                            color: "#f59e0b"
                        }

                        // Hour hand (pointing to 10)
                        Rectangle {
                            x: parent.width / 2 - 1
                            y: parent.height * 0.28
                            width: 2
                            height: parent.height * 0.24
                            color: "#ffffff"
                            transformOrigin: Item.Bottom
                            rotation: -60
                        }

                        // Minute hand (pointing to 2)
                        Rectangle {
                            x: parent.width / 2 - 0.75
                            y: parent.height * 0.18
                            width: 1.5
                            height: parent.height * 0.34
                            color: "#ffffff"
                            transformOrigin: Item.Bottom
                            rotation: 50
                        }
                    }
                }

                // CALCULATOR GLYPH
                Item {
                    visible: root.appId === "calculator"
                    anchors.centerIn: parent
                    width: parent.width * 0.50
                    height: parent.height * 0.50

                    Grid {
                        anchors.centerIn: parent
                        columns: 2
                        spacing: 3

                        Rectangle {
                            width: 10; height: 10; radius: 2; color: Qt.rgba(1, 1, 1, 0.25)
                            Text { anchors.centerIn: parent; text: "+"; color: "#ffffff"; font.pixelSize: 9; font.bold: true }
                        }
                        Rectangle {
                            width: 10; height: 10; radius: 2; color: Qt.rgba(1, 1, 1, 0.25)
                            Text { anchors.centerIn: parent; text: "−"; color: "#ffffff"; font.pixelSize: 9; font.bold: true }
                        }
                        Rectangle {
                            width: 10; height: 10; radius: 2; color: Qt.rgba(1, 1, 1, 0.25)
                            Text { anchors.centerIn: parent; text: "×"; color: "#ffffff"; font.pixelSize: 9; font.bold: true }
                        }
                        Rectangle {
                            width: 10; height: 10; radius: 2; color: "#ffffff"
                            Text { anchors.centerIn: parent; text: "="; color: "#d97706"; font.pixelSize: 9; font.bold: true }
                        }
                    }
                }

                // WEATHER GLYPH
                Item {
                    visible: root.appId === "weather"
                    anchors.centerIn: parent
                    width: parent.width * 0.54
                    height: parent.height * 0.52

                    // Sun behind cloud
                    Rectangle {
                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.topMargin: 2
                        anchors.rightMargin: 4
                        width: 13
                        height: 13
                        radius: 6.5
                        color: "#fbbf24"
                    }

                    // Cloud silhouette
                    Shape {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.bottomMargin: 2
                        width: parent.width * 0.85
                        height: parent.height * 0.55

                        ShapePath {
                            fillColor: "#ffffff"
                            strokeWidth: 0
                            startX: 4
                            startY: parent.height
                            PathArc { x: parent.width * 0.45; y: 4; radiusX: 8; radiusY: 8 }
                            PathArc { x: parent.width; y: parent.height * 0.5; radiusX: 6; radiusY: 6 }
                            PathLine { x: parent.width; y: parent.height }
                            PathLine { x: 4; y: parent.height }
                        }
                    }
                }
            }
        }

        // Scale feedback on hover/press
        scale: mouseArea.containsPress ? 0.92 : (mouseArea.containsMouse ? 1.05 : 1.0)

        Behavior on scale {
            NumberAnimation {
                duration: mouseArea.containsPress ? Theme.animFast : Theme.animNormal
                easing.type: Easing.OutBack
            }
        }
    }

    // App Label
    Text {
        id: labelText
        visible: root.showLabel
        anchors.top: iconContainer.bottom
        anchors.topMargin: 6
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        elide: Text.ElideRight

        text: root.name
        color: Theme.textPrimary
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontCaption
        font.weight: Font.Medium

        // Subtle drop shadow for high readability against wallpaper
        Rectangle {
            z: -1
            anchors.centerIn: parent
            width: parent.contentWidth + 6
            height: parent.contentHeight + 2
            radius: 3
            color: Theme.darkMode ? Qt.rgba(0, 0, 0, 0.45) : Qt.rgba(1, 1, 1, 0.45)
            opacity: 0.6
        }
    }

    // Interactive MouseArea
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
