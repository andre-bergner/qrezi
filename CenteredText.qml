import QtQuick 2.2

Rectangle {

   property alias title:   t.text
   property alias font:    t.font
   property alias textColor:  t.color

   antialiasing: true
   color:        "#789"

   Text {
      id: t
      anchors.centerIn: parent
      font.pointSize:   60
      wrapMode:         Text.WordWrap
   }
}
