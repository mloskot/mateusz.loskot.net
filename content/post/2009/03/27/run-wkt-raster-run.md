---
date: 2009-03-27 19:39:55
slug: run-wkt-raster-run
title: Run WKT Raster, run!
categories: [ "code" ]
---

I have a **not-so-small** [GeoTIFF](http://trac.osgeo.org/geotiff/) raster dataset. Here is what [GDAL](http://gdal.org/) has to say about it:




    
    $ gdalinfo japan.tif
    Driver: GTiff/GeoTIFF
    Files: japan.tif
    Size is 14000, 14000
    Coordinate System is:
    GEOGCS["WGS 84",
        DATUM["WGS_1984",
            SPHEROID["WGS 84",6378137,298.2572235630016,
                AUTHORITY["EPSG","7030"]],
            AUTHORITY["EPSG","6326"]],
        PRIMEM["Greenwich",0],
        UNIT["degree",0.0174532925199433],
        AUTHORITY["EPSG","4326"]]
    Origin = (137.386330630776030,38.325757833006122)
    Pixel Size = (0.000256020461176,-0.000256020461176)
    Metadata:
      AREA_OR_POINT=Area
      TIFFTAG_DOCUMENTNAME=ER Mapper 6.4
      TIFFTAG_IMAGEDESCRIPTION=ER Mapper GeoTiff raster translator V1.0: Band 1 = Red, Band 2 = Green, Band 3 = Blue
      TIFFTAG_SOFTWARE=ER Mapper 6.4
      TIFFTAG_XRESOLUTION=0
      TIFFTAG_YRESOLUTION=0
    Image Structure Metadata:
      COMPRESSION=LZW
      INTERLEAVE=PIXEL
    Corner Coordinates:
    Upper Left  ( 137.3863306,  38.3257578) (137d23'10.79"E, 38d19'32.73"N)
    Lower Left  ( 137.3863306,  34.7414714) (137d23'10.79"E, 34d44'29.30"N)
    Upper Right ( 140.9706171,  38.3257578) (140d58'14.22"E, 38d19'32.73"N)
    Lower Right ( 140.9706171,  34.7414714) (140d58'14.22"E, 34d44'29.30"N)
    Center      ( 139.1784739,  36.5336146) (139d10'42.51"E, 36d32'1.01"N)
    Band 1 Block=14000x20 Type=Byte, ColorInterp=Red
    Band 2 Block=14000x20 Type=Byte, ColorInterp=Green
    Band 3 Block=14000x20 Type=Byte, ColorInterp=Blue
    





I loaded it to [PostGIS](http://postgis.refractions.net/)/[WKT Raster](http://mateusz.loskot.net/?p=291) table with [regular blocking](http://postgis.refractions.net/pipermail/postgis-devel/2009-March/005209.html) [enabled](http://postgis.refractions.net/pipermail/postgis-devel/2009-March/005091.html) in [PostgreSQL](http://www.postgresql.org/) 8.3 database running on [Ubuntu](http://www.ubuntu.com/) 8.10 (32-bit) installed as a guest system under [VirtualBox](http://www.virtualbox.org/):




    
    $ gdal2wktraster.py -r japan.tif -t japan_rb -o japan_rb.sql -k
    $ psql -d test -f japan_rb.sql
    




The [loader](http://svn.refractions.net/postgis/spike/wktraster/scripts/gdal2wktraster.py) generated output file _japan_rb.sql_ of size of **1.1** GB and it makes **700** records (raster tiles or blocks) in the database. The [disk usage](http://www.postgresql.org/docs/8.3/interactive/disk-usage.html) reported for the raster table is:




    
    sistest=# SELECT relfilenode, relpages FROM pg_class WHERE relname = 'japan_rb';
     relfilenode | relpages 
    -------------+----------
           71700 |        5
    (1 row)
    





I run simple test query:



    
    $ psql -d test
    test=# SET log_statement_stats TO 1;
    SET
    test=# SELECT rid FROM japan_rb WHERE RT_Width(rast) != 14000 OR RT_Height(rast) != 20;
     rid
    -----
    (0 rows)
    





In the PostgreSQL log I got dumped a bunch of interesting [statistics](http://www.postgresql.org/docs/8.3/interactive/runtime-config-statistics.html):



    
    2009-03-27 15:23:38 GMT LOG:  QUERY STATISTICS
    2009-03-27 15:23:38 GMT DETAIL:  ! system usage stats:
     ! 5.084838 elapsed 2.544159 user 2.468154 system sec
     ! [4.960310 user 5.204325 sys total]
     ! 0/0 [16/28160] filesystem blocks in/out
     ! 0/320190 [0/647479] page faults/reclaims, 0 [0] swaps
     ! 0 [0] signals rcvd, 0/0 [0/0] messages rcvd/sent
     ! 0/155 [9/327] voluntary/involuntary context switches
     ! buffer usage stats:
     ! Shared blocks:      74192 read,          0 written, buffer hit rate = 51.71%
     ! Local  blocks:          0 read,          0 written, buffer hit rate = 0.00%
     ! Direct blocks:          0 read,          0 written
    





The [virtual machine](http://en.wikipedia.org/wiki/Virtual_machine) has assigned **1024** MB of RAM and one CPU Intel Xeon **3.2** GHz.





You are **strongly welcome** to share your comments?
