import QtQuick 2.2

Item {

   readonly property bool wants_wheel_events: true

   property alias code:       code_item.code
   property alias font:       code_item.font
   property alias language:   code_item.language
   property alias style:      code_item.style

   property alias boundsBehavior: flickable.boundsBehavior

   height: Math.max( code_item.height, 400 )   // TODO max must adapt to external situation
   width:  code_item.width

   function goto_line(line) { flickable.contentY = code_item.y_at_line(line); }

   Flickable
   {
      id: flickable

      //contentY: code_item.y_at_line(3)

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
