import  QtQuick 2.2
import  QtGraphicalEffects  1.0

Item {

   property alias shadow: shadow_item.visible

   property int contentWidth: item.contentWidth
   property int contentHeight: item.contentHeight

   property alias wrapMode: item.wrapMode
   property alias t: item.text
   property alias text: item.text
   property alias s: item.font.pointSize
   property alias color: item.color
   property alias textFormat: item.textFormat
   property alias font: item.font

   width: item.contentWidth
   height: item.contentHeight

   implicitWidth: item.implicitWidth
   implicitHeight: item.implicitHeight

   Text {
      id: item
      anchors.fill: parent
      font.family: "Optima"
      //wrapMode: Text.WordWrap
      font.pointSize: 20
   }

   DropShadow
   {
      id: shadow_item

      anchors.fill:  item
      source:        item

      horizontalOffset: 2
      verticalOffset: 2

      radius: 4.0
      samples: 8
      color: "#bb000000"
   }

}