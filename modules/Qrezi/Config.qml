import QtQuick 2.2

QtObject {
   property int slide_width:        800
   property int slide_height:       450
   property variant text_color:     '#000'

   property FontStyle heading_font: FontStyle {
      color: text_color
      family: 'Helvetica Neue'
      size:  48
      weight:  Font.Light
   }

   property FontStyle paragraph_font: FontStyle {
      color: text_color
      family: 'Arial'
      size:  26
      weight:  Font.Light
   }

   property string code_style: "monokai"
}
