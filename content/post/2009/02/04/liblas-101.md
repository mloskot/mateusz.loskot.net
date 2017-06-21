---
date: 2009-02-04 22:30:25
slug: liblas-101
title: libLAS 1.0.1
categories: none
---

Today, [Howard](http://hobu.biz/) has [announced](http://lists.osgeo.org/pipermail/liblas-devel/2009-February/000409.html) new release of [libLAS](http://liblas.org/) [1.0.1](http://liblas.org/wiki/1.0.1). The new version mostly brings update in Python bindings. Here is detailed [report](http://liblas.org/query?status=closed&group=resolution&milestone=1.0.1) of all fixes in this milestone.





Selection of most important improvements include:






  * [#82](http://liblas.org/ticket/82): Python bindings missing get/set intensity


  * [#83](http://liblas.org/ticket/83): Support fractional seconds in the Python bindings


  * [#84](http://liblas.org/ticket/84): Improve LASPoint::equal


  * [#89](http://liblas.org/ticket/89): Python liblas.version did not work


  * [#88](http://liblas.org/ticket/88): liblas-config script to provide library/include locations to software wishing to link to libLAS


  * [#86](http://liblas.org/ticket/86): las2txt M option allowing the index number of the point to be included in the output





Traditionally, soruce code packages of [libLAS](http://en.wikipedia.org/wiki/LibLAS) are available - visit homepage of [1.0.1](http://liblas.org/wiki/1.0.1) release.





> libLAS is a generic GNU autoconf/autotools project, however, and building libLAS is as simple as ./configure;make;make install.





Windows users can install libLAS from the [OSGeo4W](http://trac.osgeo.org/osgeo4w/) packages repository. This release contains the Python bindings, command-line utilities (including [las2ogr](http://liblas.org/browser/trunk/doc/las2ogr.txt)) and development packages.
