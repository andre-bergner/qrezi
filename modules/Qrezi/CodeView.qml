import QtQuick 2.2

Flickable
{
   id: flickable
   objectName: "CodeView"

   property alias code:       code_item.code
   property alias font:       code_item.font
   property alias language:   code_item.language
   property alias style:      code_item.style

   boundsBehavior: Flickable.StopAtBounds

   flickableDirection: Flickable.VerticalFlick
   clip: true

   contentWidth:  code_item.width
   contentHeight: code_item.height
   height: contentHeight

   Code
   {
      id: code_item
      code:"
foo()
bar()
baz<1,2,3>(4,5,6)

auto x = [](){};
auto y = []{}();
"

      width:  flickable.width
   }
}
