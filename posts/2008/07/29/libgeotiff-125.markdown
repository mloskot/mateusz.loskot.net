---
comments: true
date: 2008-07-29 16:18:45
layout: post
slug: libgeotiff-125
title: libgeotiff 1.2.5
wordpressid: 260
categories: none
tags: epsg,frank,gdal,geotiff,libgeotiff,liblas,metacrs,open source,postgis,proj4,qgis,release
---

libgeotiff 1.2.5 has been released.





> Libgeotiff is an open source library normally hosted on top of libtiff for reading, and writing [GeoTIFF](http://www.remotesensing.org/geotiff/geotiff.html) information tags.





As [officially announced](http://lists.maptools.org/pipermail/geotiff/2008-July/000501.html), the new version includes a few bug fixes and improvements, coordinate systems dictionaries have been updated to [EPSG 6.17](http://www.epsg.org/CurrentDB.html) dataset.





There is also a new feature called **Simple Tags Interface** to make it _easier to use libgeotiff to process geotiff tags in other file format_. This new interface is used in [libLAS](http://liblas.org) to support LAS files georeferencing.





Packages of libgeotiff 1.2.5 are hosted on [OSGeo Download](http://download.osgeo.org/) server: 
[http://download.osgeo.org/geotiff/libgeotiff/](http://download.osgeo.org/geotiff/libgeotiff/)





A week ago, Frank Warmerdam [proposed](http://lists.osgeo.org/pipermail/metacrs/2008-July/000111.html) to make GeoTIFF a subproject of [OSGeo MetaCRS](http://metacrs.org/) project, because of a few reasons:




  * libgeotiff is primary about CRS management


  * it is too small project to join [OSGeo](http://osgeo.org) on it's own


  * [EPSG](http://en.wikipedia.org/wiki/European_Petroleum_Survey_Group) handling provided by libgeotiff is foundational number of FOSS4G projects ([GDAL](http://www.gdal.org/), [QGIS](http://www.qgis.org/), [PROJ.4](http://trac.osgeo.org/proj/) and [PostGIS](http://www.postgis.org/), [libLAS](http://liblas.org/))






[Motion: Libgeotiff as a MetaCRS sub-project](http://lists.osgeo.org/pipermail/metacrs/2008-July/000113.html) was not waiting long and eventually [has gained full acceptance](http://lists.osgeo.org/pipermail/metacrs/2008-July/000130.html) from [Project Steering Committee](http://wiki.osgeo.org/wiki/MetaCRS#Project_Steering_Commitee) of MetaCRS, means passed.





Since July 28, 2008 GeoTIFF project is now a part of MetaCRS initiative lead by OSGeo community.
