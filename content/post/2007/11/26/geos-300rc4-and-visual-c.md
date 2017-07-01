---
date: 2007-11-26 07:45:49
slug: geos-300rc4-and-visual-c
title: GEOS 3.0.0rc4 and Visual C++
categories: [ "code" ]
---

A few days ago, one of GEOS users reported that he is not able to build [GEOS 3.0.0rc4](http://geos.refractions.net/) using Visual C++ compiler. The problem was caused by broken NMAKE makefile included in this package.




Here is package with two files included: _makefile.vc_ and _dirlist.mk_: [geos-3.0.0.rc4-makefile-fix.zip](/download/projects/geos/geos-3.0.0.rc4-makefile-fix.zip ). In order to fix the problem, download this Zip, unpack and copy the two files to the _source_ subdirectory of unpacked GEOS sources tree, overwriting existing _makefile.vc_. Now, make complete rebuild using Visual C++:



    cd source
    nmake /f makefile.vc clean
    nmake /f makefile.vc




For Visual C++ 2005 (8.0), you it's a good idea to call nmake as follows:




    nmake /f makefile.vc MSVC_VER=1400









If you'll encounter any GEOS issues, please report them to the brand new GEOS bug tracker: [http://trac.osgeo.org/geos/](http://trac.osgeo.org/geos/).
