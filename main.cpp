#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFont>
#include <QFontInfo>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    auto font = app.font();
    font.setPixelSize(14);
    font.setWeight(QFont::Black);
    app.setFont(font);

    QQmlApplicationEngine engine;
    const QUrl url("qrc:/QML/main.qml");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
