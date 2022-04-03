#ifndef STATUSBAR_P_H
#define STATUSBAR_P_H

#include "statusbar.h"

class StatusBarPrivate
{
public:
    static void setColor_sys(const QColor &color);
    static void setTheme_sys(StatusBar::Theme theme);

    static QColor color;
    static StatusBar::Theme theme;
};

#endif // STATUSBAR_P_H
