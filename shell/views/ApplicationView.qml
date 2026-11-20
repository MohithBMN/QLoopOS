import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import QLoopOS.Shell

Item {
    id: root

    property var appData: null
    property bool active: false

    signal closeRequested()

    anchors.fill: parent
    visible: opacity > 0

    // Transition animations
    opacity: active ? 1.0 : 0.0
    scale: active ? 1.0 : 0.94

    Behavior on opacity {
        NumberAnimation { duration: Theme.animNormal; easing.type: Easing.OutCubic }
    }
    Behavior on scale {
        NumberAnimation { duration: Theme.animNormal; easing.type: Easing.OutCubic }
    }

    // Background surface
    Rectangle {
        anchors.fill: parent
        color: Theme.background
    }

    // Status Bar in Application
    StatusBar {
        id: appStatusBar
        z: 10
    }

    // Top Application Navigation Bar
    Rectangle {
        id: navBar
        anchors.top: appStatusBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 52
        color: Theme.surfaceTranslucent
        border.color: Theme.divider
        border.width: 1
        z: 10

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 16
            anchors.rightMargin: 16
            spacing: 12

            // Back / Close Button ("← Homescreen")
            Rectangle {
                id: backButton
                width: backRow.implicitWidth + 18
                height: 32
                radius: 16
                color: backMouseArea.containsPress ? Theme.accentSoft : (backMouseArea.containsMouse ? Theme.surfaceSubtle : "transparent")
                border.color: Theme.controlBorder
                border.width: 1

                RowLayout {
                    id: backRow
                    anchors.centerIn: parent
                    spacing: 6

                    Text {
                        text: "←"
                        color: Theme.accent
                        font.family: Theme.fontFamily
                        font.pixelSize: 14
                        font.bold: true
                    }

                    Text {
                        text: "Home"
                        color: Theme.accent
                        font.family: Theme.fontFamily
                        font.pixelSize: 13
                        font.weight: Font.Medium
                    }
                }

                MouseArea {
                    id: backMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        root.closeRequested();
                    }
                }
            }

            // Application Title & Icon miniature
            RowLayout {
                spacing: 8
                Layout.alignment: Qt.AlignVCenter

                Rectangle {
                    width: 24
                    height: 24
                    radius: 7
                    color: root.appData ? root.appData.start : Theme.accent
                }

                Text {
                    text: root.appData ? root.appData.name : "Application"
                    color: Theme.textPrimary
                    font.family: Theme.fontFamily
                    font.pixelSize: 16
                    font.weight: Font.DemiBold
                }
            }

            Item {
                Layout.fillWidth: true
            }

            // Prototype badge
            Rectangle {
                width: 72
                height: 22
                radius: 11
                color: Theme.surfaceSubtle
                border.color: Theme.controlBorder
                border.width: 1

                Text {
                    anchors.centerIn: parent
                    text: "Prototype"
                    color: Theme.textMuted
                    font.family: Theme.fontFamily
                    font.pixelSize: 10
                    font.weight: Font.Medium
                }
            }
        }
    }

    // Application Content View Switcher
    Item {
        id: contentContainer
        anchors.top: navBar.bottom
        anchors.bottom: bottomIndicator.top
        anchors.left: parent.left
        anchors.right: parent.right
        clip: true

        readonly property string currentId: root.appData ? root.appData.id : ""

        // 1. CALCULATOR (Functional interactive calculator)
        Item {
            id: viewCalculator
            visible: contentContainer.currentId === "calculator"
            anchors.fill: parent

            property string display: "0"
            property real storedValue: 0
            property string pendingOp: ""
            property bool clearOnNext: false

            function handleDigit(d) {
                if (clearOnNext || display === "0") {
                    display = d;
                    clearOnNext = false;
                } else {
                    display += d;
                }
            }

            function handleOp(op) {
                storedValue = parseFloat(display);
                pendingOp = op;
                clearOnNext = true;
            }

            function handleEquals() {
                if (pendingOp === "") return;
                var current = parseFloat(display);
                var result = 0;
                if (pendingOp === "+") result = storedValue + current;
                else if (pendingOp === "−") result = storedValue - current;
                else if (pendingOp === "×") result = storedValue * current;
                else if (pendingOp === "÷") result = current !== 0 ? (storedValue / current) : 0;
                display = "" + Math.round(result * 100000) / 100000;
                pendingOp = "";
                clearOnNext = true;
            }

            function handleClear() {
                display = "0";
                storedValue = 0;
                pendingOp = "";
                clearOnNext = false;
            }

            ColumnLayout {
                anchors.centerIn: parent
                width: Math.min(parent.width - 40, 320)
                spacing: 12

                // Calculator Display
                Rectangle {
                    Layout.fillWidth: true
                    height: 72
                    radius: 16
                    color: Theme.surface
                    border.color: Theme.divider
                    border.width: 1

                    Text {
                        anchors.right: parent.right
                        anchors.rightMargin: 18
                        anchors.verticalCenter: parent.verticalCenter
                        text: viewCalculator.display
                        color: Theme.textPrimary
                        font.family: Theme.fontFamily
                        font.pixelSize: 32
                        font.weight: Font.DemiBold
                        elide: Text.ElideLeft
                    }
                }

                // Calculator Grid
                Grid {
                    Layout.alignment: Qt.AlignHCenter
                    columns: 4
                    spacing: 10

                    Repeater {
                        model: [
                            "C", "±", "%", "÷",
                            "7", "8", "9", "×",
                            "4", "5", "6", "−",
                            "1", "2", "3", "+",
                            "0", ".", "⌫", "="
                        ]

                        Rectangle {
                            width: 62
                            height: 62
                            radius: 18
                            color: modelData === "=" ? Theme.accent : (modelData === "C" ? Theme.danger : (["÷", "×", "−", "+"].indexOf(modelData) !== -1 ? Qt.rgba(0.23, 0.51, 0.96, 0.15) : Theme.surface))
                            border.color: Theme.controlBorder
                            border.width: 1

                            Text {
                                anchors.centerIn: parent
                                text: modelData
                                color: (modelData === "=" || modelData === "C") ? "#ffffff" : (["÷", "×", "−", "+"].indexOf(modelData) !== -1 ? Theme.accent : Theme.textPrimary)
                                font.family: Theme.fontFamily
                                font.pixelSize: 18
                                font.weight: Font.Medium
                            }

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    var val = modelData;
                                    if (val >= "0" && val <= "9") viewCalculator.handleDigit(val);
                                    else if (val === ".") {
                                        if (viewCalculator.display.indexOf(".") === -1) viewCalculator.display += ".";
                                    }
                                    else if (val === "C") viewCalculator.handleClear();
                                    else if (val === "⌫") {
                                        if (viewCalculator.display.length > 1) viewCalculator.display = viewCalculator.display.slice(0, -1);
                                        else viewCalculator.display = "0";
                                    }
                                    else if (val === "=") viewCalculator.handleEquals();
                                    else if (["+", "−", "×", "÷"].indexOf(val) !== -1) viewCalculator.handleOp(val);
                                }
                            }
                        }
                    }
                }
            }
        }

        // 2. SETTINGS (Functional settings view)
        Item {
            id: viewSettings
            visible: contentContainer.currentId === "settings"
            anchors.fill: parent

            Flickable {
                anchors.fill: parent
                contentHeight: settingsCol.implicitHeight + 40
                clip: true

                ColumnLayout {
                    id: settingsCol
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: Math.min(parent.width - 32, 480)
                    spacing: 16

                    Item { height: 8 }

                    // Section: Appearance
                    Text {
                        text: "APPEARANCE"
                        color: Theme.textMuted
                        font.family: Theme.fontFamily
                        font.pixelSize: 11
                        font.weight: Font.DemiBold
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 56
                        radius: 14
                        color: Theme.surface
                        border.color: Theme.divider
                        border.width: 1

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 16

                            Text {
                                text: "Dark Mode"
                                color: Theme.textPrimary
                                font.family: Theme.fontFamily
                                font.pixelSize: 14
                                font.weight: Font.Medium
                            }

                            Item { Layout.fillWidth: true }

                            Switch {
                                checked: Theme.darkMode
                                onToggled: {
                                    Theme.darkMode = checked;
                                }
                            }
                        }
                    }

                    // Section: Connectivity
                    Text {
                        text: "CONNECTIVITY"
                        color: Theme.textMuted
                        font.family: Theme.fontFamily
                        font.pixelSize: 11
                        font.weight: Font.DemiBold
                        Layout.topMargin: 8
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 112
                        radius: 14
                        color: Theme.surface
                        border.color: Theme.divider
                        border.width: 1

                        ColumnLayout {
                            anchors.fill: parent
                            spacing: 0

                            RowLayout {
                                Layout.fillWidth: true
                                Layout.margins: 14
                                Text {
                                    text: "Wi-Fi Network"
                                    color: Theme.textPrimary
                                    font.family: Theme.fontFamily
                                    font.pixelSize: 14
                                }
                                Item { Layout.fillWidth: true }
                                Text {
                                    text: "QLoop-Mesh"
                                    color: Theme.accent
                                    font.family: Theme.fontFamily
                                    font.pixelSize: 13
                                }
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                height: 1
                                color: Theme.divider
                            }

                            RowLayout {
                                Layout.fillWidth: true
                                Layout.margins: 14
                                Text {
                                    text: "Bluetooth"
                                    color: Theme.textPrimary
                                    font.family: Theme.fontFamily
                                    font.pixelSize: 14
                                }
                                Item { Layout.fillWidth: true }
                                Switch {
                                    checked: true
                                }
                            }
                        }
                    }

                    // Section: System Info
                    Text {
                        text: "ABOUT QLOOPOS"
                        color: Theme.textMuted
                        font.family: Theme.fontFamily
                        font.pixelSize: 11
                        font.weight: Font.DemiBold
                        Layout.topMargin: 8
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 140
                        radius: 14
                        color: Theme.surface
                        border.color: Theme.divider
                        border.width: 1

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 14
                            spacing: 8

                            RowLayout {
                                Text { text: "Version"; color: Theme.textSecondary; font.pixelSize: 13 }
                                Item { Layout.fillWidth: true }
                                Text { text: "QLoopOS 0.2.0 (Milestone 0.2)"; color: Theme.textPrimary; font.weight: Font.Medium; font.pixelSize: 13 }
                            }
                            RowLayout {
                                Text { text: "Interface Engine"; color: Theme.textSecondary; font.pixelSize: 13 }
                                Item { Layout.fillWidth: true }
                                Text { text: "Qt 6.10 / Qt Quick (QML)"; color: Theme.textPrimary; font.weight: Font.Medium; font.pixelSize: 13 }
                            }
                            RowLayout {
                                Text { text: "Window Manager"; color: Theme.textSecondary; font.pixelSize: 13 }
                                Item { Layout.fillWidth: true }
                                Text { text: "Wayland Modular Shell"; color: Theme.textPrimary; font.weight: Font.Medium; font.pixelSize: 13 }
                            }
                            RowLayout {
                                Text { text: "License"; color: Theme.textSecondary; font.pixelSize: 13 }
                                Item { Layout.fillWidth: true }
                                Text { text: "Quantum Loop Open Source"; color: Theme.accent; font.weight: Font.Medium; font.pixelSize: 13 }
                            }
                        }
                    }
                }
            }
        }

        // 3. PHONE
        Item {
            id: viewPhone
            visible: contentContainer.currentId === "phone"
            anchors.fill: parent

            property string dialNumber: ""

            ColumnLayout {
                anchors.centerIn: parent
                width: Math.min(parent.width - 32, 320)
                spacing: 14

                // Dial Number display
                Rectangle {
                    Layout.fillWidth: true
                    height: 52
                    radius: 14
                    color: Theme.surface
                    border.color: Theme.divider
                    border.width: 1

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 12

                        Text {
                            Layout.fillWidth: true
                            text: viewPhone.dialNumber === "" ? "Enter number..." : viewPhone.dialNumber
                            color: viewPhone.dialNumber === "" ? Theme.textMuted : Theme.textPrimary
                            font.family: Theme.fontFamily
                            font.pixelSize: 20
                            font.weight: Font.Medium
                            horizontalAlignment: Text.AlignHCenter
                        }

                        Text {
                            visible: viewPhone.dialNumber !== ""
                            text: "⌫"
                            color: Theme.textSecondary
                            font.pixelSize: 16
                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: viewPhone.dialNumber = viewPhone.dialNumber.slice(0, -1)
                            }
                        }
                    }
                }

                // Phone Dial Pad
                Grid {
                    Layout.alignment: Qt.AlignHCenter
                    columns: 3
                    spacing: 12

                    Repeater {
                        model: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#"]

                        Rectangle {
                            width: 68
                            height: 54
                            radius: 16
                            color: Theme.surface
                            border.color: Theme.controlBorder
                            border.width: 1

                            Text {
                                anchors.centerIn: parent
                                text: modelData
                                color: Theme.textPrimary
                                font.family: Theme.fontFamily
                                font.pixelSize: 19
                                font.weight: Font.Medium
                            }

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: viewPhone.dialNumber += modelData
                            }
                        }
                    }
                }

                // Call Button
                Rectangle {
                    Layout.alignment: Qt.AlignHCenter
                    width: 72
                    height: 52
                    radius: 26
                    color: "#10b981"

                    Text {
                        anchors.centerIn: parent
                        text: "Call"
                        color: "#ffffff"
                        font.family: Theme.fontFamily
                        font.pixelSize: 14
                        font.weight: Font.DemiBold
                    }
                }
            }
        }

        // 4. MESSAGES
        Item {
            id: viewMessages
            visible: contentContainer.currentId === "messages"
            anchors.fill: parent

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12

                // Search Bar
                Rectangle {
                    Layout.fillWidth: true
                    height: 38
                    radius: 12
                    color: Theme.surface
                    border.color: Theme.divider
                    border.width: 1

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 12
                        anchors.rightMargin: 12
                        spacing: 8
                        Text { text: "🔍"; color: Theme.textMuted; font.pixelSize: 12 }
                        Text { text: "Search conversations..."; color: Theme.textMuted; font.pixelSize: 13 }
                    }
                }

                // Conversations list
                ListView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    spacing: 8

                    model: [
                        { name: "Quantum Loop Core Team", msg: "QLoopOS UI milestone 0.2 completed!", time: "17:30", unread: 2 },
                        { name: "System Notifications", msg: "Kernel security patch updated.", time: "14:15", unread: 0 },
                        { name: "Wayland Compositor Service", msg: "Display server initialized successfully.", time: "Yesterday", unread: 0 },
                        { name: "Developer Community", msg: "New QML widgets published on git.", time: "Wednesday", unread: 0 }
                    ]

                    delegate: Rectangle {
                        width: ListView.view.width
                        height: 64
                        radius: 12
                        color: Theme.surface
                        border.color: Theme.divider
                        border.width: 1

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 12
                            spacing: 12

                            Rectangle {
                                width: 40
                                height: 40
                                radius: 20
                                color: Theme.accentSoft
                                Text {
                                    anchors.centerIn: parent
                                    text: modelData.name.charAt(0)
                                    color: Theme.accent
                                    font.weight: Font.DemiBold
                                    font.pixelSize: 16
                                }
                            }

                            ColumnLayout {
                                Layout.fillWidth: true
                                spacing: 2

                                RowLayout {
                                    Layout.fillWidth: true
                                    Text {
                                        text: modelData.name
                                        color: Theme.textPrimary
                                        font.weight: Font.Medium
                                        font.pixelSize: 14
                                    }
                                    Item { Layout.fillWidth: true }
                                    Text {
                                        text: modelData.time
                                        color: Theme.textMuted
                                        font.pixelSize: 11
                                    }
                                }

                                Text {
                                    text: modelData.msg
                                    color: Theme.textSecondary
                                    font.pixelSize: 12
                                    elide: Text.ElideRight
                                    Layout.fillWidth: true
                                }
                            }
                        }
                    }
                }
            }
        }

        // 5. BROWSER
        Item {
            id: viewBrowser
            visible: contentContainer.currentId === "browser"
            anchors.fill: parent

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 14
                spacing: 10

                // Address Bar
                Rectangle {
                    Layout.fillWidth: true
                    height: 40
                    radius: 12
                    color: Theme.surface
                    border.color: Theme.divider
                    border.width: 1

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 12
                        anchors.rightMargin: 12
                        spacing: 8
                        Text { text: "🔒"; font.pixelSize: 12 }
                        Text {
                            text: "https://qloop.org/os/docs"
                            color: Theme.textPrimary
                            font.family: Theme.fontFamily
                            font.pixelSize: 13
                            Layout.fillWidth: true
                        }
                        Text { text: "↻"; color: Theme.textSecondary; font.pixelSize: 14 }
                    }
                }

                // Rendered Web Page Card
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    radius: 14
                    color: Theme.surface
                    border.color: Theme.divider
                    border.width: 1

                    ColumnLayout {
                        anchors.centerIn: parent
                        spacing: 12
                        Text {
                            text: "QLoopOS Portal"
                            color: Theme.textPrimary
                            font.pixelSize: 22
                            font.weight: Font.DemiBold
                            Layout.alignment: Qt.AlignHCenter
                        }
                        Text {
                            text: "Welcome to the next generation open-source mobile OS."
                            color: Theme.textSecondary
                            font.pixelSize: 13
                            Layout.alignment: Qt.AlignHCenter
                        }
                        Rectangle {
                            Layout.alignment: Qt.AlignHCenter
                            width: 120
                            height: 34
                            radius: 17
                            color: Theme.accent
                            Text {
                                anchors.centerIn: parent
                                text: "Read Documentation"
                                color: "#ffffff"
                                font.pixelSize: 11
                                font.weight: Font.Medium
                            }
                        }
                    }
                }
            }
        }

        // 6. CAMERA
        Item {
            id: viewCamera
            visible: contentContainer.currentId === "camera"
            anchors.fill: parent

            Rectangle {
                anchors.fill: parent
                color: "#050811"

                // Viewfinder grid
                Rectangle {
                    anchors.centerIn: parent
                    width: Math.min(parent.width - 40, 340)
                    height: Math.min(parent.height - 120, 420)
                    color: "transparent"
                    border.color: Qt.rgba(1, 1, 1, 0.25)
                    border.width: 1
                    radius: 16

                    Text {
                        anchors.centerIn: parent
                        text: "Camera Viewfinder Preview"
                        color: Qt.rgba(1, 1, 1, 0.45)
                        font.pixelSize: 13
                    }
                }

                // Shutter button
                Rectangle {
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 24
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 66
                    height: 66
                    radius: 33
                    color: "transparent"
                    border.color: "#ffffff"
                    border.width: 3

                    Rectangle {
                        anchors.centerIn: parent
                        width: 52
                        height: 52
                        radius: 26
                        color: "#ffffff"
                    }
                }
            }
        }

        // 7. GENERIC / OTHER APPS (Clock, Weather, Files, Music, Gallery, Calendar)
        Item {
            id: viewGeneric
            visible: ["calculator", "settings", "phone", "messages", "browser", "camera"].indexOf(contentContainer.currentId) === -1
            anchors.fill: parent

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 16

                Rectangle {
                    Layout.alignment: Qt.AlignHCenter
                    width: 72
                    height: 72
                    radius: 20
                    color: root.appData ? root.appData.start : Theme.accent

                    Text {
                        anchors.centerIn: parent
                        text: root.appData ? root.appData.name.charAt(0) : "Q"
                        color: "#ffffff"
                        font.pixelSize: 28
                        font.weight: Font.Bold
                    }
                }

                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: root.appData ? root.appData.name : "App View"
                    color: Theme.textPrimary
                    font.family: Theme.fontFamily
                    font.pixelSize: 22
                    font.weight: Font.DemiBold
                }

                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "QLoopOS Prototype Interface for " + (root.appData ? root.appData.name : "Application")
                    color: Theme.textSecondary
                    font.pixelSize: 13
                }

                Rectangle {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin: 8
                    width: 140
                    height: 36
                    radius: 18
                    color: Theme.accentSoft
                    border.color: Theme.accent
                    border.width: 1

                    Text {
                        anchors.centerIn: parent
                        text: "← Return to Home"
                        color: Theme.accent
                        font.pixelSize: 12
                        font.weight: Font.Medium
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: root.closeRequested()
                    }
                }
            }
        }
    }

    // Bottom Home Indicator
    HomeIndicator {
        id: bottomIndicator
        onClicked: {
            root.closeRequested();
        }
    }
}
