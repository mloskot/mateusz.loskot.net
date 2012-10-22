---
comments: true
date: 2006-03-25 16:56:41
layout: post
slug: building-qgis-with-visual-c-2005
title: Building QGIS with Visual C++ 2005
wordpressid: 111
categories: programming
tags: c++,microsoft,open source,programming,project,qgis,visual c++,visual studio,windows
---


![Quantum GIS Logo](/images/logos/qgis-logo.png)A few days ago, I published my second HOWTO dedicated to [Quantum GIS](http://www.qgis.org) developers using [Visual C++](http://msdn.microsoft.com/visualc/) under Windows. The whole [series](http://mateusz.loskot.net/2006/03/19/building-qt-4-with-visual-c-2005/) is devoted to using Visual C++ 2005 compiler to build [QT](http://www.trolltech.com/products/qt/index.html) library and to start QGIS development on Widows.






Similarly to the first one, the second tutorial has been also published on the [QGIS Wiki](http://wiki.qgis.org), titled as [Building Quantum GIS with Visual C++ 2005](http://wiki.qgis.org/qgiswiki/Building_Quantum_GIS_with_Visual_C%2B%2B_2005).







The process is more complex than building QT library but it's doable. I tried to do my best to give good explanation of every detail and requirement. There is also provided complete Visual C++ 2005 solution with subprojects. So, you can just open if with Visual C++ 2005 and start QGIS development. Almost. The only thing that requires manual work is preparation of the environment: directories structure for compilation output, installation of dependencies like [GDAL](http://www.gdal.org), [GEOS](http://geos.refractions.net) and [SQLite 3](http://www.sqlite.org) libraries. (Here you can find some helpful [resources for GEOS](http://mateusz.loskot.net/projects/geos/) related to building with Visual C++ 2005). You can install GDAL and sqlite from [FWTools](http://fwtools.maptools.org) package (big thanks to Frank Warmerdam). But remember, you will need to build GEOS yourself, because the binary that comes with FWTools provides C API but QGIS uses C++ API of GEOS. Don't worry, it's quite simple, just [5 steps](http://mateusz.loskot.net/projects/geos/).






If you will have any comments, questions or problems, don't hesitate to [contact me](http://mateusz.loskot.net/contact/). You can catch me also on the QGIS IRC channel - [#qgis](http://logs.qgis.org/slogs/). This channel is available on the [irc.freenode.net](http://freenode.net) server. My IRC nick is **mloskot**.

