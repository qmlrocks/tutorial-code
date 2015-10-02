import QtQuick 2.4
import QtQuick.Controls 1.3
import io.thp.pyotherside 1.4

ApplicationWindow {
    title: "Calculator"
    width: 400
    height: 600
    visible: true

    property alias calc: textField.text


    function calculate () {
        py.call("main.calculate", [ calc ], function ( result ) {
            var isValid = result[0];
            if (isValid) {
                calc = result[1];
            }
        })
    }

    TextField {
        id: textField
        property bool hasError: false
        font.italic: hasError

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        height: 64
        font.pixelSize: 18

        onAccepted: calculate()
    }

    Grid {
        anchors {
            top: textField.bottom   /*  Anchor to the textField */
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        columns: 3
        rows: 5

        Repeater {
            model: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, "+", "-", "*", "/"]
            delegate: CalculatorButton {
                /*  modelData holds the current text */
                text: modelData.toString ()
                /*  We add the operator or number to the calc string */
                onClicked: calc += modelData.toString()
                height: parent.height / parent.rows
                width: parent.width / parent.columns

            }
        }

        CalculatorButton {
            text: "="
            onClicked: calculate()
            color: "#8BC34A"
                height: parent.height / parent.rows
                width: parent.width / parent.columns

        }
    }

    Python {
        id: py
        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl("."))
            importModule_sync("main")
        }
    }

}
