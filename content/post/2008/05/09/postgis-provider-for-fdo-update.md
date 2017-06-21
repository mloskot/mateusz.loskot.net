---
date: 2008-05-09 12:29:25
slug: postgis-provider-for-fdo-update
title: PostGIS provider for FDO update
categories: open source
---

During last weeks, a lot of fresh bits have been contributed to the [PostGIS](http://postgis.refractions.net/) provider for [FDO](http://fdo.osgeo.org/) Open Source. The great part of this work was committed by Bruno Scott and his colleagues. Bruno has recently [joined the FDO development team](http://lists.osgeo.org/pipermail/fdo-internals/2008-April/002069.html). I'd like to express _my deep gratitude_ to Bruno for his _fantastic help_ in improving the PostGIS provider. The provider has got better shape and stability.





Recently, I've failed my duties in the provider development, so motivated by the load of Bruno's work I found some gaps in time to submit a few fixes too :-)





For all interested in development of the PostGIS provider for FDO, here is detailed list of the recent updates (links point to tickets in [FDO Trac](http://trac.osgeo.org/fdo/) database):





  * [#94](http://trac.osgeo.org/fdo/ticket/94) Generate extent for features assigned to default spatial context


  * [#106](http://trac.osgeo.org/fdo/ticket/106) PostGIS provider cannot delete a feature class


  * [#171](http://trac.osgeo.org/fdo/ticket/171) Fdo Postgis Autogenated identity property is mandatory


  * [#178](http://trac.osgeo.org/fdo/ticket/178) PostGIS : Can't insert in a non-feature class


  * [#232](http://trac.osgeo.org/fdo/ticket/232) Fdo Postgis null and not null filter does not work


  * [#233](http://trac.osgeo.org/fdo/ticket/233) Fdo Postgis in and not in filter does not work


  * [#234](http://trac.osgeo.org/fdo/ticket/234) Fdo Postgis currently does not support anything but lowercase identifiers


  * [#235](http://trac.osgeo.org/fdo/ticket/235) Fdo Postgis Exception with insert


  * [#236](http://trac.osgeo.org/fdo/ticket/236) Fdo Postgis does not support non spatial classes


  * [#241](http://trac.osgeo.org/fdo/ticket/241) Implement Support for SelectAggregates, SpatialExtents and Count


  * [#310](http://trac.osgeo.org/fdo/ticket/310) PostGIS provider : change class naming convention without ~


  * [#311](http://trac.osgeo.org/fdo/ticket/311) PostGIS provider : mismatch between FdoGeometricTypes and FdoGeometryType


  * [#312](http://trac.osgeo.org/fdo/ticket/312) PostGIS provider : remove boost_date_time dll dependency


  * [#313](http://trac.osgeo.org/fdo/ticket/313) PostGIS provider : can't filter,insert or update date/datetime


  * [#314](http://trac.osgeo.org/fdo/ticket/314) PostGIS provider : check-out/check-in crashes Autodesk Map


  * [#324](http://trac.osgeo.org/fdo/ticket/324) PostGIS provider : Insert and update geometry failed when a table has a srid


  * [#328](http://trac.osgeo.org/fdo/ticket/328) PostGIS FdoIInsert::Execute always returns NULL


  * [#329](http://trac.osgeo.org/fdo/ticket/329) PostGIS FdoISQLCommand::GetSQLStatement always returns NULL


  * [#337](http://trac.osgeo.org/fdo/ticket/337) PostGIS defect : insert,update more than one column failed on dates


  * [#338](http://trac.osgeo.org/fdo/ticket/338) PostGIS defect : insert with srid -1 failed


  * [#339](http://trac.osgeo.org/fdo/ticket/339) PostGIS defect : Srid is not set properly when creating a FeatureClass


  * [#341](http://trac.osgeo.org/fdo/ticket/341) PostGIS defect : SelectAggregate does not support DISTINCT








All the fixes listed above will be included in next version [3.4.0](http://trac.osgeo.org/fdo/milestone/3.4.0) of Feature Data Objects.





From another area of the FDO development, check [Jason's](http://www.jasonbirch.com) post about the brand new [SQLite for both FDO](http://www.jasonbirch.com/nodes/2008/05/06/184/sqlite-for-fdo-with-sugar-free-ogr/trackback/) and [OGR](http://www.gdal.org/ogr/)
