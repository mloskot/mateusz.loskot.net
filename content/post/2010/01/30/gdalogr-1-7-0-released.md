---
title: GDAL/OGR 1.7.0 Released
date: 2010-01-30 20:28:45

slug: gdalogr-1-7-0-released
categories: [ "code" ]
---

[![GDAL logo](/images/logos/gdal-logo.png)](http://www.gdal.org)[Frank](http://fwarmerdam.blogspot.com/) has just posted [announcement](http://lists.osgeo.org/pipermail/gdal-announce/2010-January/000035.html) about freshly released [GDAL/OGR 1.7.0](http://trac.osgeo.org/gdal/wiki/Release/1.7.0-News):


> This is the first major new release since the 1.6.0 release approximately one year ago


This new version brings quite a nice collection of new drivers for raster and vector data formats:

* New Raster Drivers: BAG, EPSILON, Northwood/VerticalMapper, R, Rasterlite, SAGA GIS Binary, SRP (USRP/ASRP), EarthWatch .TIL, [WKT Raster](http://trac.osgeo.org/postgis/wiki/WKTRaster)
* GDAL PCIDSK driver using the new PCIDSK SDK by default
* New Vector drivers : DXF, GeoRSS, GTM, PCIDSK and VFK
* New utilities: gdaldem, gdalbuildvrt now compiled by default
* Add support for Python 3.X. Compatibility with Python 2.X preserved
* Remove old-generation Python bindings
* Significantly improved raster drivers: GeoRaster, GeoTIFF, HFA, JPEG2000 JasPer, JPEG2000 Kakadu, NITF
* Significantly improved vector drivers: CSV, KML, SQLite/SpataiLite, VRT
