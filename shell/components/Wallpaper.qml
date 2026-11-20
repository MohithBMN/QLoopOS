import QtQuick
import QtQuick.Shapes
import QLoopOS.Shell

Item {
    id: root

    // Wallpaper configuration properties
    property string style: Theme.wallpaperStyle
    property color primaryTint: Theme.wallpaperTint
    property bool isDark: Theme.darkMode

    anchors.fill: parent

    // Base background tone
    Rectangle {
        anchors.fill: parent
        color: root.isDark ? "#080c14" : "#f4f6fa"

        // Smooth subtle linear transition
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: root.isDark ? "#0c1322" : "#f8fafc"
            }
            GradientStop {
                position: 0.55
                color: root.isDark ? "#090d16" : "#f1f5f9"
            }
            GradientStop {
                position: 1.0
                color: root.isDark ? "#050811" : "#e8edf5"
            }
        }
    }

    // Top-right ethereal ambient highlight (soft sky/azure glow)
    Rectangle {
        id: ambientGlowTop
        width: Math.min(parent.width * 0.95, 520)
        height: width
        radius: width / 2
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: -width * 0.35
        anchors.rightMargin: -width * 0.3

        color: root.isDark ? Qt.rgba(0.12, 0.20, 0.45, 0.18) : Qt.rgba(0.85, 0.90, 1.0, 0.45)
        opacity: 0.85
    }

    // Bottom-left soft warm ambient highlight (gentle pearl/lavender glow)
    Rectangle {
        id: ambientGlowBottom
        width: Math.min(parent.width * 0.85, 460)
        height: width
        radius: width / 2
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: -width * 0.3
        anchors.leftMargin: -width * 0.25

        color: root.isDark ? Qt.rgba(0.25, 0.12, 0.38, 0.15) : Qt.rgba(0.95, 0.90, 0.99, 0.40)
        opacity: 0.85
    }

    // Subtle curved geometric line accent for refined depth
    Shape {
        anchors.fill: parent
        opacity: root.isDark ? 0.06 : 0.08
        layer.enabled: true
        layer.samples: 4

        ShapePath {
            strokeColor: root.isDark ? "#93c5fd" : "#3b82f6"
            strokeWidth: 1.5
            fillColor: "transparent"
            capStyle: ShapePath.RoundCap

            startX: 0
            startY: root.height * 0.38

            PathCubic {
                x: root.width
                y: root.height * 0.22
                control1X: root.width * 0.4
                control1Y: root.height * 0.46
                control2X: root.width * 0.7
                control2Y: root.height * 0.16
            }
        }

        ShapePath {
            strokeColor: root.isDark ? "#c084fc" : "#8b5cf6"
            strokeWidth: 1.2
            fillColor: "transparent"
            capStyle: ShapePath.RoundCap

            startX: 0
            startY: root.height * 0.62

            PathCubic {
                x: root.width
                y: root.height * 0.78
                control1X: root.width * 0.35
                control1Y: root.height * 0.54
                control2X: root.width * 0.65
                control2Y: root.height * 0.86
            }
        }
    }
}
