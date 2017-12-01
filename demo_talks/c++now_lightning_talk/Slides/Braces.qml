import QtQuick 2.2
import QtQuick.Layouts 1.2
import Qrezi 0.1

Item {

   width:   800
   height:  450

  ColumnLayout {
     anchors.fill: parent

     Item {
        width: 10
        Layout.preferredHeight: 20
     }

     TalkText2 {
        Layout.alignment: Qt.AlignCenter
        text: "c++andy c++rush"
     }

     Code {
        Layout.alignment: Qt.AlignCenter

        width: 240

        style:   "obsidian"
        language: "c++"
        font.pointSize: 30

        text:
"int main()
 {
    [](){};
    []{}();
    {}[]{};
 }
"

     }
  }
}