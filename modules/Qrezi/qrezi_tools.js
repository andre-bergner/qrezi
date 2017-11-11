
function get_qrezi(item)
{
   if (!item) item = parent
   for (var item = parent; item; item = item.parent)
      if (item.objectName == "qrezi")
         return item
   return null;
}

function qrezi_style(item) {
   var qrezi = get_qrezi();
   if (qrezi)
      return qrezi.config;

   console.log("This frame not part of a qrezi.")

   var component = Qt.createComponent("Config.qml");
   var config = component.createObject(item);
   return config;
}
