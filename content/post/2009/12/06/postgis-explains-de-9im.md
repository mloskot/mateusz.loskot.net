---
date: 2009-12-06 03:08:21
slug: postgis-explains-de-9im
title: PostGIS explains DE-9IM
categories: open source
  Neufeld,manual,matrix,ogc,postgis,postgresql,programming,project,Regina Obe,spatial
---

![PostGIS spatial database extension for PostgreSQL](/images/logos/postgis-globe-logo.gif)I am happy I belong to the hordes of [PostGIS](http://postgis.org/) users. Recently I [asked for a very small addition](http://trac.osgeo.org/postgis/ticket/274) to the PostGIS [manual](http://postgis.org/documentation/manual-svn/) that will explain the three basic terms of the [geospatial geometry](http://www.opengeospatial.org/standards/sfs/): _interior_, _boundary_ and _exterior_.





Kevin Neufeld delivered a very well written chapter about [Dimensionally Extended 9 Intersection Model (DE-9IM)](http://postgis.org/documentation/manual-svn/ch04.html#DE-9IM) with series of excellent visualisations of the non-trivial mathematics.





[![PostGIS - Dimensionally Extended 9 Intersection Model (DE-9IM)](http://farm3.static.flickr.com/2568/4161103255_42353a284f_o.png)](http://www.flickr.com/photos/mloskot/4161103255/)





Moreover, Kevin started completing the PostGIS [Functions Reference](http://postgis.org/documentation/manual-svn/reference.html) with visual presentation of geometric problems together with SQL commands using various PostGIS functions that can be applied to solve particular situations. For example, what does the [ST_Buffer](http://postgis.org/documentation/manual-svn/ST_Buffer.html ) function, how boolean predicates like [ST_Contains](http://postgis.org/documentation/manual-svn/ST_Contains.html) check spatial relation of two geometries or what's the difference between [ST_Difference](http://postgis.org/documentation/manual-svn/ST_Difference.html) and [ST_SymDifference](http://postgis.org/documentation/manual-svn/ST_SymDifference.html).





Clearly, I've got _way way more_ than I asked for or I expected. On behalf of myself and users who are about to start their adventure with PostGIS, I'd like to give big kudos to Kevin for this fantastic work!





Together with the recently documented [PostgreSQL PostGIS Types](http://www.postgis.org/documentation/manual-svn/reference.html#PostGIS_Types) and [Function Support Matrix](/?p=1588), [PostGIS team](http://en.wikipedia.org/wiki/PostGIS) is making abrupt manual a pleasant reading book.





By the way, here is a bunch of references about DE-9IM I found very useful myself:




  * [Dimensionally Extended Nine-Intersection Model (DE-9IM)](http://gis.hsr.ch/wiki/images/3/3d/9dem_springer.pdf) by Christian Strobl


  * [Encyclopedia of GIS](http://www.springer.com/book/978-0-387-30858-6) by Hui Xiong, page 242


