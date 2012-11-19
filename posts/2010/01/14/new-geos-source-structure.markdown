---
title: New GEOS source structure
date: 2010-01-14 01:44:20
category: code
layout: post
comments: true
slug: new-geos-source-structure
wordpressid: 1675
categories: open source
tags: geometry,geos,jts,open source,open source,programming,project,spatial,trac
---

Following quick [announce](http://lists.osgeo.org/pipermail/geos-devel/2010-January/004544.html) a few days ago, I [started](http://lists.osgeo.org/pipermail/geos-devel/2010-January/004552.html) shifting [GEOS](http://trac.osgeo.org/geos/) source code directories to flatten the structure a bit and to separate header files (.h) from implementation files (.cpp).


The whole process is documented as [ticket #315](http://trac.osgeo.org/geos/ticket/315) in the GEOS Trac. The transition has been remarkable smooth. The mission [accomplished](http://lists.osgeo.org/pipermail/geos-devel/2010-January/004556.html).


I've managed to build and successfully test GEOS with the following configurations:

* GCC 4.4.1 on Ubuntu 9.10 64-bit with 64-bit build target
* Visual C++ 8.0 on Windows XP Professional 32-bit with build target 32-bit
* Visual C++ 9.0 on Windows Vista 64-bit (target 32-bit)
* [Visual C++ 10.0](http://www.microsoft.com/visualstudio/en-us/products/2010/default.mspx) on Windows 7 Professional 64-bit (target 32-bit) 


All build configuration should work well. Let me know if any doesn't.
