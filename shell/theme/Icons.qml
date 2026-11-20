import QtQuick

QtObject {
    id: root

    property bool darkMode: false

    // =========================================================================
    // ICON SYSTEM SPECIFICATIONS
    // =========================================================================

    // Grid Coordinates
    readonly property real gridBaseSize: 24.0
    readonly property real gridLiveArea: 20.0
    readonly property real gridMargin: 2.0

    // Stroke Thickness
    readonly property real strokeThin: 1.5
    readonly property real strokeStandard: 2.0
    readonly property real strokeBold: 2.5

    // Application Icon Curvature (Continuous superellipse squircle)
    readonly property real appIconCurvatureRatio: 0.28

    // Semantic Icon Color Mapping
    readonly property color colorPrimary: darkMode ? "#f8fafc" : "#0f172a"
    readonly property color colorSecondary: darkMode ? "#94a3b8" : "#475569"
    readonly property color colorMuted: darkMode ? "#64748b" : "#94a3b8"
    readonly property color colorSubtle: darkMode ? "#334155" : "#cbd5e1"
    readonly property color colorAccent: "#3b82f6"
    readonly property color colorOnAccent: "#ffffff"

    // Status Colors for Glyphs
    readonly property color colorSuccess: "#10b981"
    readonly property color colorWarning: "#f59e0b"
    readonly property color colorDanger: "#ef4444"
    readonly property color colorInfo: "#0284c7"
}
