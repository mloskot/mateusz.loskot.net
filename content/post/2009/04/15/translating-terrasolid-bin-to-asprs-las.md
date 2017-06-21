---
date: 2009-04-15 23:20:31
slug: translating-terrasolid-bin-to-asprs-las
title: Translating TerraSolid .bin to ASPRS LAS
categories: none
---

New [LiDAR](http://en.wikipedia.org/wiki/LiDAR) data translator has been added to the collection of [libLAS](http://liblas.org/) [utilities](http://liblas.org/browser/trunk/apps/) ([docs](http://liblas.org/browser/trunk/doc)). Two days ago, [Howard](http://hobu.biz/) submitted first version of [ts2las](http://liblas.orgy/browser/trunk/apps/ts2las.cpp) program which can be used to convert `.bin` files produced with [TerraScan](https://lidarbb.cr.usgs.gov/index.php?showforum=30) software from [TerraSolid](http://www.terrasolid.fi/) to `.las` file in [ASPRS](http://www.asprs.org/) [LAS](http://www.asprs.org/society/committees/lidar/lidar_format.html) 1.2 format:




    
    ts2las -i input.bin -o output.las





The nice thing is that users <del>will be</del> are able to translate files in TerraSolid `.bin` format without loading [MicroStation](http://en.wikipedia.org/wiki/MicroStation) software.





The ts2las is expected to be included in libLAS 1.3 release. In the meantime, [testers are strongly welcome](http://lists.osgeo.org/pipermail/liblas-devel/2009-April/000457.html) and all feedback is greatly appreciated.
