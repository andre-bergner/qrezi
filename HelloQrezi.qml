import QtQuick 2.2
import Qrezi 0.1

Qrezi {

   // You can override the default order of slides:
   // slides: [s3, slide1]

   Column {
      Slide {
         id: slide1
         Heading { text: "Hello Qrezi"}
         Paragraph {
            text: "You can navigate using the left & right arrow key or space."
         }
         Paragraph { text: "Hit 'space' now." }
      }

      Slide {
         Heading { text: "Where am I"}
         Paragraph {
            text: "Slides are in a spatial relationship to each other. "
                + "That's why we need a Column around them because using "
                + "a Column or a Row is the easiest way to put them side "
                + "by side automatically."
         }
         Paragraph {
            text: "Of course you can put the slides where ever you want. "
                + "But then you have to layout them yourself or use other "
                + "layout items."
         }
         Rectangle {
            id: slide2
            property bool add_to_qrezi: true
            width: 150
            height: 50
            color: '#223'
            Text {
               anchors.centerIn: parent
               text: "Some custom slide."
               color: '#fff'
            }
         }
      }

      Slide {
         id: s3
         Heading { text: "Code"}
         Paragraph { text: "You can easily add color highlighted code blocks:" }
         CodeView {
            code: 'int main(){ printf("Hello qrezi!"); }\n\n\n\n\n\n\n\n\n\n'
            height: 150
         }
      }

      Slide {
         Heading { text: "Conclusions"}
         Paragraph { text: "This is just aweseome."}
         Paragraph { text: "It's really great."}
      }

   }
}
