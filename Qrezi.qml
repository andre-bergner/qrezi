import QtQuick 2.2

Zoomer {

   // TODO
   // • if slide is already current refocus if zoomed out/in and clicked again


   property variant slides: this.frames
   current_frame: slides[0]

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
         case Qt.Key_Left: {
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

   function advance_slide()
   {
      var n = slides.indexOf( current_frame )
      if ( n+1 < slides.length ) current_frame = slides[n+1]
      else                       current_frame = slides[0]
   }

   function next_view()
   {
      if ( next_state() ) return
      if ( contains( slides, current_frame ) ) advance_slide()
      else  current_frame = closest_slide( current_frame )
   }

   function prev_view()
   {
      if ( prev_state() )  return

      var n = slides.indexOf( current_frame )
      if ( n != -1 )
      {
         if ( n > 0 ) current_frame = slides[n-1]
         else         current_frame = slides[slides.length-1]
      }
      else  current_frame = closest_slide( current_frame )
   }
}
