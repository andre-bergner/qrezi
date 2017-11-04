import  QtQuick 2.0
import "../"

Item {

   id: slide

   readonly property variant qrezi_config: _search_qrezi_config()

   width:   qrezi_config ? qrezi_config.slide_width : 800
   height:  qrezi_config ? qrezi_config.slide_height : 450


   function _find_qrezi()
   {
      for (var item = parent; item; item = item.parent)
         if (item.objectName == "qrezi")
            return item
      return null;
   }

   function _search_qrezi_config() {
      var qrezi = _find_qrezi();
      if (qrezi)
         return qrezi.config;
      console.log("This frame not part of a qrezi.")
      return null;
   }
}
