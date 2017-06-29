---
date: 2012-02-15
title: PostGIS Raster regular blocking explained
description: Notes on PostGIS Raster specification of regular blocking

---

I have been involved in PostGIS Raster development for almost four years now,
but my project punch card confirms irregular activity.


## Regular blocking concept



## Regular blocking - take 1

## Regular blocking - take 2

Frank: 
I would like to encourage treating cases 1 and 2 as the same thing.
It was never my intention that the regular blocking would require a
complete set of tiles.   Missing tiles would just be treated as the
nodata value, or zero if there is no nodata value.


it would be foolish not to address it in some fashion.  

http://lists.osgeo.org/pipermail/postgis-devel/2007-July/002652.html
> Blocking storage techniques, pyramid structures and data compression
> are the three key approach to improve the performance of PostGIS
> PGRaster in data processing and visualization

The padding is a technique that was introduced to fulfil requirement of regular
grid without gaps, teeth or any kind of irregularities.

At the moment, there is no way to determine, if padding is present
and if it is, how much padding is present.

"The right most column, and bottom row of blocks may have portions that extend beyond the raster extent"

[Real extent feature lost after metadata as views][2122]

[2122ml1]:http://lists.osgeo.org/pipermail/postgis-devel/2012-November/022915.html
[2122ml2]:http://lists.osgeo.org/pipermail/postgis-devel/2012-December/023111.html
[2122ml3]:http://lists.osgeo.org/pipermail/postgis-devel/2012-December/023135.html
[2122]:http://trac.osgeo.org/postgis/ticket/2122
[specw1ml1]:http://lists.osgeo.org/pipermail/postgis-devel/2009-March/005091.html
[specw1]http://trac.osgeo.org/postgis/wiki/WKTRaster/SpecificationWorking01
[specf1]:http://trac.osgeo.org/postgis/wiki/WKTRaster/SpecificationFinal01
[specf1ml1]:http://lists.osgeo.org/pipermail/postgis-devel/2009-May/005605.html
[pierre]:http://geospatialelucubrations.blogspot.ca/
