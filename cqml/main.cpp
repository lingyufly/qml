#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "cobject.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    CObject cobj;
    QQmlApplicationEngine engine;

    // qml中可以直接使用cobj实例
    engine.rootContext()->setContextProperty("cobj", &cobj);

    // 注册CObject到qml中，qml可以自己实例化CObject
    qmlRegisterType<CObject>("CObject",1,0,"CObject");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
