import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.6
import QtQuick.Layouts 1.3

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("使用StackView的方式切换页面")

    StackView{
        anchors.fill: parent
        id:stackview
        initialItem: page1

        Component{
            id:page1
            Page1{}
        }
        Component{
            id:page2
            Page2{}
        }
        Component{
            id:page3
            Page3{}
        }
    }

    function loadPage(page){
        switch(page){
        case"page1":
            stackview.push(page1)
            break
        case"page2":
            stackview.push(page2)
            break
        case"page3":
            stackview.push(page3)
            break
        }
    }

    Row{
        anchors.bottom: parent.bottom
        Button{
            text:"页面1"
            onClicked: {
                loadPage('page1')
            }
        }
        Button{
            text:"页面2"
            onClicked: {
                loadPage('page2')
            }
        }
        Button{
            text:"页面3"
            onClicked: {
                loadPage('page3')
            }
        }
    }
}
