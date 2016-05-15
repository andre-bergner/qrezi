import QtQuick 2.2
import Qrezi 0.1

Item {

   Item {
      anchors.centerIn: parent
      anchors.horizontalCenterOffset: flipper.width*scale/2
      scale: 6

      TalkText2 {
         id: rezi
         text: "rezi"
         anchors.centerIn: parent
      }

      Flipper{
         id: flipper

         anchors.right: rezi.left
         anchors.top: rezi.top

         flip_duration: 300

         height: t.height
         width: t.width
         TalkText2 {
            id: t
            text: "p"
         }
      }

      TalkText2 {
         id: ml
         text: "ml"
         font.pointSize: 7
         x: rezi.x + 30
         y: rezi.y + rezi.height - 10.5
         opacity: 0

         Behavior on x       { NumberAnimation { duration: 300; easing.type: Easing.InOutQuad } }
         Behavior on opacity { NumberAnimation { duration: 300 } }
     }
   }

   state: "state1"

   states: [
      State {
         name: "state1"
         PropertyChanges { target: flipper; state: "front" }
      },
      State {
         name: "state2"
         PropertyChanges { target: flipper; state: "back" }
         PropertyChanges { target: ml; x: rezi.x-1.5 }
         PropertyChanges { target: ml; opacity: 1 }
      }
   ]
}