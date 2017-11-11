import  QtQuick 2.0
import  QtGraphicalEffects  1.0
import "../"

Frame {

    id: slide

    property alias title:   titleText.text
    property alias bullets: listView.model

    property bool text_shadow: true

    property string text_font:   "Optima"
    property variant main_point_markers: ["•","●"]

    property alias title_size:  titleText.font.pointSize
    property int font_size:   40
    property int font_size12: font_size
    property int font_size2:  font_size
    property int font_size22: font_size
    property variant font_color: qrezi_style.text_color

    property real x1: 80
    property real y1: 100
    property real x2: 80
    property real y2: 50

    antialiasing: true

    Item {

        id: slide_content2
        anchors.fill: parent

        visible: blur.radius > 1 ? false : true

        Text {
            id: titleText
            font.pointSize:  7*13
            anchors.centerIn: parent
            font.family: "Adequate"
            text: "topic"
            color: font_color
        }
    }

    GaussianBlur {
        id: blur
        visible: true
        anchors.fill: parent
        source: slide_content2
        radius: 1
        samples: 48

        Behavior on radius  { NumberAnimation { duration: 400; easing.type: Easing.OutCubic } }
        Behavior on opacity { NumberAnimation { duration: 400; easing.type: Easing.OutCubic } }
    }

    ListView {
        id: listView
        opacity: 0
        width:  parent.width - x - 10
        height: parent.height - y - 10
        x: 100
        y: 100
        model:
        [
            "• point 1",
            "    - sub point 1",
            "    - sub point 1",
            "• point 2",
        ]

        delegate: Item {

            width: parent.width
            height: itemText2.implicitHeight * opacity

            function is_any_of( xs , x ) {
                for ( var n = 0 ; n < xs.length ; ++n )
                    if ( xs[n] == x ) return true
                return false
            }

            function is_marker( c ) { return  is_any_of( main_point_markers , c ) }

            opacity: ( is_marker(modelData[0]) ) || (slide.state === 'state3')
            TalkText {
                id:             itemText2
                font.family:    slide.text_font
                font.pointSize: is_marker(modelData[0])
                                ?  slide.state === 'state3'
                                   ?  slide.font_size12
                                   :  slide.font_size
                                :  slide.font_size2
                textFormat: Text.RichText
                text:       modelData
                color:      font_color
                shadow:     text_shadow

                Behavior on opacity {
                    NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
                }
            }
            Behavior on opacity {
                NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
            }
        }

        Behavior on opacity { NumberAnimation { duration: 200; easing.type: Easing.InOutQuad } }
        Behavior on x       { NumberAnimation { duration: 200; easing.type: Easing.InOutQuad } }
        Behavior on y       { NumberAnimation { duration: 200; easing.type: Easing.InOutQuad } }
    }

    state: 'state1'

    states: [
        State {
            name: 'state1'
            PropertyChanges { target: blur; radius: 1 }
            PropertyChanges { target: listView; opacity: 0 }
            PropertyChanges { target: listView; x: slide.x1 + 150 }
            PropertyChanges { target: listView; y: slide.y1 }
        },
        State {
            name: 'state2'
            PropertyChanges { target: blur; radius: 36 }
            PropertyChanges { target: listView; opacity: 1 }
            PropertyChanges { target: listView; x: slide.x1 }
            PropertyChanges { target: listView; y: slide.y1 }
        },
        State {
            name: 'state3'
            PropertyChanges { target: blur; radius: 36 }
            PropertyChanges { target: blur; opacity: 0.5 }
            PropertyChanges { target: listView; opacity: 1 }
            PropertyChanges { target: listView; x: slide.x2 }
            PropertyChanges { target: listView; y: slide.y2 }
        }
    ]
}
