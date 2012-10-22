---
comments: true
date: 2007-11-28 07:27:03
layout: post
slug: gdalogr-144-released
title: GDAL/OGR 1.4.4 Released
wordpressid: 229
categories: open source
tags: osgeo gdal ogr library vector raster imagery formats tr
---

Today [hot news](http://lists.osgeo.org/pipermail/gdal-dev/2007-November/015054.html) from GDAL mailing list:  



> 
The GDAL project is pleased to announce the GDAL/OGR 1.4.4 release.
This is a bug fix release in the 1.4.x stable release series and
adds no significant new features.

This release replaces the GDAL/OGR 1.4.3 release which has been retracted
by the project as it included an unexpected ABI (Application Binary
Interface) change from the earlier 1.4.x releases.  This ABI change means
that applications using the GDAL/OGR C++ interface, and GDAL/OGR driver
plugins built against GDAL/OGR 1.4.0, 1.4.1 or 1.4.2 could not be safely
used with GDAL/OGR 1.4.3.  All applications redistributing binaries are
encouraged to discard GDAL/OGR 1.4.3 and use 1.4.4 instead.  The GDAL/OGR
1.4.4 release is ABI compatiable with all earlier 1.4.x releases except
for the disavowed 1.4.3.

GDAL/OGR 1.4.4 is available in source format at:

  http://download.osgeo.org/gdal/gdal-1.4.4.tar.gz
  http://download.osgeo.org/gdal/gdal144.zip

More detailed NEWS on fixes in the 1.4.4 release can be found at:

  http://trac.osgeo.org/gdal/wiki/Release/1.4.4-News

GDAL 1.5.0, a major "new features" release, will be entering beta during
December, and it is hoped a GDAL 1.5.0 release will be available by the end
of year.



