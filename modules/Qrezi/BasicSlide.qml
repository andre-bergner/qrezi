import QtQuick 2.2
import "." 0.1
import "qrezi_tools.js" as Tools

Frame {

   id: slide

   property string heading: "Heading"
   property variant paragraphs:
   [  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat."
   ,  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
   ]

   property alias heading_font: heading_item.font

   property alias background: background_holder.children

   property alias column: column_item.children

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

      Heading {
         id: heading_item
         text: slide.heading
      }

      Repeater {
         model: slide.paragraphs
         delegate: Paragraph { text: modelData }
      }
   }

}
