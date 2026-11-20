import QtQuick

QtObject {
    id: root

    // =========================================================================
    // SPACING SCALE (Linear 4pt / 8pt geometric progression)
    // =========================================================================
    readonly property real spaceNone: 0
    readonly property real space3xs: 2
    readonly property real space2xs: 4
    readonly property real spaceXs: 6
    readonly property real spaceSm: 8
    readonly property real spaceMd: 12
    readonly property real spaceLg: 16
    readonly property real spaceXl: 20
    readonly property real space2xl: 24
    readonly property real space3xl: 32
    readonly property real space4xl: 40
    readonly property real space5xl: 48
    readonly property real space6xl: 64

    // =========================================================================
    // COMPONENT PADDING TOKENS
    // =========================================================================
    // Standard button padding
    readonly property real paddingButtonH: 16
    readonly property real paddingButtonV: 9

    // Compact button / pill badge padding
    readonly property real paddingPillH: 12
    readonly property real paddingPillV: 5

    // Card internal padding
    readonly property real paddingCard: 16

    // Dialog & modal container padding
    readonly property real paddingDialog: 20

    // Floating dock padding
    readonly property real paddingDockH: 16
    readonly property real paddingDockV: 12

    // Status bar content margins
    readonly property real paddingStatusBarH: 18
    readonly property real paddingStatusBarV: 8

    // App grid row and column spacing
    readonly property real gridColumnSpacing: 12
    readonly property real gridRowSpacing: 14

    // =========================================================================
    // ICON DIMENSION TOKENS
    // =========================================================================
    readonly property real iconMicro: 12
    readonly property real iconXs: 14
    readonly property real iconSm: 16
    readonly property real iconMd: 20
    readonly property real iconLg: 24
    readonly property real iconXl: 32
    readonly property real iconDock: 54
    readonly property real iconApp: 62
    readonly property real iconHero: 80

    // =========================================================================
    // WINDOW & CARD GEOMETRY TOKENS
    // =========================================================================
    readonly property real windowDefaultWidth: 430
    readonly property real windowDefaultHeight: 860
    readonly property real windowMinWidth: 360
    readonly property real windowMinHeight: 560
    readonly property real dialogMinWidth: 280
    readonly property real dialogMaxWidth: 480
    readonly property real maxContentWidth: 680
    readonly property real dockHeight: 86
    readonly property real statusBarHeight: 40
    readonly property real navBarHeight: 52
    readonly property real homeIndicatorWidth: 134
    readonly property real homeIndicatorHeight: 5
}
