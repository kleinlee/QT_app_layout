#include "statusbar_p.h"
#include <QCoreApplication>
// WindowManager.LayoutParams
#define FLAG_TRANSLUCENT_STATUS 0x04000000
#define FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS 0x80000000
// View
#define SYSTEM_UI_FLAG_LIGHT_STATUS_BAR 0x00002000
#ifdef ANDROID
#include <QJniEnvironment>
#include <jni.h>
#include <QJniObject>
static QJniObject getAndroidWindow()
{
    auto activity = QJniObject(QNativeInterface::QAndroidApplication::context());
    QJniObject window = activity.callObjectMethod("getWindow", "()Landroid/view/Window;");
    window.callMethod<void>("addFlags", "(I)V", FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
    window.callMethod<void>("clearFlags", "(I)V", FLAG_TRANSLUCENT_STATUS);
    return window;
}
#endif

void StatusBarPrivate::setColor_sys(const QColor &color)
{
#ifdef ANDROID
    if (QNativeInterface::QAndroidApplication::sdkVersion() < 23)
        return;
    QNativeInterface::QAndroidApplication::runOnAndroidMainThread([=]() {
        QJniObject window = getAndroidWindow();
        window.callMethod<void>("setStatusBarColor", "(I)V", color.rgba());
        window.callMethod<void>("setNavigationBarColor", "(I)V", color.rgba());
    });
#endif
}

void StatusBarPrivate::setTheme_sys(StatusBar::Theme theme)
{
#ifdef ANDROID
    if (QNativeInterface::QAndroidApplication::sdkVersion() < 23)
        return;

    QNativeInterface::QAndroidApplication::runOnAndroidMainThread([=]() {
        QJniObject window = getAndroidWindow();
        QJniObject view = window.callObjectMethod("getDecorView", "()Landroid/view/View;");
        int visibility = view.callMethod<int>("getSystemUiVisibility", "()I");
        if (theme == StatusBar::Theme::Light)
            visibility |= SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
        else
            visibility &= ~SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
        view.callMethod<void>("setSystemUiVisibility", "(I)V", visibility);
    });
#endif
}
