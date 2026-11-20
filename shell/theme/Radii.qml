import QtQuick

QtObject {
    id: root

    // =========================================================================
    // CORNER RADII TOKENS (Balanced, purposeful curvature)
    // =========================================================================
    // Sharp corners (e.g. separator lines, crisp edges)
    readonly property real none: 0

    // Extra small: Fine indicator dots, small badge corners, selection boxes
    readonly property real xs: 4

    // Small: Compact chips, tags, status pills, small buttons
    readonly property real sm: 8

    // Medium: Standard text inputs, list item selection, menu rows, cards
    readonly property real md: 12

    // Large: Main content cards, dialog containers, primary buttons
    readonly property real lg: 16

    // Extra large: Prominent modal sheets, system popups
    readonly property real xl: 22

    // Double extra large: Floating dock pill, bottom action sheets
    readonly property real xxl: 28

    // Full / Pill: Continuous capsule ends, circular action buttons
    readonly property real full: 9999

    // =========================================================================
    // APPLICATION SQUIRCLE GEOMETRY
    // =========================================================================
    // Superellipse ratio for continuous modern mobile icon curvature
    readonly property real appIconCurvatureRatio: 0.28
    // Default corner radius for standard 62px app icon
    readonly property real appIconCorner: 17.36
    // Corner radius for dock 54px icon
    readonly property real dockIconCorner: 15.12

    // =========================================================================
    // BORDER WIDTH & SEPARATOR GEOMETRY
    // =========================================================================
    readonly property real borderThin: 1.0
    readonly property real borderMedium: 1.5
    readonly property real borderThick: 2.0
    readonly property real dividerThickness: 1.0
}
