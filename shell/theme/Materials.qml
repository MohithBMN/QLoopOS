import QtQuick

QtObject {
    id: root

    property bool darkMode: false

    // =========================================================================
    // MATERIAL TOKENS (Liquid-glass, specular depth & physical surfaces)
    // =========================================================================

    // Solid Surface Material: Opaque base cards and window contents
    readonly property color solidSurfaceBackground: darkMode ? "#161f30" : "#ffffff"
    readonly property color solidSurfaceBorder: darkMode ? Qt.rgba(1, 1, 1, 0.08) : Qt.rgba(0, 0, 0, 0.06)

    // Elevated Surface Material: Menus, context flyouts, search dropdowns
    readonly property color elevatedSurfaceBackground: darkMode ? "#243046" : "#ffffff"
    readonly property color elevatedSurfaceBorder: darkMode ? Qt.rgba(1, 1, 1, 0.12) : Qt.rgba(0, 0, 0, 0.08)

    // Frosted Glass Material: Semi-translucent panels with subtle specular highlights
    readonly property color frostedGlassBackground: darkMode ? Qt.rgba(0.09, 0.12, 0.19, 0.78) : Qt.rgba(1, 1, 1, 0.82)
    readonly property color frostedGlassBorder: darkMode ? Qt.rgba(1, 1, 1, 0.14) : Qt.rgba(1, 1, 1, 0.85)

    // Floating Glass Material: Mobile dock, top navigation bar, floating pills
    readonly property color floatingGlassBackground: darkMode ? Qt.rgba(0.12, 0.16, 0.24, 0.72) : Qt.rgba(1, 1, 1, 0.72)
    readonly property color floatingGlassBorder: darkMode ? Qt.rgba(1, 1, 1, 0.16) : Qt.rgba(1, 1, 1, 0.88)

    // Specular Reflection: Top highlight shine for glass edges
    readonly property color specularHighlight: darkMode ? Qt.rgba(1, 1, 1, 0.10) : Qt.rgba(1, 1, 1, 0.22)
    readonly property real specularHighlightHeightRatio: 0.45

    // Soft Shadow Parameters (Optimized for Intel UHD Graphics performance)
    readonly property color shadowAmbient: darkMode ? Qt.rgba(0, 0, 0, 0.35) : Qt.rgba(0.08, 0.12, 0.22, 0.10)
    readonly property color shadowElevated: darkMode ? Qt.rgba(0, 0, 0, 0.45) : Qt.rgba(0.06, 0.10, 0.20, 0.14)
    readonly property real shadowOffsetY: 4.0
    readonly property real shadowBlurRadius: 18.0

    // Backdrop Scrim: Dimmer for modal focus
    readonly property color scrimBackground: darkMode ? Qt.rgba(0, 0, 0, 0.65) : Qt.rgba(15, 23, 42, 0.35)
}
