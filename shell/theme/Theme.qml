pragma Singleton
import QtQuick

QtObject {
    id: theme

    // =========================================================================
    // SYSTEM THEME STATE
    // =========================================================================
    // Primary mode toggle (light by default)
    property bool darkMode: false

    // Adaptive brand accent color (customizable by user or extracted from wallpaper)
    property color accentColor: "#3b82f6"

    // Active wallpaper preset
    property string wallpaperStyle: "aurora"

    // =========================================================================
    // MODULAR DESIGN SYSTEM TOKENS (Design System 1.0)
    // =========================================================================
    readonly property Colors colors: Colors {
        darkMode: theme.darkMode
        accentColor: theme.accentColor
    }

    readonly property Typography typography: Typography {}

    readonly property Spacing spacing: Spacing {}

    readonly property Radii radii: Radii {}

    readonly property Materials materials: Materials {
        darkMode: theme.darkMode
    }

    readonly property Motion motion: Motion {}

    readonly property Icons icons: Icons {
        darkMode: theme.darkMode
    }

    // =========================================================================
    // BACKWARD COMPATIBILITY ALIASES (Preserving 100% existing shell API)
    // =========================================================================
    // Backgrounds & Surfaces
    readonly property color background: colors.backgroundPrimary
    readonly property color backgroundGradientStart: colors.backgroundGradientStart
    readonly property color backgroundGradientEnd: colors.backgroundGradientEnd
    readonly property color surface: colors.surfacePrimary
    readonly property color surfaceElevated: colors.surfaceElevated
    readonly property color surfaceTranslucent: colors.surfaceTranslucent
    readonly property color surfaceSubtle: colors.surfaceSubtle

    // Dock
    readonly property color dockBackground: colors.dockBackground
    readonly property color dockBorder: colors.dockBorder
    readonly property color dockShadow: colors.dockShadow

    // Text & Content
    readonly property color textPrimary: colors.textPrimary
    readonly property color textSecondary: colors.textSecondary
    readonly property color textMuted: colors.textMuted
    readonly property color textSubtle: colors.textSubtle
    readonly property color textOnAccent: colors.textOnAccent

    // Brand Accents
    readonly property color accent: colors.accentPrimary
    readonly property color accentHover: colors.accentHover
    readonly property color accentSoft: colors.accentSubtle
    readonly property color success: colors.success
    readonly property color warning: colors.warning
    readonly property color danger: colors.danger

    // Dividers & Highlights
    readonly property color divider: colors.divider
    readonly property color highlightBorder: colors.borderHighlight
    readonly property color controlBorder: colors.controlBorder

    // Status Bar
    readonly property color statusBarText: colors.statusBarText
    readonly property color statusBarIcon: colors.statusBarIcon

    // Typography
    readonly property string fontFamily: typography.fontFamily
    readonly property int fontHero: typography.largeDisplay
    readonly property int fontTitle: typography.pageHeading
    readonly property int fontSection: typography.sectionHeading
    readonly property int fontSubtitle: typography.title
    readonly property int fontBody: typography.body
    readonly property int fontCaption: typography.caption
    readonly property int fontSizeCaption: typography.caption
    readonly property int fontMini: typography.micro

    // Geometry & Radiuses
    readonly property real radiusTiny: radii.xs
    readonly property real radiusSmall: radii.sm
    readonly property real radiusMedium: radii.md
    readonly property real radiusLarge: radii.lg
    readonly property real radiusPill: radii.full
    readonly property real iconCornerRadius: radii.appIconCorner
    readonly property real iconStandardSize: spacing.iconApp

    // Animation Durations
    readonly property int animInstant: motion.durationInstant
    readonly property int animFast: motion.durationFast
    readonly property int animNormal: motion.durationNormal
    readonly property int animSlow: motion.durationSlow

    // Wallpaper Tint
    readonly property color wallpaperTint: darkMode ? "#1e1b4b" : "#e0e7ff"
}
