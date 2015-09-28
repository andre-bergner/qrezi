import QtQuick 2.2

MouseArea {

   anchors.fill: parent
   propagateComposedEvents: true

   property var  _canvas_pos:     Qt.point(0,0)
   property var  _mouse_pos:      Qt.point(0,0)
   property bool _started_moving: false


   function item_at( item, p ) {
      var child = item.childAt( p.x, p.y )
      return child == null
             ? item
             : item_at( child, child.mapFromItem( item, p.x, p.y ) )
   }

   onClicked: {
      if ( ! _started_moving ) {
         var p = transformer.mapFromItem( this, mouse.x, mouse.y )
         var child = item_at( transformer, p )
         if ( child != null )  current_frame = child
         _started_moving = false
      }
   }

   onPressed: {
      _started_moving = false
      xAni.enabled = false
      yAni.enabled = false
      _canvas_pos = Qt.point( translator.x, translator.y ) 
      _mouse_pos = Qt.point( mouse.x, mouse.y )
      mouse.accepted = true
   }

   onReleased: {
      xAni.enabled = true
      yAni.enabled = true
   }

   onPositionChanged: {
      _started_moving = true
      var s = Math.sin( -to_rad( rotator.angle ))
      var c = Math.cos( -to_rad( rotator.angle ))
      var dx = mouse.x - _mouse_pos.x
      var dy = mouse.y - _mouse_pos.y
      translator.x = _canvas_pos.x + (c*dx - s*dy) / scaler.scale
      translator.y = _canvas_pos.y + (s*dx + c*dy) / scaler.scale
   }

   onWheel: {
      scaleAni.enabled = false
      if (wheel.angleDelta.y < 0) scaler.scale /= 1. - 0.001 * wheel.angleDelta.y
      else                        scaler.scale *= 1. + 0.001 * wheel.angleDelta.y
      scaleAni.enabled = true
   }

}
