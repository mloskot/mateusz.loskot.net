---
comments: true
date: 2008-06-04 05:36:27
layout: post
slug: gooshorg
title: goosh.org
wordpressid: 252
categories: none
tags: gdal,google,goosh,ogrinfo,shell,web
---

[goosh.org](http://goosh.org/) is a new Web-based tool that has been [warming](http://community.zdnet.co.uk/blog/0,1000000567,10008352o-2000331758b,00.htm) [up](http://tech.slashdot.org/article.pl?sid=08/06/02/222234) the wires for last hours. The idea is really cool, though it does not work in text lynx-like browsers, as one would expect.




Hmm, looks like the next (and obvious) step is to implement GDAL utilities plugin for goosh, so everyone can run:



    
    
    guest@goosh.org:/gdal/> ogrinfo -ro PG:'host=gdal.org user=root dbname=cool'
    
    Layer name: streets
       Geometry: Line String
       Feature Count: 13
       Extent: (-87.634943, 24.543945) - (-80.031369, 31.000975)
       Layer SRS WKT:
       GEOGCS["GCS_WGS_1984",
          DATUM["WGS_1984",
          SPHEROID["WGS_1984",6378137.0,298.257223563]],
          PRIMEM["Greenwich",0.0],
          UNIT["Degree",0.0174532925199433]]
    ...
    guest@goosh.org:/gdal/>
    





What about <del>hackers</del>/[crackers](http://www.reddit.com/info/6lpt9/comments/)? Don't worry! This time, lucky works for Google:


> I tried "rm -rf /", but Google is still up.


;-)






**Update:** _Stupid me!_ I really should not use the term [hacker](http://www.catb.org/jargon/html/H/hacker.html) inappropriately above.
