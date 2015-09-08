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

   function first_of( x , p )
   {
      for ( var n = 0; n < x.length; ++n )
         if (p(x[n])) return x[n]
      return undefined
   }

   function ancestors(p)
   {
      var ps = []
      while ( p.parent )
      {
         p = p.parent
         ps.push(p)
      }
      return ps
   }
   /*
   function nex_slide_above( p )
   {
      return  p == null
              ? slides[0]
              : contains(slides,p)
                ? p
                : next_slide_above( p.parent )
   }*/

   function closest_slide( f )
   {
      return  first_of( ancestors(f), is_slide ) || slides[0]
   }

   function next_view()
   {
      if ( next_state() ) return

      var n = slides.indexOf( current_frame )
      if ( n != -1 )
      {
         if ( n+1 < slides.length ) current_frame = slides[n+1]
         else                       current_frame = slides[0]
      }
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
