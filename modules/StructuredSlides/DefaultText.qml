import QtQuick 2.9
import Qrezi 0.1

Text {
    font.pointSize: 50

    font.family: biolinum.name
    color: "#fff"

    leftPadding: 30
    rightPadding: 30

    height: contentHeight
    Behavior on opacity {
        NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
    }
}
