import QtQuick 2.0
import QtQuick.Controls 1.3

Rectangle {
    property alias text: label.text
    signal clicked 

    color: "#4CAF50"

    border.width: 2
    border.color: "white"

    Label {
        id: label
        anchors.centerIn: parent
        color: "white"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: parent.clicked()
    }
}
