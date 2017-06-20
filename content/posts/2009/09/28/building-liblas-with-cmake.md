---
date: 2009-09-28 00:33:20
slug: building-liblas-with-cmake
title: Building libLAS with CMake
categories: open source,programming
---

[![libLAS - ASPRS LiDAR data translation toolset](http://liblas.org/chrome/site/liblaslogo.png)](http://liblas.org/) I almost finished crafting [CMake](http://cmake.org) configuration for [libLAS](http://liblas.org/). It is available from the repository in the [main](http://hg.liblas.org/main/) branch. It is possible to build libLAS library and command line utilities configured with most of supported dependencies: [GDAL](http://gdal.org), [GeoTIFF](http://trac.osgeo.org/geotiff/) and [SpatialIndex](http://trac.gispython.org/spatialindex). Configuration of Oracle and Boost dependencies is not ready yet. It is also possible to install libLAS run-time and compile-time components. Cool!





Detailed story with extensive example of how to use CMake to build libLAS is available [here in Trac](http://liblas.org/ticket/52). I have successfully tested it on Linux (Ubuntu 9.04). I'm going to test & update it on Windows with Visual Studio - generally it (compilation) works but dependencies selection and installation commands haven't been tested.





I'm very pleased I can officially [announce](http://lists.osgeo.org/pipermail/liblas-devel/2009-September/000618.html) CMake configuration availability. I truly hope to make my life and users life easier - maintenance of Visual Studio projects is just ridiculously tedious and time consuming.





Preparing CMake configuration was a very useful experience and I'm going to use it to improve other projects this way (like [SOCI](http://soci.sourceforge.net/), [Generic Geometry Library](http://trac.osgeo.org/ggl)). I would be happy to see interest in preparing CMake configuration for [GDAL/OGR](http://gdal.org) too...any brave hearts out there?





Why CMake? Because [CMake](http://cmake.org) is the best [build system](http://en.wikipedia.org/wiki/Build_automation) ever delivered to [Open Source community](http://osgeo.org/). Full stop.





Projects of all types, ages and sizes evaluated CMake, came to the same conclusion and eventually migrated to use CMake. To give examples of large or established projects, here we go:






  * [Boost C++ Libraries](http://www.boost.org/) used to be firmly wedded to bjam (still main builder), they have learned about [CMake features](https://svn.boost.org/trac/boost/wiki/CMakeBoostFeatures) and currently [<del>migration to CMake</del>](https://svn.boost.org/trac/boost/wiki/CMake) development of CMake-based configuration is well in progress and their community is being [taught about CMake](http://lists.boost.org/boost-cmake/2009/01/0360.php).


  * [KDE](http://kde.org/) [switched to CMake](http://lwn.net/Articles/187923/) in the middle of 2006


  * [Quantum GIS](http://qgis.org/) thanks to [Martin Dobias](http://blog.qgis.org/blog/7) started [migrating to CMake](http://blog.qgis.org/node/16) shortly after KDE.






By the way, I've started collecting custom reusable CMake modules - available from my [workshop repository](http://github.com/mloskot/workshop/tree/master/cmake/). They can be used to complete, large collection anyway, of [standard CMake modules](http://www.cmake.org/cmake/help/cmake2.6docs.html#section_Standard%20CMake%20Modules).
