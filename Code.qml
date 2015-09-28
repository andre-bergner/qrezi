import QtQuick 2.2
import "hljs/highlight.js" as HLJS

import "hljs/languages/cpp.js"        as Lang_cpp
import "hljs/languages/javascript.js" as Lang_javascript
import "hljs/languages/haskell.js"    as Lang_haskell
import "hljs/languages/x86asm.js"     as Lang_x86asm


Rectangle {

   id: item

   property string code:      "template<int n> class Goedel : Goedel<n-1> {};"
   property string language:  "c++"
   property string style:     "monokai"

   property alias  font: text_item.font

   color: text_item.background_from_css

   height: text_item.contentHeight

   Text {

      id: text_item

      antialiasing: true
      anchors.fill: parent
      anchors.margins: 10

      font.family: "Source Code Pro"
      font.pointSize: 20
      //font.weight: Font.Light
      textFormat: Text.RichText

      Component.onCompleted: load_css_file( "hljs/styles/" + item.style + ".css" )

      text: add_css( highlight( item.code ), _css )


      //  ---------------------------------------------------------------------------------
      // private functionality
      //  ---------------------------------------------------------------------------------

      property variant _hljs: {
         var hljs = HLJS.hljs()
         var ls = [ ["c++"        , Lang_cpp        ]
                  , ["javascript" , Lang_javascript ]
                  , ["haskell"    , Lang_haskell    ]
                  , ["x86asm"    , Lang_x86asm      ]
                  ]
         ls.forEach( function(l){ hljs.registerLanguage( l[0], l[1].register ) })
         return hljs
      }

      function get_background_from_css(css) {
         var match_trials = 10    // for some very weird reason a match might fail several times
         for ( var match = null ; ! match && match_trials ; --match_trials )
            match = /background:\s*([#1-9a-zA-Z].+);/g.exec(css)
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
         return post_process_html( _hljs.highlight( item.language, txt ).value )
      }

      function add_css( txt, css )
      {
         return "<style>" + css + "</style>"
              + "<span class='hljs'>" + txt + "</span>"
      }

   }
}
