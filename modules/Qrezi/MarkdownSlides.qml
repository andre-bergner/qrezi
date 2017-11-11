import QtQuick 2.2
import Qrezi 0.1
import "qrezi_tools.js" as Tools

Frame {

   id: markdown_slides

   property string markdown:
      "
      # Slide 1
      Lorem Ipsum

      # Slide 2
      Lorem Ipsum

      # Slide 3
      Lorem Ipsum
      "

   Column {

      id: column

      width: qrezi_style.width
      spacing: 5

      Component.onCompleted: {

         var lines = markdown_slides.markdown.split('\n');
         /*
         var slides = [];
         var current_side = null;

         for (var l in lines)
         {
            var line = lines[l].trim();
            if (line === '') continue;

            if (line[0] === '#')
            {
               if (current_side != null)
                  slides.push(current_side)
               heading_text = line.split('#')[1].trim();

               current_side = {
                  heading: ''
                  paragraphs: []
               }
            }
         }
         if (current_side != null)
            slides.push(current_side)
         */

         for (var l in lines)
         {
            var line = lines[l].trim();
            if (line[0] === '#')
            {
               var heading_text = line.split('#')[1].trim();
               var item = Qt.createQmlObject(
                 "import QtQuick 2.2
                  import Qrezi 0.1

                  BasicSlide {   // TODO should com from outside and the created here
                     background: Rectangle {
                        anchors.fill: parent
                        color: '#44ffffff'
                     }
                     heading: '" + heading_text + "'
                  }",
                  column)
               // TODO should this happen automatically? 
               Tools.get_qrezi().slides.push(item)
               Tools.get_qrezi().slides = Tools.get_qrezi().slides   // force update (QML/JS bug)
               console.log('Adding slide: ' + line)
            }
         }
      }
   }

}
