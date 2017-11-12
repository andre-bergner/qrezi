import QtQuick 2.2
import "hljs/highlight.js" as HLJS

import "hljs/languages/cpp.js"        as Lang_cpp
import "hljs/languages/javascript.js" as Lang_javascript
import "hljs/languages/haskell.js"    as Lang_haskell
import "hljs/languages/qml.js"        as Lang_qml
import "hljs/languages/x86asm.js"     as Lang_x86asm


Rectangle {

   id: code_item

   property string code:      "template<int n> class Goedel : Goedel<n-1> {};\nGoedel<1337> goedel;\n"
   property string language:  "c++"
   property string style:     "monokai"
   property bool show_line_numbers:  true
   property alias font: text_item.font

   readonly property int contentWidth: text_item.contentWidth
   readonly property int contentHeight: text_item.contentHeight

   property int num_lines: code.split('\n').length

   function y_at_line(line_number) {
      return (line_number-1) * contentHeight/num_lines;
   }

   color: text_item.background_from_css

   function brightness(c) { return (299.*c.r + 587.*c.g + 114.*c.b) / 1000. }

   onColorChanged: {
      line_numbers_item.color = (brightness(line_numbers_item.color) < 0.5)
                              ? Qt.lighter(color, 3)
                              : Qt.darker(color, 3)
   }


   height: text_item.contentHeight


   Row {

      id: row_item

      anchors.fill: parent
      anchors.margins: 10
      spacing: 10

      Text {
         id: line_numbers_item

         visible: code_item.show_line_numbers
         horizontalAlignment: Text.AlignRight

         font: code_item.font
         //textFormat: Text.RichText

         text: {
            var line_numbers = ""
            for (var l=0; l<num_lines; ++l)
               line_numbers += String(l+1) + "\n"
            return line_numbers
         }

      }

      Text {

         id: text_item

         font.family: "Source Code Pro"
         font.pointSize: 20
         //font.weight: Font.Light
         textFormat: Text.RichText

         Component.onCompleted: load_css_file( "hljs/styles/" + code_item.style + ".css" )

         text: add_css( highlight( code_item.code ), _css )


         //  ---------------------------------------------------------------------------------
         // private functionality
         //  ---------------------------------------------------------------------------------

         property variant _hljs: {
            var hljs = HLJS.hljs()
            var ls = [ ["c++"        , Lang_cpp        ]
                     , ["javascript" , Lang_javascript ]
                     , ["haskell"    , Lang_haskell    ]
                     , ["qml"        , Lang_qml        ]
                     , ["x86asm"     , Lang_x86asm     ]
                     ]
            ls.forEach( function(l){ hljs.registerLanguage( l[0], l[1].register ) })
            return hljs
         }

         function get_background_from_css(css) {
            var match_trials = 10    // for some very weird reason a match might fail several times
            for ( var match = null ; ! match && match_trials ; --match_trials )
               match = /background:\s*([#1-9a-zA-Z].+?);/g.exec(css)
            return match ? match[1] : "#fff"
         }

         property string _css: ""
         property string background_from_css: get_background_from_css(_css)

         function load_css_file( file_name )
         {
            var request = new XMLHttpRequest()
            request.open( 'GET', file_name )
            request.onreadystatechange = function(event)
            {
               if (request.readyState == XMLHttpRequest.DONE)  _css = request.responseText
            }
            request.send()
         }


         function post_process_html( txt )
         {
            return txt
               .split("\n").join("<br/>")  // replace newlines with br tags
               .split(" ").join(" ")       // replace standard spaces with hard spaces
         }

         function highlight( txt )
         {
            return post_process_html( _hljs.highlight( code_item.language, txt ).value )
         }

         function add_css( txt, css )
         {
            return "<style>" + css + "</style>"
                 + "<span class='hljs'>" + txt + "</span>"
         }

      }
   }
}
