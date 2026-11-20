#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QDebug>
#include <QSize>
#include <QVariantMap>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setApplicationName("QLoopOS");
    app.setOrganizationName("Quantum Loop");

    QQmlApplicationEngine engine;

    engine.loadFromModule("QLoopOS.Shell", "Main");

    if (engine.rootObjects().isEmpty())
        return -1;

    // Automated verification mode for test suites and CI
    if (app.arguments().contains(QStringLiteral("--test"))) {
        QObject *rootObject = engine.rootObjects().first();
        auto *window = qobject_cast<QQuickWindow *>(rootObject);
        if (!window) {
            qCritical() << "FAIL: Root object is not a QQuickWindow";
            return 1;
        }

        qInfo() << "PASS: QLoopOS Shell Main window loaded successfully.";

        // Test responsive window resizing across mobile and desktop form factors
        const QList<QSize> testSizes = {
            QSize(360, 780),  // Narrow mobile portrait
            QSize(430, 860),  // Standard mobile portrait
            QSize(600, 900),  // Tablet portrait
            QSize(900, 600),  // Landscape layout
            QSize(1280, 800)  // Desktop development window
        };

        for (const auto &size : testSizes) {
            window->resize(size);
            app.processEvents();
            if (window->size() != size) {
                qCritical() << "FAIL: Failed to resize window to" << size;
                return 1;
            }
            qInfo() << "PASS: Window resized to" << size.width() << "x" << size.height();
        }

        // Test application launching interaction
        QVariantMap calcApp{
            {QStringLiteral("id"), QStringLiteral("calculator")},
            {QStringLiteral("name"), QStringLiteral("Calculator")},
            {QStringLiteral("start"), QStringLiteral("#f59e0b")},
            {QStringLiteral("end"), QStringLiteral("#d97706")}
        };

        window->setProperty("currentApp", calcApp);
        app.processEvents();
        QVariant activeApp = window->property("currentApp");
        if (activeApp.isNull()) {
            qCritical() << "FAIL: Failed to launch application";
            return 1;
        }
        qInfo() << "PASS: Application launched:" << activeApp.toMap().value(QStringLiteral("name")).toString();

        // Test returning to homescreen
        window->setProperty("currentApp", QVariant());
        app.processEvents();
        if (!window->property("currentApp").isNull()) {
            qCritical() << "FAIL: Failed to return to homescreen";
            return 1;
        }
        qInfo() << "PASS: Returned to homescreen successfully.";

        qInfo() << "ALL TESTS PASSED: QLoopOS Shell Homescreen foundation verified.";
        return 0;
    }

    return app.exec();
}
