import QtQuick 2.4

Rectangle {
    id: fancyButton
    width: 100
    height: 50
    property string text: "Default"
    color: "green"
    
    Text {
        anchors.centerIn: parent
        text: fancyButton.text
    }
}
