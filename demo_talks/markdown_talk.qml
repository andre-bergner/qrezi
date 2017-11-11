import QtQuick 2.2
import Qrezi 0.1


Qrezi {

   id: qrezi

   slides: []

   config {
      slide_height: 600
      text_color: '#fff'
      heading_font.color: '#f00'
   }

   background: Rectangle {
      color:  '#222'
      anchors.fill: parent
   }

   MarkdownSlides {
      markdown:
      "
      # Slide 1
      This is some text
      # Slide 2
      Yeah, man!
      "
   }
}
