import QtQuick
import QtQuick.Controls

import "MyPage"

Window {
    width: Qt.platform.os == "android"? Screen.desktopAvailableWidth : 411
    height: Qt.platform.os == "android"? Screen.desktopAvailableHeight : 832
    visible: true
    title: qsTr("Mates")

    SwipeView {
        id: mian_swipeView
//        visible: false
        currentIndex: 0
//        anchors.fill: parent
        width:parent.width
        height: parent.height
        orientation: Qt.Horizontal
        interactive: false

        MainView {
            id: mainView
        }

        Loader {
            id: assistantView
            source: ""
            Connections {
                target: assistantView.item
                function onMessage(msg) {
                    console.log(msg)
                    console.log(Screen.desktopAvailableWidth, Screen.desktopAvailableHeight)
                    mian_swipeView.currentIndex = 0
                }
            }
        }
    }
}
