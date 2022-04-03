import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
Image {
    id: sourceimage
    source: "qrc:/huge.jpg"
    width: parent.width
    height: parent.height
//        smooth: true
//        visible: false
    fillMode: Image.PreserveAspectCrop
    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: mask
    }
    Rectangle {
        id: mask
        width: parent.width
        height: parent.height
        radius: parent.height/2
        visible: false
    }
}
