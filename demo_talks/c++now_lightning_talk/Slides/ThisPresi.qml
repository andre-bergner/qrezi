import QtQuick 2.2
import Qrezi 0.1

CodeWithText {

   width:   800
   height:  450

   style:   "obsidian"
   code_size: 16

   color:  "transparent"

   code:
'import QtQuick 2.2
import QtGraphicalEffects  1.0

import "../qrezi"
import "Slides" as Slides


Rectangle {

   id: root

   readonly property int slide_width:  800
   readonly property int slide_height: 600

   width:  slide_width
   height: slide_height
   color:  "#000"

   Item {

      id: background

      width: background_img.width
      height: background_img.height

      Slides.Water {
         x: -100
         y: -100
         width: 800
         height: 800
      }

      x:  100 + qrezi.current_x * 0.1
      y:  qrezi.current_y * 0.1
      scale: 1.5 + qrezi.current_scale * 0.1
   }


   Text {
      z:1
      anchors.right:  parent.right
      anchors.bottom: parent.bottom
      anchors.rightMargin:  6
      anchors.bottomMargin: 4
      font.family: "Adequate"
      font.pointSize: 20
      text: (qrezi.current_slide + 1) + " / " + qrezi.slides.length
      color: "#fff"
   }



   Qrezi {

      id: qrezi

      slides:     [ title
                  , cpp
                  , braces
                  , title
                  , presentation_frameworks
                  , pqrezi
                  , qrezi_info
                  , this_presi
                  ]

      current_frame: title

      anchors.fill: parent

      Component.onCompleted: { next_view(); prev_view() }

      Item {
         id: title
         width: slide_width
         height: slide_height

         Text {

            readonly property string lightning: "<span style=\"font-family:\'Menlo\'\">⚡</span>"

            anchors.centerIn: parent
            font.family: "Adequate"
            font.pointSize: 70
            textFormat: Text.RichText

            text: "my " + lightning + " talk"
            color: "#fff"
         }
      }


      Slides.VadimsCast {
         id: cpp
         width: slide_width
         height: slide_height
         // x: 92
         // y: 5
         scale: 0.01
      }


      Slides.Braces {
         id: braces
         width: slide_width
         height: slide_height
         y: 20
         scale: 0.01
      }


      Topic {
         id: presentation_frameworks

         width:   slide_width
         height:  slide_height
         x: 0
         y: -800
         scale: 3

         title: "presentation\nframeworks"

         x1: 220
         y1: 160
         x2: 100
         y2: 10

         font_size:  42
         font_size12: 30
         font_size2:  22


         bullets:
            [  "● Power Point"
            ,  "     ◦ ugly formulas, no support for code"
            ,  "     ◦ wysiwyg"
            ,  "● Keynote"
            ,  "     ◦ Power Point in good"
            ,  "● Google Slides"
            ,  "     ◦ online Power Point, good for collaboration"
            ,  "● Latex Beamer"
            ,  "     ◦ nice for formulas, ok for code"
            ,  "     ◦ layouting is horror"
            ,  "     ◦ text based → reproducable"
            ,  "● Prezi"
            ,  "     ◦ frees you from the slide box, mindmap style"
            ,  "     ◦ getting code & formulas into it is hard"
            ,  "     ◦ online rent-ware"
            ,  "● reveal.js"
            ,  "     ◦ non default layouting is awkward (html, css, …)"
            ,  "     ◦ text based → reproducable"
            ]
      }

      Slides.Pqrezi {
         id: pqrezi
         width: slide_width
         height: slide_height
         x: 2000
         y: -500
         scale: 3
         rotation: 90
      }


      Topic {
         id: qrezi_info

         width:   slide_width
         height:  slide_height

         x: 3200
         y: -500
         scale: 3
         rotation: 90

         title: "qrezi"

         Text
         {
            text: "github.com/andre-bergner/qrezi"
            anchors.horizontalCenter: parent.horizontalCenter
            y: 30
            font.family: "American Typewriter"
            font.pointSize: 26
            color: "#ddf"
         }

         x1: 80
         y1: 160
         x2: 80
         y2: 160

         font_size:  40


         bullets:
            [  "● written in pure qml"
            ,  "● text based, no binary incompatibilitlilty"
            ,  "● can use many common js libs"
            ,  "● can use shaders, yeah"
            ,  "● program & reuse custom slides"
            ,  "● c++ plugins"
            ]
      }

      Slides.ThisPresi {
         id: this_presi

         width:   slide_width
         height:  slide_height

         x: 1500
         y: 0
         scale: 1
         rotation: 200

      }

   }
}
'

}