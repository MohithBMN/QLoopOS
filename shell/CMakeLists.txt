cmake_minimum_required(VERSION 3.25)

project(QLoopUI VERSION 0.2.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.10 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.10)

qt_add_executable(qloop-ui
    src/main.cpp
)

set_source_files_properties(theme/Theme.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(qloop-ui
    URI QLoopOS.Shell
    VERSION 1.0
    NO_IMPORT_SCAN
    QML_FILES
        Main.qml
        theme/Theme.qml
        theme/Colors.qml
        theme/Typography.qml
        theme/Spacing.qml
        theme/Radii.qml
        theme/Materials.qml
        theme/Motion.qml
        theme/Icons.qml
        components/Wallpaper.qml
        components/StatusBar.qml
        components/AppIcon.qml
        components/AppGrid.qml
        components/FloatingDock.qml
        components/HomeIndicator.qml
        views/HomeScreen.qml
        views/ApplicationView.qml
)

target_link_libraries(qloop-ui
    PRIVATE Qt6::Quick
)
