import Qrezi 0.1
import QtQuick 2.9
import QtGraphicalEffects 1.0

Item {

    property alias text: myTitle.text
    property alias blur: blurry
    property alias title: myTitle
    property Item contentItem: Item {}
    property int blurRadius: 27
    property alias titleState: titleState
    property alias contentState: contentState

    signal enter
    signal leave

    onLeave: state = "state1"
    onEnter: state = "state1"

    height: title.height
    width: title.width

    DefaultText {
        id: myTitle
        // visible: false
        font.pointSize: 100
    }

    state: 'state1'

    states: [
        State {
            id: titleState
            name: 'state1'
            PropertyChanges {
                target: myTitle
                opacity: 1
            }
            PropertyChanges {
                target: contentItem
                opacity: 0
            }
            PropertyChanges {
                target: blur
                opacity: 0
            }
            PropertyChanges {
                target: blur
                radius: 0
            }
        },
        State {
            id: contentState
            name: 'state2'
            PropertyChanges {
                target: myTitle
                opacity: 0
            }
            PropertyChanges {
                target: contentItem
                opacity: 1
            }
            PropertyChanges {
                target: blur
                opacity: 1
            }
            PropertyChanges {
                target: blur
                radius: blurRadius
            }
        }
    ]

    GaussianBlur {
        id: blurry
        transparentBorder: true
        visible: true
        anchors.fill: parent
        source: title
        radius: 1
        samples: 48
        opacity: 0

        Behavior on radius {
            NumberAnimation {
                duration: 400
                easing.type: Easing.OutCubic
            }
        }
        Behavior on opacity {
            NumberAnimation {
                duration: 400
                easing.type: Easing.OutCubic
            }
        }
    }

    Behavior on opacity {
        NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
    }


    Behavior on contentItem.opacity {
        NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
    }
}
