import QtQuick 2.2

Item {

   property alias code:       code_item.code
   property alias font:       code_item.font
   property alias language:   code_item.language
   property alias style:      code_item.style

   property alias boundsBehavior: flickable.boundsBehavior

   height: code_item.contentHeight / 2
   width:  code_item.contentWidth + 30

   function goto_line(line) { flickable.contentY = code_item.y_at_line(line); }

   Flickable
   {
      id: flickable
      objectName: "CodeView"

      anchors.fill: parent

      boundsBehavior: Flickable.StopAtBounds
      flickableDirection: Flickable.VerticalFlick

      contentWidth:  code_item.width
      contentHeight: code_item.height

      Behavior on contentY {
         NumberAnimation {
             duration: 800
             easing.type: Easing.InOutQuint
         }
      }

      clip: true

      Code
      {
         id: code_item
         width: flickable.width
         code:
"foo()
bar()
baz<1,2,3>(4,5,6)

auto x = [](){};
auto y = []{}();
"
      }

   }

   Item {
      id: scrollBar
      z: 2
      anchors.right: parent.right
      anchors.top: parent.top
      anchors.bottom: parent.bottom
      anchors.rightMargin: 2

      visible: flickable.contentHeight - scrollBar.height > 0

      width: 10

      Rectangle {
         id: handle
         height: 80
         width:  10
         radius: 5
         color: '#44ffffff'
         y: (scrollBar.height-handle.height) * flickable.contentY / (flickable.contentHeight-scrollBar.height)
      }
   }

}
