import  QtQuick 2.2
import "qrezi_tools.js" as Tools

Frame {

   property alias text:     text_item.text
   property alias color:    text_item.color
   property alias font:     text_item.font
   property alias style:    text_item.style
   property alias wrapMode: text_item.wrapMode

   Text {

      id: text_item

      readonly property variant qrezi_style: Tools.qrezi_style()

      anchors.centerIn: parent

      font.family:      qrezi_style.heading_font.family
      font.pointSize:   qrezi_style.heading_font.size * 2
      font.weight:      qrezi_style.paragraph_font.weight
      color:            qrezi_style.heading_font.color
      wrapMode:         Text.WordWrap
   }
}