---
comments: true
date: 2011-10-22 23:41:46
layout: post
slug: update-on-sqlgeometry-and-point-empty-in-wkb
title: Update on SqlGeometry and POINT EMPTY in WKB
wordpressid: 2221
categories: open source,programming
tags: database,dbms,geometry,geospatial,microsoft,ogc,open source,postgis,programming,project,spatial,sql
  server,wkb
---

Long time ago I discussed about how [SqlGeometry handles POINT EMPTY in ](http://mateusz.loskot.net/?p=1914)[WKB](http://en.wikipedia.org/wiki/Well-known_text) format. The [SqlGeometry](http://msdn.microsoft.com/en-us/library/microsoft.sqlserver.types.sqlgeometry%28SQL.105%29.aspx) states the definition of OGC `GEOMETRY` type for Microsoft SQL Server. Shortly, the message was that SqlGeometry implicitly casts `POINT EMPTY` to `MULTIPOINT EMPTY` geometry when generating WKB output. [PostGIS](http://www.postgis.org) casts as well, but does it in a consistent way, in my opinion, outputting `GEOMETRYCOLLECTION`.





Following those findings, I assumed it is not quite correct, or I didn't like the inconsistency, and I had reported it to [Microsoft Connect](http://connect.microsoft.com/) as a bug: [SqlGeometry reports invalid type of WKB of POINT EMPTY](http://connect.microsoft.com/SQLServer/feedback/details/537018/sqlgeometry-reports-invalid-type-of-wkb-of-point-empty).





Recently, I have received a couple of comments from Microsoft to my report. The comments are attached to the report linked above, but I paste them below for completeness and archive:





> Our development team for the spatial data types tells me that it is not possible to use a single value for the WKB format of any spatial data type. For the POINT EMPTY, the WKB format does not allow empty points, so we are outputting a MULTIPOINT with zero elements.
In a MULTIPOINT EMPTY, we are stripping out empty points.





The reasoning is technically correct. It's just Microsoft _does it differently_. However, as second comment suggests, the current behaviour may change in future:





> But we might consider changing it to get consistent behavior.
