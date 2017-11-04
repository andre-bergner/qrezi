import QtQuick 2.2
import Qrezi 0.1


Qrezi {

   id: qrezi

   slides: []

   onSlidesChanged: current_slide = 0

   background: Rectangle {
      color:  '#222'
      anchors.fill: parent
   }

   Column {
      id: markdown_parser

      width: qrezi.width
      spacing: 5

      property var markdown:
         "
         # Slide1

         Lorem Ipsum

         # Test123

         Content Content Content Content

         # AnotherOne
         "

      Component.onCompleted: {

         var lines = markdown_parser.markdown.split('\n');
         for (var l in lines)
         {
            var line = lines[l].trim();
            if (line[0] === '#')
            {
               var item = Qt.createQmlObject("
                  import QtQuick 2.2

                  Rectangle {
                     width: 800
                     height: 450
                     color: '#44ffffff'
                     Text {
                        anchors.centerIn: parent
                        text: '"+line.split('#')[1].trim()+"'
                        font.pointSize: 40
                        color: '#fff'
                     }
                  }
               ", markdown_parser)
               qrezi.slides.push(item)
               console.log('Adding slide: ' + line)
            }
         }
      }
   }

}
