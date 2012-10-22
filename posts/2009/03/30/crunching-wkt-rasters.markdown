---
comments: true
date: 2009-03-30 22:55:37
layout: post
slug: crunching-wkt-rasters
title: WKT Raster Cruncher
wordpressid: 362
categories: programming
tags: benchmark,block,database,dbms,gdal.raster,gdal2wktraster,geospatial,japan,ogc,postgis,programming,project,raster,spatial,sql,tile,timing,wkt
  raster,wktraster
---

I've been playing with some [nice amount of pixels](/?p=317) using [WKT Raster](/?p=291) engine recently. Today, I tiled the `japan.tif` ([gdalinfo](http://gdal.org/gdalinfo.html) output is [here](/?p=317)) using 3 different sizes of tile block. All the work was done using [gdal2wktraster.py](http://svn.osgeo.org/postgis/spike/wktraster/scripts/gdal2wktraster.py) loader available from WKT Raster [repository](http://svn.osgeo.org/postgis/spike/wktraster/). Below, I included more interesting numbers which may be helpful for others who will decide to juggle [rasters in PostGIS](http://postgis.refractions.net/support/wiki/index.php?WKTRasterHomePage) [database](http://www.postgresql.org/).





Tiling schemes applied on `japan.tif` file:







  1. Using [natural block size](http://gdal.org/classGDALRasterBand.html) reported by [GDAL](http://gdal.org/) gives 700 tiles, 14000 x 20 pixels each:

    
    gdal2wktraster.py -r japan.tif -t japan -o japan.sql -k



  2. Using block size 100 x 100 pixels gives 140 x 140 = 19600 tiles:

    
    gdal2wktraster.py -r japan.tif -t japan_100 -o japan_100.sql -k -m 100x100



  3. Using block size 200 x 200 pixels gives 70 x 70 = 4900 tiles:

    
    gdal2wktraster.py -r japan.tif -t japan_100 -o japan_200.sql -k -m 200x200






Sizes of all `.sql` text files produced are close to 1.2 GB. The timing for gdal2wktarster falls to around 40 minutes on [Ubuntu 8.10](http://releases.ubuntu.com/8.10/) (i386) running under [VirtualBox](http://www.virtualbox.org/) 2.with assigned single CPU core of [Intel Xeon](http://en.wikipedia.org/wiki/Xeon) 3.2 GHz and 1024 MB RAM (host [machine](http://www.spec.org/cpu2006/results/res2008q4/cpu2006-20081204-06156.html): 4 x Intel Xeon 3.2 GHz with 16 GB RAM). [psql](http://www.postgresql.org/docs/8.3/static/app-psql.html) loads single table in about 6 minutes:



    
    psql -d japan -f japan_100.sql





Interestingly, memory usage during processing WKT Raster by gdal2wktraster.py (Python run-time) seems not high <strike>(10-20%)</strike> and was on constant level of ~85 MB. However, 100% of CPU power was being eaten. It's got me interested in comparing these results [vector](http://www.opengeospatial.org/standards/sfs)-brother of gdal2wktraster, to the [shp2pgsql](http://postgis.refractions.net/docs/ch04.html) from [PostGIS](http://postgis.refractions.net).
