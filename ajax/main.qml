import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.6
import QtQuick.Layouts 1.3

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("测试C++的Ajax类")
    Timer{
        id:timer1
        property bool inited: false
        repeat: true
        interval: 10

        onTriggered: {
            var data = {
                id: 111,
                value:11.11,
                name: 'ly',
                lang: '中文',
                b:true
            }
            get.all++
            post.all++
            ajax.post("http://127.0.0.1:8000", data,
                      function(response){
                          console.log(response);
                          post.good++
                      },
                      function(error){
                          console.log(error);
                          post.bad++
                      }
                      );
            ajax.get("http://127.0.0.1:8000", data,
                     function(response){
                         console.log(response);
                         get.good++
                     },
                     function(error){
                         console.log(error);
                         get.bad++
                     }
                     );
        }
    }
    Column{
        anchors.fill: parent
        anchors.margins: 11
        spacing: 10
        Button{
            id: btn
            text:"启动测试"
            onClicked: function(){
                if (timer1.inited){
                    timer1.stop()
                    timer1.inited=false
                    text="启动测试"
                } else {
                    get.all=0
                    get.good=0
                    get.bad=0
                    post.all=0
                    post.good=0
                    post.bad=0
                    timer1.start()
                    timer1.inited=true
                    text="结束测试"
                }
            }
        }

        Rectangle{
            id:get
            property int all: 0
            property int good: 0
            property int bad: 0
        }
        Rectangle{
            id:post
            property int all: 0
            property int good: 0
            property int bad: 0
        }
        Grid{
            spacing: 6
            columns: 4
            rows:3

            Label{
                text:"类型"
            }
            Label{
                text:"成功"
            }
            Label{
                text:"失败"
            }
            Label{
                text:"总计"
            }

            Label{
                text:"Get"
            }

            Label{
                text:get.good.toString()
            }
            Label{
                text:get.bad.toString()
                color: "red"
            }
            Label{
                text:get.all.toString()
            }

            Label{
                text:"Post"
            }
            Label{
                text:get.good.toString()
            }
            Label{
                text:get.bad.toString()
                color: "red"
            }
            Label{
                text:get.all.toString()
            }
        }

    }
}
