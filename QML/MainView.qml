import QtQuick
import QtQuick.Controls

import "MyPage"

Item {
    width: 640
    height: 480
    visible: true
    property int pageIndex: 0
    Rectangle {
        id: firstPage
        color: "red"
        visible: pageIndex == 0? true:false
        anchors.fill:parent
    }
    Rectangle {
        id: secondPage
        visible: pageIndex == 1? true:false
        color: "green"
        anchors.fill:parent
    }
    Rectangle {
        id: thirdPage
        visible: pageIndex == 2? true:false
        color: "blue"
        anchors.fill:parent
    }

    MyPage {
        id: myPage
        visible: pageIndex == 3? true:false
    }

    TabBar {
        id: tabBar
        width: parent.width
        anchors.bottom: parent.bottom
//        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("形象")
            onClicked: {
                pageIndex = 0
            }
        }
        TabButton {
            text: qsTr("发现")
            onClicked: {
                pageIndex = 1
            }
        }
        TabButton {
            text: qsTr("消息")
            onClicked: {
                pageIndex = 2
            }
        }
        TabButton {
            text: qsTr("我的")
            onClicked: {
                pageIndex = 3
            }
        }
    }

}
