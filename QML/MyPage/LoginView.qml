import QtQuick 2.0
import QtQuick.Controls

import "../CustomItems"

Rectangle {
//    anchors.fill: parent
    id: loginPage
    property int indexPage: 0
    signal message(string msg)
    Rectangle
    {
        id: login_gui

        anchors.fill: parent

        visible: indexPage == 0? true : false

        Rectangle {
            y: 10
            width: parent.width
            height: 40

            Text {
                id: text_back
                text: "back"
                anchors.left: parent.left
                anchors.leftMargin: parent.width/15
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                text: "登录"
                font.pointSize: 18
                font.weight: 2000
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: text_back.bottom
            }

            Text {
                text: "注册"
                id: text_register
                anchors.right: parent.right
                anchors.rightMargin: parent.width/15
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea {
                anchors.fill: text_back
                onClicked:
                {
                    loginPage.message("text_back clicked!")
                }
            }
            MouseArea {
                anchors.fill: text_register
                onClicked:
                {
                    loginPage.indexPage = 1
                }
            }
        }

        //登陆框
        Rectangle
        {
            id: rect1
            width: login_gui.width * 0.8
            height: login_gui.height * 0.6
            y: login_gui.height * 0.15
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
    //        border.color: "#707070"
    //        border.color: "white"
            color: "transparent"

            Column {
                spacing: 10
                LineInput
                {
                    width: rect1.width
                    height: rect1.height * 0.12
                    font_size: 15
                    hint: "请输入手机号"
                }

                Rectangle {
                    width: rect1.width
                    height: rect1.height * 0.12
                    LineInput
                    {
                        width: parent.width - msgBtn.width - 10
                        height: parent.height
                        font_size: 15
                        hint: "验证码"
                    }

                    Button {
                        id: msgBtn
                        x: parent.width - width
                        width: parent.width*0.4
                        height: parent.height
                        anchors.verticalCenter: parent.verticalCenter
                        text: "获取验证码"
                    }
                }


                LineInput
                {
                    width: rect1.width
                    height: rect1.height * 0.12
                    font_size: 15
                    hint: "密码"
                }

                Rectangle {
                    id: readMeArea
                    width: rect1.width
                    height: rect1.height * 0.15
                    color: "#00000000"

                    CheckBox {
                        id: readMeCheckBox
                        x: 12
                        anchors {
                            verticalCenter: readMeArea.verticalCenter
                        }
                    }
                    Rectangle {
                        id: readMeRect
                        width: rect1.width - readMeCheckBox.width
                        height: rect1.height * 0.15
        //                y: rect1.height * 0.85
        //                color: "#00000000"
                        anchors {
                            verticalCenter: readMeArea.verticalCenter
                            left: readMeCheckBox.right
                            leftMargin: 2
                        }
                        Rectangle {
                            id: rect_0
                            width: text_0.implicitWidth
                            height: parent.height
        //
                            Text {
                                id: text_0
                                text: "同意"
                                font.pixelSize: 12
                                font.weight: Font.Thin
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                        Rectangle {
                            id: rect_1
        //                    x: rect_0.width
                            width: text_1.implicitWidth
                            height: parent.height
        //                    anchors.verticalCenter: parent.verticalCenter
                            anchors.left: rect_0.right
                            Text {
                                id: text_1
                                text: "《服务条款》"
                                font.pixelSize: 12
                                font.weight: Font.Thin
                                color: "steelblue"
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            MouseArea {
                                anchors.fill: parent
        //                        acceptedButtons: Qt.LeftButton//只处理鼠标左键

                                hoverEnabled: true
                                cursorShape: containsMouse? Qt.PointingHandCursor: Qt.ArrowCursor
                                onClicked: {
                                    console.log("《服务条款》")
                                }
                            }
                        }
                        Rectangle {
                            width: text_2.implicitWidth
                            height: parent.height
        //                    anchors.verticalCenter: parent.verticalCenter
                            anchors.left: rect_1.right
                            Text {
                                id: text_2
                                text: "《隐私政策》"
                                font.pixelSize: 12
                                font.weight: Font.Thin
                                color: "steelblue"
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: containsMouse? Qt.PointingHandCursor: Qt.ArrowCursor
                                onClicked: {
                                    console.log("《隐私政策》")
                                }
                            }
                        }
                    }
                }

                Rectangle
                {
                    id: btn_quit
                    width: rect1.width
                    height: rect1.height * 0.12
                    radius: 5
                    color: "#DDDDDD"

        //            anchors {
        //                left: rect1.left
        //                bottom: rect1.bottom; bottomMargin: 8 }
                    Text {
                        text: "登录"
                        font.pixelSize: 15
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            btn_quit.color = "#81ca9d"
                        }
                        onExited: {
                            btn_quit.color = "#DDDDDD"
                        }

        //                onClicked: {
        //                    login_gui.hide()
        //                    progressWindow.show()
        //                }
                    }
                }
            }
        }
    }

    RegisterView {
        visible: indexPage == 1? true : false
        anchors.fill: parent
    }
}


