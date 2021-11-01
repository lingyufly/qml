import QtQuick 2.0
import QtQuick.Controls 2.3

Rectangle {
    id: mainPage
    color: "#498ff8"
    radius: 8
    width: 400
    height: 400
    anchors.centerIn: parent

    Button {
        text: "主页面-关闭按钮"
        anchors.centerIn: parent
        onClicked: {
            // 销毁关闭主页面
            mainPage.destroy()
        }
    }
}
