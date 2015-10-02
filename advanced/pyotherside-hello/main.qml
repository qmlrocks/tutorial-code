import QtQuick 2.0
import QtQuick.Controls 1.2
import io.thp.pyotherside 1.4

ApplicationWindow {
    id: app
    width: 200
    height: 100
    title: "Hello PyOtherSide"

    Text {
        id: myHelloWorldText
        text: "Hello"
    }

    Python {
        id: py
        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl("."))
            importModule("hello", function(){
                call("hello.world")
            });
        }
    }

}
