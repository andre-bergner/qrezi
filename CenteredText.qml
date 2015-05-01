import QtQuick 2.2

Rectangle {

   property alias title:  t.text

   antialiasing: true
   color:        "#789"

   Text {
      id: t
      anchors.centerIn: parent
      font.pointSize:   60
      wrapMode:         Text.WordWrap
   }
}
