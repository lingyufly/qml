import QtQuick 2.0
import QtQuick.Controls 2.3

ApplicationWindow {
    visible: true
    height: 640
    width: 480
    id: root

    ToastManager {
        id: toast
    }

    Timer{
        id:timer
        property int count: 0
        interval: 100
        repeat: true
        onTriggered: {
            toast.show("提示: " + (++count) + " 次!");
            toast.show("测试测试测试测试测试1234567890|测试测试测试测试测试1234567890|测试测试测试测试测试1234567890|"
                       + "测试测试测试测试测试1234567890|测试测试测试测试测试1234567890|测试测试测试测试测试1234567890|"
                       + "测试测试测试测试测试1234567890|测试测试测试测试测试1234567890|测试测试测试测试测试1234567890|"
                       + "测试测试测试测试测试1234567890|测试测试测试测试测试1234567890|测试测试测试测试测试1234567890");
        }
    }

    Row{
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 5
        Button{
            text: "开始"
            onClicked: {
                timer.start()
            }
        }

        Button{
            text: "结束"
            onClicked: {
                timer.stop()
            }
        }
    }


}
