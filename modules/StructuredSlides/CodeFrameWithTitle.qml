import QtQuick 2.9
import Qrezi 0.1

Frame {

    property alias code: codeView.text
    property alias title: heading.text
    property alias language:codeView.language

    property bool disableMouseHandling: true


    Column {
       id: column_item

       anchors.fill: parent
       anchors.bottomMargin: 40
       Heading {
           id: heading
           text: "myc.cpp"
       }

        CodeView {
            id: codeView
              width: parent.width
              height: 370

              // style: "atelier-heath.light"
              language: "c++"
              // font.pointSize: 30
              font.family: "Source Code Pro"

              text: "c = c++;"


                  Behavior on opacity {
                      NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
                  }
        }
        Behavior on opacity {
            NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
        }
    }
}
