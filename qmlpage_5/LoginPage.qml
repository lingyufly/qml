import QtQuick 2.0
import QtQuick.Controls 2.3

import QtQuick 2.0
import QtQuick.Controls 2.3

Rectangle {
    id: loginPage
    width: 400
    height: 300
    color: "#051f58"
    radius: 8
    clip:true

    Button {
        text: "登录页面-登录按钮"
        anchors.centerIn: parent
        onClicked: {
            // 隐藏登录页面
            loginPage.visible = false // 不能销毁，否则下面的"主页面"也会跟随销毁，则后面
            // 点击"主页面-关闭按钮"，将无法销毁关闭"主页面"

            // 在主窗口（mainWin）上显示主页面
            var compMainPage = Qt.createComponent("MainPage.qml").createObject(mainWin);
        }
    }
}
