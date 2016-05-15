import QtQuick 2.2

Flipable {

   id: flipable

   property bool flipped: false
   property real flip_duration: 300 + 200 * Math.random()

   width:  Math.max( front.width, back.width )
   height: Math.max( front.height, back.width )


    transform: Rotation {
        id: rotation
        origin.x: flipable.width/2
        origin.y: flipable.height/2
        axis.x: 0; axis.y: 1; axis.z: 0
        angle:  0
        Behavior on angle { NumberAnimation { duration: flip_duration; easing.type: Easing.InOutQuad } }
    }

   state: "front"

   states: [
      State {
         name: "front"
         PropertyChanges { target: rotation; angle: 0 }
         when: !flipable.flipped
      },
      State {
         name: "back"
         PropertyChanges { target: rotation; angle: 180 }
         when: flipable.flipped
      }
   ]
}
