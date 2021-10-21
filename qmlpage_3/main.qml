import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("使用SwipeView的方式切换页面")

    SwipeView{
        anchors.fill: parent
        id:swipeview
        currentIndex: footer.currentIndex
        Page1{
            id:page1
        }
        Page2{
            id:page2
        }
        Page3 {
            id:page3
        }
    }

    PageIndicator{
        id:indicator
        count: swipeview.count
        currentIndex: swipeview.currentIndex
        anchors.bottom: footer.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TabBar{
        anchors.bottom: parent.bottom
        id:footer
        currentIndex: swipeview.currentIndex
        anchors.horizontalCenter: parent.horizontalCenter
        TabButton{
            text:"页面1"
        }
        TabButton{
            text:"页面2"
        }
        TabButton{
            text:"页面3"
        }
    }

}
