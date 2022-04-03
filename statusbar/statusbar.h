#ifndef STATUSBAR_H
#define STATUSBAR_H

#include <QObject>
#include <QColor>
#include <QQmlEngine>
class StatusBar : public QObject
{
    Q_OBJECT
    QML_NAMED_ELEMENT(StatusBar)
    Q_PROPERTY(QColor color READ color WRITE setColor)
    Q_PROPERTY(Theme theme READ theme WRITE setTheme)

public:
    explicit StatusBar(QObject *parent = nullptr);

    static QColor color();
    static void setColor(const QColor &color);

    enum Theme { Light, Dark };
    Q_ENUM(Theme)

    static Theme theme();
    static void setTheme(Theme theme);
};

#endif // STATUSBAR_H
