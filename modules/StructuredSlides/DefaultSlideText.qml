import QtQuick 2.9
import Qrezi 0.1
import StructuredSlides 1.0

DefaultText {
    id: slide
    leftPadding: 18
    rightPadding: 18
    font.pointSize: 10

    property State slideUncoverState:
        State {
        PropertyChanges {
            target: slide
            opacity: 1
        }
    }

    Behavior on opacity {
        NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
    }
}
