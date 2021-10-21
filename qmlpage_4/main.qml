import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.6
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Loader动态加载")

    // 1. Loader加载不同组件，实现切换页面的功能
    Loader{
        id:myLoader
        anchors.centerIn: parent // 弹出的界面都居中显示
    }
    Component.onCompleted: myLoader.sourceComponent = loginPage // 一开始显示登录页面

    // 2. 登录页面-Component
    Component{
        id:loginPage
        LoginPage {
            width: 300
            height: 200
            anchors.centerIn: parent
        }
    }

    // 3.主页面-Component
    Component{
        id:mainPage
        MainPage {
            width: 500
            height: 350
            anchors.centerIn: parent
        }
    }
}
