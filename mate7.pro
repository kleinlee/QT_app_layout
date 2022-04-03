QT += quick qml
CONFIG += qmltypes
QML_IMPORT_NAME = AAAAA
QML_IMPORT_MAJOR_VERSION = 1
SOURCES += \
        main.cpp

RESOURCES += \
    qml.qrc \
    qtquickcontrols2.conf

include(statusbar/statusbar.pri)
INCLUDEPATH += statusbar

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES +=

