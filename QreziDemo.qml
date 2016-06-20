import QtQuick 2.2
import QtGraphicalEffects  1.0
import Qrezi 0.1

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
         radius:  40 / ( qrezi.current_scale + 1)
         samples: 32
      }


      x:  100 + qrezi.current_x * 0.1
      y:  qrezi.current_y * 0.1
      scale: 1.5 + qrezi.current_scale * 0.1
   }


   Qrezi {

      id: qrezi

      slides:  [ slide1
               , slide1.children[0]
               , slide2
               , slide3
               , slide4
               ]

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
         color:    "#33778899"

         title: "Slide 1"
      }

      Column {
         x: -300
         y: -150
         width: 800
         scale: 0.25
         rotation: 10
         spacing: 2
         CenteredText {
            id: slide2
            color: "#afb"; width: parent.width; height: 400
            title: "Slide2"
         }
         Item {
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


      Code {

         id:   slide3

         code:
"
template< typename X >
struct fency {
   X foo() { return X{1337}; }
};

auto lambda = [](int b) { return b + a; }

int main() { std::cout << fency::foo() << std::endl;  }

"

         x:      -100
         y:      -150
         scale:   0.2
         rotation: 180

         width:   800
         height:  500

         border {
            width: 2
            color: "#000"
         }
      }


      CodeView {

         id: slide4

         x:    -120
         y:    0
         scale:      0.2
         rotation:   -20

         width:   800
         height:  400

         font.pointSize: 30
         code:
"
var head = function( xs ) {
   return xs[0]
}

var tail = function( xs ) {
   return xs.slice(1)
}

var fold = function( f, x, xs ) {
   return fold( f, f(x,head(xs)), tail(xs) )
}
"
         language: "javascript"
         style:    "paraiso.light"
      }

   }
}
