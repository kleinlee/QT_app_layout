#include "statusbar.h"
#include "statusbar_p.h"

QColor StatusBarPrivate::color;
StatusBar::Theme StatusBarPrivate::theme = StatusBar::Light;

StatusBar::StatusBar(QObject *parent) : QObject(parent)
{
}


QColor StatusBar::color()
{
    return StatusBarPrivate::color;
}

void StatusBar::setColor(const QColor &color)
{
    StatusBarPrivate::color = color;
    StatusBarPrivate::setColor_sys(color);
}

StatusBar::Theme StatusBar::theme()
{
    return StatusBarPrivate::theme;
}

void StatusBar::setTheme(Theme theme)
{
    StatusBarPrivate::theme = theme;
    StatusBarPrivate::setTheme_sys(theme);
}
