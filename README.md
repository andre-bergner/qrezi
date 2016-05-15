# qrezi

qrezi is a presentation framework written in QML and inspired by [prezi](http://www.prezi.com), thus the name (p → q).

## How to use qrezi

qrezi presentations can be played directly with [qmlscene](http://doc.qt.io/qt-5/qtquick-qmlscene.html),
the QML player coming with the default [Qt5](http://doc.qt.io/qt-5) installation.

To use the qrezi modules they must be made available to qmlscene. This can be done by wither of the following means:

* put it in the [default path for QML modules](http://doc.qt.io/qt-5/qtquick-debugging.html#debugging-module-imports)
* set an environment variable to [custom QML module import path](http://doc.qt.io/qt-5/qtqml-syntax-imports.html#qml-import-path)
* run qmlscene with `-include <local/path/to/modules>`.

