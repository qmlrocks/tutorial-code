import QtQuick 2.4
import QtQuick.Controls 1.3

ApplicationWindow {
    id: app
    width: 200
    height: 200

    Column {
        anchors.fill: parent   
        spacing: 16
    
        FancyButton { text: "Go" }
        FancyButton { text: "Stop" }
    }
}
