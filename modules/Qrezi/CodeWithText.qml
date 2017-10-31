import QtQuick 2.2

Rectangle {

   property alias text:       text_item.text
   property alias text_size:  text_item.s
   property alias text_shadow:text_item.shadow
   property alias code:       code_item.code
   property alias code_size:  code_item.font.pointSize
   property alias language:   code_item.language
   property alias style:      code_item.style

   color:  "#789"

   TalkText
   {
      id: text_item

      s: 30

      anchors.topMargin: 20
      anchors.margins: 30
      anchors.top: parent.top
      anchors.left: parent.left
      anchors.right: parent.right

      wrapMode: Text.WordWrap
   }

   CodeView
   {
      id: code_item

      objectName: "CodeView"

      anchors.margins: 30
      anchors.topMargin: 10
      anchors.top:   text_item.bottom
      anchors.left:   parent.left
      anchors.right:  parent.right
      anchors.bottom: parent.bottom

      boundsBehavior: Flickable.StopAtBounds
   }
}
