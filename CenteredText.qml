import QtQuick 2.2

Frame {

   property alias title:  t.text
   property alias color:  rect.color
   property alias border: rect.border

   Rectangle {

      id: rect

      antialiasing: true
      anchors.fill: parent
      color:        "#789"

      Text {
         id: t
         anchors.centerIn: parent
         font.pointSize:   60
         wrapMode:         Text.WordWrap
      }
   }
}
