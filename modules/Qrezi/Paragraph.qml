import  QtQuick 2.2
import "qrezi_tools.js" as Tools

Text {

   readonly property variant qrezi_style: Tools.qrezi_style()

   anchors.left:  parent.left
   anchors.right: parent.right

   font.family:      qrezi_style.paragraph_font.family
   font.pointSize:   qrezi_style.paragraph_font.size
   font.weight:      qrezi_style.paragraph_font.weight
   color:            qrezi_style.paragraph_font.color
   wrapMode:         Text.WordWrap
   horizontalAlignment:  Text.AlignJustify
}
