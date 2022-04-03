import QtQuick
import QtQuick.Controls
import Qt.labs.platform
import "../CustomItems"
Rectangle {
    id: swipeView22
//    anchors.fill: parent
    width: Qt.platform.os == "android"? Screen.desktopAvailableWidth : 411
    height: Qt.platform.os == "android"? Screen.desktopAvailableHeight : 832

    property bool b_login: false

    FileDialog {
        id: fileDialog2
        property bool worked: false
        title: qsTr("Please choose an image file")
        nameFilters: ["Image Files (*.jpg *.png *.gif *.bmp *.ico)", "*.*"]
        onAccepted: {
            profilePhoto.source = fileDialog2.file
        }
    }

    RoundImage {
        id: profilePhoto
        y: parent.height/10
        x: parent.width/20
        width: parent.height/10
        height: parent.height/10

        MouseArea {
            anchors.fill: parent
            onClicked: {
                fileDialog2.open()
            }
        }
    }



    Rectangle {
        id: rect_login
        anchors.top: profilePhoto.top
        anchors.bottom: profilePhoto.bottom
        anchors.left: profilePhoto.right
        anchors.right: parent.right
        anchors.rightMargin: parent.width/20
        visible: b_login

        Text {
            id: profileName
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.top: parent.top
            anchors.topMargin: 10
            text: "胡歌"
            font.pointSize: 20
        }

        Text {
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            text: "加入mates第1天"
        }

        Text {
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            text: "退出登录"
        }
    }

    Rectangle {
        id: rect_logout
        anchors.top: profilePhoto.top
        anchors.bottom: profilePhoto.bottom
        anchors.left: profilePhoto.right
        anchors.right: parent.right
        anchors.rightMargin: parent.width/20
        visible: !b_login

        Text {
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            text: "登录/注册"
            font.pointSize: 20

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    assistantView.source = "MyPage/LoginView.qml"
                    mian_swipeView.currentIndex = 1
                }
            }
        }
    }

    Rectangle {
        x: parent.width/20
        y: parent.height/4.5
        width: parent.width * 0.43
        height: parent.height/15
        radius: 10
//        color: "lightgreen"
        border.color: "gray"

        Text {
            text: "金币"
            anchors.centerIn: parent
        }
    }

    Rectangle {
        x: parent.width *0.52
        y: parent.height/4.5
        width: parent.width * 0.43
        height: parent.height/15
        radius: 10
//        color: "lightgreen"
        border.color: "gray"
        Text {
            text: "签到"
            anchors.centerIn: parent
        }
    }

    Column {
        y: parent.height/3
        x: parent.width/20
        width: parent.width *0.9
        height: parent.height/10
        spacing: 10

        Rectangle {
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            height: 50
            radius: 5
            color: "#F0F0F0"
            Text {
                x: 15
                text: "我的收藏"
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle {
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            height: 50
            radius: 5
            color: "#F0F0F0"
            Text {
                x: 15
                text: "常见问题"
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle {
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            height: 50
            radius: 5
            color: "#F0F0F0"
            Text {
                x: 15
                text: "检查更新"
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle {
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            height: 50
            radius: 5
            color: "#F0F0F0"

            Text {
                x: 15
                text: "关于Mates"
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

}
