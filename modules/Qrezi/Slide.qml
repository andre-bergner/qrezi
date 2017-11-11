import QtQuick 2.2
import "." 0.1
import "qrezi_tools.js" as Tools

Frame {

   id: slide

   default property alias column: column_item.children
   property alias background: background_holder.children
   property alias spacing: column_item.spacing


   Item {
      id: background_holder
      anchors.fill: parent
   }

   Column {
      id: column_item

      anchors.top: parent.top
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.margins: 40

      spacing: 20
   }
}
