#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "ajax.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    Ajax ajax;

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("ajax", &ajax);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
