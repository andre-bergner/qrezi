import  QtQuick 2.2
import "qrezi_tools.js" as Tools

Column {

   anchors.left:  parent.left
   anchors.right: parent.right

   property alias text:     text_item.text
   property alias color:    text_item.color
   property alias font:     text_item.font
   property alias style:    text_item.style
   property alias wrapMode: text_item.wrapMode

   property alias padding:  padding_item.height

   Text {

      id: text_item

      readonly property variant qrezi_style: Tools.qrezi_style()

      anchors.horizontalCenter: parent.horizontalCenter

      font.family:      qrezi_style.heading_font.family
      font.pointSize:   qrezi_style.heading_font.size
      font.weight:      qrezi_style.paragraph_font.weight
      color:            qrezi_style.heading_font.color
      wrapMode:         Text.WordWrap
   }

   Item {
      id: padding_item
      anchors.left:  parent.left
      anchors.right: parent.right
      height: 20
   }
}