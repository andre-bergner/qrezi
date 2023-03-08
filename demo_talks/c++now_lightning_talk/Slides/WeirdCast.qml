import QtQuick 2.2
import Qrezi 0.1

Flipper {

   width:   800
   height:  450

   TalkText2 {
      anchors.horizontalCenter: parent.horizontalCenter
      y: 50
      text: "Confuse your collegues."
   }


   front: Code {

      anchors.centerIn: parent

      width: 700

      style:   "obsidian"
      language: "c++"
      font.pointSize: 30
      text:
"float x = some_value;
int temp = (-1)[(int *)(&x+1)];
...
"
   }

   back: Code {

      anchors.centerIn: parent

      width: 700

      style:   "obsidian"
      language: "c++"
      font.pointSize: 30
      text:
"float x = some_value;
int temp = reinterpret_cast<int&>(x);
...
"
   }


}
