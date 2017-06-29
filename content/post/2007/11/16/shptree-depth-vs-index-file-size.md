---
date: 2007-11-16 21:38:13
slug: shptree-depth-vs-index-file-size
title: SHPTree depth vs index file size
categories: [ "code" ]
---

This is a simple test I run to check how tree based spatial index for [Shapefile](http://en.wikipedia.org/wiki/Shapefile) influences size of index file ([.qix](http://mapserver.gis.umn.edu/cgi-bin/wiki.pl?ShpTree)). I used [OGR](http://en.wikipedia.org/wiki/GDAL) and spatial index implementation available in [Shapelib](http://shapelib.maptools.org/), in file [shptree.c](http://trac.osgeo.org/gdal/browser/trunk/gdal/ogr/ogrsf_frmts/shape/shptree.c).





Tested Shapefile has following characteristics: 

    
    $ ogrinfo -so test.shp test
    Layer name: test
    Geometry: 3D Point
    Feature Count: 932870
    Extent: (440001.000000, 5652001.000000) - (441999.000000, 5653999.000000)
    Layer SRS WKT:
    (unknown)
    


Also, file size of test.dbf is 15M, test.shp is 33M and test.shx is 7.2M.






Next, I run a sequence of commands generating [spatial index](http://en.wikipedia.org/wiki/Spatial_index) [tree](http://en.wikipedia.org/wiki/Tree_data_structure), using higher depth on each turn, from **2** to **16**. This is the first iteration for depth of 2 levels:

    
    
    $ ogrinfo -sql "CREATE SPATIAL INDEX ON test DEPTH 2" test.shp
    SHAPE: Creating index file test.qix
    








I collected size of index files (.qix) and collated with corresponding depth value. Here is the result:
[![Shapefile index tree depth vs index file size](http://farm3.static.flickr.com/2250/2037874907_14c90b8da5_o.png)](http://www.flickr.com/photos/mloskot/2037874907/)






Using DEPTH of **16**, produced index file is of size **213 MB**, six time bigger than _test.shp (33MB)_ file with geometries. Using that huge index files for shapefile will likely make the index exploitation inefficient due to memory use and heavy hard disk I/O operations. I'd use index depth of 8 or 10 for this shapefile.





In fact, due to some [problems with memory allocation](http://trac.osgeo.org/gdal/ticket/1594) while generating huge indexes, default depth value estimated by SHPTree implementation has been limited to 12 levels. Certainly, users still have the liberty to explicitly request depth higher than 12 levels, for example:

    
    
    $ ogrinfo -sql "CREATE SPATIAL INDEX ON test DEPTH 100" test.shp
    








Certainly, it's always a good idea to make a few simple tests and observe performance of querying shapefile features using indexes of different depth.
