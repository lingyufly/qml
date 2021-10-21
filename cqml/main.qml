import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.6
import QtQuick.Layouts 1.3

// 导入CObject类型
import CObject 1.0

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("在QML中使用C++类和对象")

    Rectangle{
        anchors.fill: parent
        Column{
            anchors.fill:parent
            anchors.margins: 10
            spacing: 10
            Row{
                spacing: 10
                Label{
                    text:"Value1: "
                }
                TextField{
                    id:value1
                }
                Label{
                    text:"Value2: "
                }

                TextField{
                    id:value2
                }
            }
            Row{
                spacing: 10
                Button{
                    text:"使用注册的cobj实例计算"
                    onClicked: {
                        var v1=Number(value1.text)
                        var v2=Number(value2.text)
                        result1.text=(cobj.add(v1,v2)).toString()
                    }
                }

                TextField{
                    id:result1
                }
            }

            Row{
                spacing: 10
                // 实例化一个CObject对象
                CObject{
                    id:cobj1
                }

                Button{
                    text:"使用注册的CObject类型注册实例并计算"
                    onClicked: {
                        var v1=Number(value1.text)
                        var v2=Number(value2.text)
                        result2.text=(cobj1.add(v1,v2)).toString()
                    }
                }

                TextField{
                    id:result2
                }
            }
        }
    }


}
