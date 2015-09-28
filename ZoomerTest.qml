import QtQuick 2.2
import QtGraphicalEffects  1.0

Rectangle {

   width: 800
   height: 500
   color:  '#000'

   Item {

      width: 800
      height: 500

      CenteredText {
         id: background
         anchors.fill: parent
         title: "B A C K G R O U N D"
         font.pointSize: 40
         color: "#345"
      }

      GaussianBlur {
         anchors.fill: background

         visible: true
         source:  background
         radius:  30 / ( canvas.current_scale + 1)
         samples: 32
      }


      x:  100 + canvas.current_x * 0.1
      y:  canvas.current_y * 0.1
      scale: 1.5 + canvas.current_scale * 0.1
   }

   Zoomer {

      id: canvas

      anchors.fill: parent

      Item { anchors.fill: parent }

      CenteredText {
         id: slide1
         x: 250
         y: 50
         width:    600
         height:   350
         scale:    0.7
         rotation: 90
         color:    "#789"

         title: "No, clicke MEEE !!!"
      }

      Column {
         x: -300
         y: -150
         width: 800
         scale: 0.25
         rotation: 10
         spacing: 2
         CenteredText {
            id: tile1
            color: "#afb"; width: parent.width; height: 400
            title: "I'm the one to click"
         }
         Rectangle {
            width: parent.width
            height: 400
            antialiasing: true
            color: "#afb"
            CenteredText {
               width:  parent.width
               height: parent.height
               color: "#987"; scale: 0.4; rotation: 120; title: "Hello"
            }
         }
      }


      CenteredText {

         id:   view2

         title: "Click Me, please!"

         x:      -100
         y:      -150
         scale:   0.2
         rotation: 180

         width:   800
         height:  500
         color:  "#789"

         border {
            width: 2
            color: "#000"
         }
      }


      CenteredText {

         x:    -120
         y:    0
         scale:      0.2
         rotation:   -20

         width:   800
         height:  400

         color: "#aa7"

         title: "You can zoom as well"
      }

   }
}