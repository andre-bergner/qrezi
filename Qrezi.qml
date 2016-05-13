import QtQuick 2.2

Zoomer {

   // TODO
   // • if slide is already current refocus if zoomed out/in and clicked again


   property variant slides: this.frames
   property int current_slide: 0

   onCurrent_slideChanged: current_frame = slides[current_slide]





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

   function is_slide(s) { return contains(slides,s) }

   function first_of( xs , p )
   {
      for ( var n = 0; n < xs.length; ++n )
         if (p(xs[n])) return xs[n]
      return undefined
   }

   function closest_slide( f )
   {
      return  first_of( ancestors(f), is_slide ) || slides[0]
   }

   function next_view()
   {
      if ( next_state() ) return
      if ( contains( slides, current_frame ) ) current_slide = mod(++current_slide, slides.length)
      else  {
         current_frame = closest_slide( current_frame )
         current_slide = slides.indexOf( current_frame )
      }
      // does not work?: else  current_slide = slides.indexOf( closest_slide( current_frame ) )
   }

   function prev_view()
   {
      if ( prev_state() )  return
      if ( contains( slides, current_frame ) ) current_slide = mod(--current_slide, slides.length)
      else  {
         current_frame = closest_slide( current_frame )
         current_slide = slides.indexOf( current_frame )
      }
   }
}
