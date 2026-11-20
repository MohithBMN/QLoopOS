import QtQuick
import QtQuick.Controls
import QLoopOS.Shell

ApplicationWindow {
    id: window

    // Mobile-first default dimensions for desktop development
    width: 430
    height: 860
    minimumWidth: 360
    minimumHeight: 560
    visible: true

    title: currentApp ? ("QLoopOS — " + currentApp.name) : "QLoopOS"
    color: Theme.background

    // Active application state
    property var currentApp: null

    // Keyboard Shortcuts
    Item {
        focus: true
        Keys.onEscapePressed: {
            if (window.currentApp !== null) {
                appView.active = false;
                window.currentApp = null;
            }
        }
    }

    // Homescreen View
    HomeScreen {
        id: homeScreen
        anchors.fill: parent

        onLaunchApp: function(appData) {
            window.currentApp = appData;
            appView.appData = appData;
            appView.active = true;
        }
    }

    // Application Launch / View Container
    ApplicationView {
        id: appView
        anchors.fill: parent
        appData: window.currentApp
        active: window.currentApp !== null

        onCloseRequested: {
            appView.active = false;
            window.currentApp = null;
        }
    }
}
