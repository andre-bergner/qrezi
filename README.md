# qrezi

qrezi is a presentation framework written in QML and inspired by [prezi](http://www.prezi.com), thus the name (p → q).


## Make a qrezi

A qrezi presentation is written directly in QML in a declarative style. Here is a basic example:

```qml
import QtQuick 2.2
import Qrezi 0.1

Qrezi {
   Column {
      Slide {
         Heading { text: "Hello Qrezi"}
         Paragraph { text: "You can navigate using the left & right arrow key or space." }
      }
      Slide {
         id: content
         Heading { text: "Hello World"}
         Paragraph { text: "Easily add code:"}
         Code { text: "int main() { lorem_ipsum(); }" }
      }
      Slide {
         Heading { text: "Conclusions"}
         Paragraph { text: "This is just aweseome !!!11"}
         Paragraph { text: "It's really great."}
      }
   }
}
```



## Running qrezi

qrezi presentations can be played directly with [qmlscene](http://doc.qt.io/qt-5/qtquick-qmlscene.html),
the QML player coming with the default [Qt5](http://doc.qt.io/qt-5) installation.

To use the qrezi modules they must be made available to qmlscene. This can be done by wither of the following means:

* put it in the [default path for QML modules](http://doc.qt.io/qt-5/qtquick-debugging.html#debugging-module-imports)
* set an environment variable to [custom QML module import path](http://doc.qt.io/qt-5/qtqml-syntax-imports.html#qml-import-path)
* run qmlscene with `-include <local/path/to/modules>`.

