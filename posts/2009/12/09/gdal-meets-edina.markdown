---
comments: true
date: 2009-12-09 13:27:45
layout: post
slug: gdal-meets-edina
title: GDAL meets EDINA
wordpressid: 1633
categories: open source,programming
tags: crash,gdal,Martin Daly,ogr,open source,programming,project,thread safe,threading
---

[Martin Daly](http://blog.lostinspatial.com) has started posting on [A Higher Education](http://blog.lostinspatial.com/2009/12/09/a-higher-education-part-2/) with details about use case of [GDAL](http://www.gdal.org/) to serve large datasets through Web:





> We use GDAL to read the files, and were opening them via [GDALOpenShared](http://www.gdal.org/gdal_8h.html), so that GDAL only opened the file once and used reference counting to manage the lifetime of the [GDALDataset](http://www.gdal.org/classGDALDataset.html) object. Unfortunately (for us) [GDAL is not thread safe](http://trac.osgeo.org/gdal/wiki/FAQMiscellaneous#IstheGDALlibrarythread-safe). This isn't a criticism, the fault is entirely ours for using it in this way.





Criticism or not, the reality is that we (software developers) have already jumped to an era of parallelism (count number of physical or logical CPUs in your computer) where thread-safety becomes a minimum requirement as basic as avoiding buffer overruns.
