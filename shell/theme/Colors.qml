import QtQuick

QtObject {
    id: root

    // Theme Mode Inputs
    property bool darkMode: false
    property color accentColor: "#3b82f6"

    // =========================================================================
    // 1. NEUTRAL FOUNDATION & BACKGROUNDS
    // =========================================================================
    // Primary background for base windows and main canvas
    readonly property color backgroundPrimary: darkMode ? "#0b0f17" : "#f8fafc"
    // Secondary background for inset containers, grouping zones, and side panels
    readonly property color backgroundSecondary: darkMode ? "#111827" : "#f1f5f9"
    // Tertiary background for deeply nested elements or contrasting sections
    readonly property color backgroundTertiary: darkMode ? "#1e293b" : "#e2e8f0"
    // Canvas background under layered floating surfaces
    readonly property color canvas: darkMode ? "#070a10" : "#edf2f7"

    // Gradient definitions for wallpaper and atmospheric backgrounds
    readonly property color backgroundGradientStart: darkMode ? "#0f172a" : "#f8fafc"
    readonly property color backgroundGradientEnd: darkMode ? "#050811" : "#edf2f7"

    // =========================================================================
    // 2. SURFACES & CARDS
    // =========================================================================
    // Primary surface for cards, list items, and standard controls
    readonly property color surfacePrimary: darkMode ? "#161f30" : "#ffffff"
    // Secondary surface for slightly differentiated nested cards
    readonly property color surfaceSecondary: darkMode ? "#1e293b" : "#f8fafc"
    // Elevated surface for floating dialogs, menus, and popovers
    readonly property color surfaceElevated: darkMode ? "#243046" : "#ffffff"
    // Subtle surface tint for subtle pills and inactive chips
    readonly property color surfaceSubtle: darkMode ? Qt.rgba(1, 1, 1, 0.04) : Qt.rgba(0, 0, 0, 0.03)
    // Translucent glass surface for frosted panels
    readonly property color surfaceTranslucent: darkMode ? Qt.rgba(0.09, 0.12, 0.19, 0.78) : Qt.rgba(1, 1, 1, 0.82)
    // Interactive surface states
    readonly property color surfaceInteractive: darkMode ? Qt.rgba(1, 1, 1, 0.06) : Qt.rgba(0, 0, 0, 0.04)
    readonly property color surfaceInteractiveHover: darkMode ? Qt.rgba(1, 1, 1, 0.10) : Qt.rgba(0, 0, 0, 0.07)
    readonly property color surfaceInteractivePressed: darkMode ? Qt.rgba(1, 1, 1, 0.15) : Qt.rgba(0, 0, 0, 0.10)

    // =========================================================================
    // 3. TYPOGRAPHY & CONTENT
    // =========================================================================
    // Primary text for titles, headings, and high-emphasis content
    readonly property color textPrimary: darkMode ? "#f8fafc" : "#0f172a"
    // Secondary text for descriptive subtitles, body text, and meta labels
    readonly property color textSecondary: darkMode ? "#94a3b8" : "#475569"
    // Tertiary text for timestamps, supplementary info, and footnotes
    readonly property color textTertiary: darkMode ? "#64748b" : "#64748b"
    // Muted text for placeholders and inactive state indicators
    readonly property color textMuted: darkMode ? "#64748b" : "#94a3b8"
    // Subtle text for subtle iconography and decorative dividers
    readonly property color textSubtle: darkMode ? "#334155" : "#cbd5e1"
    // Text on high-contrast accent or dark backgrounds
    readonly property color textOnAccent: "#ffffff"
    readonly property color textOnDark: "#ffffff"
    readonly property color textOnLight: "#0f172a"

    // =========================================================================
    // 4. BORDERS & SEPARATORS
    // =========================================================================
    // Subtle border for cards and containers
    readonly property color borderSubtle: darkMode ? Qt.rgba(1, 1, 1, 0.07) : Qt.rgba(0, 0, 0, 0.05)
    // Medium border for interactive controls, inputs, and buttons
    readonly property color borderMedium: darkMode ? Qt.rgba(1, 1, 1, 0.14) : Qt.rgba(0, 0, 0, 0.10)
    // Prominent border for active or selected items
    readonly property color borderProminent: darkMode ? Qt.rgba(1, 1, 1, 0.24) : Qt.rgba(0, 0, 0, 0.18)
    // Specular highlight border for glass materials
    readonly property color borderHighlight: darkMode ? Qt.rgba(1, 1, 1, 0.15) : Qt.rgba(1, 1, 1, 0.90)
    // Divider line between list items and layout sections
    readonly property color divider: darkMode ? Qt.rgba(1, 1, 1, 0.08) : Qt.rgba(15, 23, 42, 0.06)
    // Control border alias
    readonly property color controlBorder: darkMode ? Qt.rgba(1, 1, 1, 0.15) : Qt.rgba(0, 0, 0, 0.08)

    // =========================================================================
    // 5. ACCENTS & BRAND SYSTEM (Adaptive)
    // =========================================================================
    // Primary brand accent
    readonly property color accentPrimary: accentColor
    // Interactive hover state on accent
    readonly property color accentHover: Qt.darker(accentColor, 1.12)
    // Interactive active / pressed state on accent
    readonly property color accentActive: Qt.darker(accentColor, 1.25)
    // Subtle accent wash for selected item backgrounds
    readonly property color accentSubtle: darkMode ? Qt.rgba(0.23, 0.51, 0.96, 0.18) : Qt.rgba(0.23, 0.51, 0.96, 0.10)
    // Accent border highlight
    readonly property color accentBorder: darkMode ? Qt.rgba(0.23, 0.51, 0.96, 0.40) : Qt.rgba(0.23, 0.51, 0.96, 0.28)

    // =========================================================================
    // 6. SEMANTIC STATUS & FEEDBACK
    // =========================================================================
    // Success: Confirmed actions, online status, positive battery
    readonly property color success: "#10b981"
    readonly property color successSubtle: darkMode ? Qt.rgba(0.06, 0.73, 0.51, 0.18) : Qt.rgba(0.06, 0.73, 0.51, 0.12)

    // Warning: System alerts, low battery, pending states
    readonly property color warning: "#f59e0b"
    readonly property color warningSubtle: darkMode ? Qt.rgba(0.96, 0.62, 0.04, 0.18) : Qt.rgba(0.96, 0.62, 0.04, 0.12)

    // Danger / Error: Critical alerts, errors, delete actions
    readonly property color danger: "#ef4444"
    readonly property color dangerSubtle: darkMode ? Qt.rgba(0.94, 0.27, 0.27, 0.18) : Qt.rgba(0.94, 0.27, 0.27, 0.12)

    // Information: Guidance notes, system tips, informative banners
    readonly property color info: "#0284c7"
    readonly property color infoSubtle: darkMode ? Qt.rgba(0.01, 0.52, 0.78, 0.18) : Qt.rgba(0.01, 0.52, 0.78, 0.12)

    // =========================================================================
    // 7. DISABLED STATES
    // =========================================================================
    readonly property color disabledText: darkMode ? "#475569" : "#94a3b8"
    readonly property color disabledSurface: darkMode ? Qt.rgba(1, 1, 1, 0.04) : Qt.rgba(0, 0, 0, 0.04)
    readonly property color disabledBorder: darkMode ? Qt.rgba(1, 1, 1, 0.06) : Qt.rgba(0, 0, 0, 0.05)

    // =========================================================================
    // 8. OVERLAYS & MODAL SCRIMS
    // =========================================================================
    // Dimmer overlay for bottom sheets and flyouts
    readonly property color overlayDim: darkMode ? Qt.rgba(0, 0, 0, 0.60) : Qt.rgba(15, 23, 42, 0.32)
    // Full modal backdrop scrim
    readonly property color scrimModal: darkMode ? Qt.rgba(0, 0, 0, 0.75) : Qt.rgba(15, 23, 42, 0.50)
    // Tooltip backdrop
    readonly property color tooltipBackground: darkMode ? "#1e293b" : "#0f172a"
    readonly property color tooltipText: "#ffffff"

    // =========================================================================
    // 9. DOCK & SPECIALIZED MATERIALS
    // =========================================================================
    readonly property color dockBackground: darkMode ? Qt.rgba(0.12, 0.16, 0.24, 0.72) : Qt.rgba(1, 1, 1, 0.72)
    readonly property color dockBorder: darkMode ? Qt.rgba(1, 1, 1, 0.14) : Qt.rgba(1, 1, 1, 0.85)
    readonly property color dockShadow: darkMode ? Qt.rgba(0, 0, 0, 0.35) : Qt.rgba(0.08, 0.12, 0.22, 0.10)

    // Status bar specific colors
    readonly property color statusBarText: darkMode ? "#e2e8f0" : "#1e293b"
    readonly property color statusBarIcon: darkMode ? "#cbd5e1" : "#334155"
}
