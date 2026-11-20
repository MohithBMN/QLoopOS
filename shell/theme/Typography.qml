import QtQuick

QtObject {
    id: root

    // =========================================================================
    // FONT FAMILY CASCADE (Freely licensed & system-native)
    // =========================================================================
    readonly property string fontFamily: "-apple-system, BlinkMacSystemFont, 'SF Pro Display', 'Inter', 'Ubuntu', 'Segoe UI', 'Noto Sans', sans-serif"
    readonly property string fontFamilyMonospace: "'JetBrains Mono', 'Fira Code', 'Ubuntu Mono', 'SF Mono', monospace"

    // =========================================================================
    // FONT WEIGHT TOKENS
    // =========================================================================
    readonly property int weightLight: Font.Light       // 300
    readonly property int weightRegular: Font.Normal    // 400
    readonly property int weightMedium: Font.Medium     // 500
    readonly property int weightDemiBold: Font.DemiBold // 600
    readonly property int weightBold: Font.Bold         // 700

    // =========================================================================
    // TYPOGRAPHY SCALE (Pixel Sizes)
    // =========================================================================
    // Clock Display: Lockscreen and homescreen hero time presentation
    readonly property int clockDisplay: 54
    readonly property real clockDisplayLetterSpacing: -1.2
    readonly property real clockDisplayLineHeightRatio: 1.05

    // Large Display: Prominent titles and hero numbers
    readonly property int largeDisplay: 40
    readonly property real largeDisplayLetterSpacing: -0.8
    readonly property real largeDisplayLineHeightRatio: 1.15

    // Page Heading: Main window titles, view headers
    readonly property int pageHeading: 28
    readonly property real pageHeadingLetterSpacing: -0.5
    readonly property real pageHeadingLineHeightRatio: 1.25

    // Section Heading: Category headers, card group titles
    readonly property int sectionHeading: 20
    readonly property real sectionHeadingLetterSpacing: -0.2
    readonly property real sectionHeadingLineHeightRatio: 1.30

    // Title: Standard card titles, dialog headings, list group headers
    readonly property int title: 17
    readonly property real titleLetterSpacing: -0.1
    readonly property real titleLineHeightRatio: 1.35

    // Body: Primary content reading size, input text, dialog messages
    readonly property int body: 14
    readonly property real bodyLetterSpacing: 0.0
    readonly property real bodyLineHeightRatio: 1.45

    // Secondary Body: Supporting descriptions and list subtitles
    readonly property int secondaryBody: 13
    readonly property real secondaryBodyLetterSpacing: 0.0
    readonly property real secondaryBodyLineHeightRatio: 1.40

    // Caption: Status bar labels, icon titles, metadata timestamps
    readonly property int caption: 12
    readonly property real captionLetterSpacing: 0.1
    readonly property real captionLineHeightRatio: 1.35

    // Small Label: Badges, pills, overline labels, uppercase tags
    readonly property int smallLabel: 11
    readonly property real smallLabelLetterSpacing: 0.2
    readonly property real smallLabelLineHeightRatio: 1.30

    // Micro: Super small telemetry indices and indicator notes
    readonly property int micro: 10
    readonly property real microLetterSpacing: 0.2
    readonly property real microLineHeightRatio: 1.25
}
