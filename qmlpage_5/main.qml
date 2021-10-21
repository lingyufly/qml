import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.6
import QtQuick.Layouts 1.3

Window {
    id: mainWin
    visible: true
    width: 640
    height: 480
    title: qsTr("createComponent方式切换")

    LoginPage {
        width: 300
        height: 200
        anchors.centerIn: parent
    }
}
