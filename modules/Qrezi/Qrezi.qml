import QtQuick 2.2
import "algorithms.js" as A

Item {

   id: qrezi
   objectName: "qrezi"

   property Config config: Config {}

   width:  config.slide_width
   height: config.slide_height

   property alias slides: zoomer.slides
   readonly property alias flat_slides: zoomer.flat_slides
   readonly property alias current_slide: zoomer.current_slide

   default property alias items: zoomer.frames

   property alias current_x:     zoomer.current_x
   property alias current_y:     zoomer.current_y
   property alias current_scale: zoomer.current_scale

   property alias background: background_holder.children
   property alias foreground: foreground_holder.children

   Item {
      id: background_holder
      anchors.fill: parent
   }

   Zoomer {

      id: zoomer

      anchors.fill: parent

      // TODO
      // • if slide is already current refocus if zoomed out/in and clicked again

      readonly property int slide_width:  800
      readonly property int slide_height: 450

      width:  slide_width
      height: slide_height


      property variant slides;
      property variant flat_slides;
      property int current_slide: 0

      Component.onCompleted: {
         if (slides)
            return;  // user defined own slides order

         zoomer.slides = A.descendants(qrezi).filter( function(c){
            return c.add_to_qrezi && c.add_to_qrezi === true;
         });
      }

      onSlidesChanged: {
         flat_slides = flatten(slides)
         current_frame = flat_slides[current_slide]
      }

      onCurrent_slideChanged: current_frame = flat_slides[current_slide]


      function flatten(arr) {
         return arr.reduce(function (flat, toFlatten) {
            return flat.concat(Array.isArray(toFlatten) ? flatten(toFlatten) : toFlatten);
         }, []);
      }


      focus: true

      Keys.onPressed: {
         switch (event.key) {
            case Qt.Key_Space: {
               next_view()
               event.accepted = true
               break
            }
            case Qt.Key_Right: {
               next_view()
               event.accepted = true
               break
            }
            case Qt.Key_PageDown: {
               next_view()
               event.accepted = true
               break
            }
            case Qt.Key_Left: {
               prev_view()
               event.accepted = true
               break
            }
            case Qt.Key_PageUp: {
               prev_view()
               event.accepted = true
               break
            }
         }
      }

      function next_state()
      {
         if ( current_frame.states.length > 0 )
         {
            for ( var s = 0 ; s < current_frame.states.length ; ++s )
            {
               if ( current_frame.state === current_frame.states[s].name )
               {
                  if ( s+1 < current_frame.states.length )
                  {
                     current_frame.state = current_frame.states[s+1].name
                     return true
                  }
                  else return false
               }
            }
         }
         else return false
      }

      function prev_state()
      {
         if ( current_frame.states.length > 0 )
         {
            for ( var s = 0 ; s < current_frame.states.length ; ++s )
            {
               if ( current_frame.state === current_frame.states[s].name )
               {
                  if ( s > 0 )
                  {
                     current_frame.state = current_frame.states[s-1].name
                     return true
                  }
                  else return false
               }
            }
         }
         else return false
      }

      function contains(xs,x) { return  xs.indexOf(x) != -1 }

      function is_slide(s) { return contains(flat_slides,s) }

      function first_of( xs , p )
      {
         for ( var n = 0; n < xs.length; ++n )
            if (p(xs[n])) return xs[n]
         return undefined
      }

      function closest_slide( f )
      {
         return  first_of( ancestors(f), is_slide ) || flat_slides[0]
      }

      function next_view()
      {
         //if ( current_frame.next_view ) {
         //   if ( current_frame.next_view() ) return
         //}
         //else
            if ( next_state() ) return

         if ( contains( flat_slides, current_frame ) ) current_slide = mod(current_slide+1, flat_slides.length)
         else  {
            current_frame = closest_slide( current_frame )
            current_slide = flat_slides.indexOf( current_frame )
         }
         // does not work?: else  current_slide = flat_slides.indexOf( closest_slide( current_frame ) )
      }

      function prev_view()
      {
         if ( prev_state() )  return
         if ( contains( flat_slides, current_frame ) ) current_slide = mod(current_slide-1, flat_slides.length)
         else  {
            current_frame = closest_slide( current_frame )
            current_slide = flat_slides.indexOf( current_frame )
         }
      }
   }

   Item {
      id: foreground_holder
      anchors.fill: parent
   }

}
