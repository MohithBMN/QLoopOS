import QtQuick

QtObject {
    id: root

    // =========================================================================
    // DURATION TOKENS (Milliseconds)
    // =========================================================================
    // Instant: Micro-interactions, toggles, checkmarks
    readonly property int durationInstant: 90

    // Fast: Press feedback, hover highlight, icon bounce, subtle scale
    readonly property int durationFast: 160

    // Normal: Standard dialog open, drawer slide, menu expand
    readonly property int durationNormal: 260

    // Slow: View transitions, app window open/close, screen swap
    readonly property int durationSlow: 380

    // Deliberate: Fullscreen morph, system lock/unlock, wallpaper crossfade
    readonly property int durationDeliberate: 500

    // =========================================================================
    // EASING CURVE TOKENS (Natural physical motion)
    // =========================================================================
    // Standard Deceleration: Primary curve for UI elements coming to rest
    readonly property int easingStandard: Easing.OutCubic

    // Entrance Curve: For items entering the viewport from outside
    readonly property int easingEntrance: Easing.OutExpo

    // Exit Curve: For items quickly leaving the viewport
    readonly property int easingExit: Easing.InQuad

    // Spring Curve: Tactile overshoot for physical buttons and touch feedback
    readonly property int easingSpring: Easing.OutBack

    // Smooth In-Out Curve: For reciprocal or continuous transitions
    readonly property int easingSmooth: Easing.InOutCubic

    // =========================================================================
    // INTERACTION SCALE TOKENS
    // =========================================================================
    // Press compression on touch / mouse click
    readonly property real scalePress: 0.93

    // Desktop hover expansion
    readonly property real scaleHover: 1.05

    // Keyboard / remote focus ring expansion
    readonly property real scaleFocus: 1.02

    // Active tab / item selection
    readonly property real scaleActive: 0.96
}
