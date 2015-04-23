import QtQuick 2.2

Rectangle {

   width: 800
   height: 500
   color:  '#000'

   Zoomer {

      id: canvas

      anchors.fill: parent

      Frame { anchors.fill: parent }

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
         Frame {
            width: parent.width; height: 400
            Rectangle {
               antialiasing: true
               anchors.fill: parent
               color: "#afb"
               CenteredText {
                  width:  parent.width
                  height: parent.height
                  color: "#987"; scale: 0.4; rotation: 120; title: "Hello"
               }
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