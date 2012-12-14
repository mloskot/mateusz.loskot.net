---
comments: true
date: 2009-03-08 00:51:17
layout: post
slug: wkt-raster-crash-course-1
title: 'WKT Raster crash course #1'
wordpressid: 291
categories: life,programming
tags: band,blob,build,cadcorp,compile,Cumming,daly,database,dataset,dbms,Erickson,funds,gcc,gdal,geospatial,image,laval,linux,Loskot,ogc,pierre,pixel,postgis,programming,project,racine,ramsey,raster,Santilli,spatial,strk,sustainability,team,wktraster
---

Recently, a good friend of mine [Sandro](http://foo.keybit.net/~strk/) has started [spreading the story](http://blog.ominiverdi.org/index.php?/archives/69-PostGIS-Rasters.html) of **WKT Raster** project. Here, I'd like to join him and post a bunch of technical notes about how to start using tandem of [PostGIS](http://postgis.refractions.net/) and WKT Raster. This is the first post that hopefully will start a series discussing various aspects of use and development of WKT Raster extension.





### What





From the [overview of WKT Raster](http://postgis.refractions.net/support/wiki/index.php?WKTRasterHomePage) project:




> WKT Raster is an ongoing project aiming at developing raster support in PostGIS. (...) WKT Raster's goal is to implement the RASTER type as much as possible like the GEOMETRY type is implemented in PostGIS and to offer a single set of overlay SQL functions (like ST_Intersects) operating seamlessly on vector and raster coverages.




The idea of WKT Raster extension was [presented](http://www.cef-cfr.ca/uploads/Membres/WKTRasterSpecifications0.8.pdf) ([PDF](http://http://en.wikipedia.org/wiki/Portable_Document_Format) 1.1 MB) in December 2008 by [Pierre Racine](http://www.cef-cfr.ca/index.php?n=Membres.PierreRacine) from [University Laval](http://www.ulaval.ca/). Pierre's presentation made foundation of the [WKT Raster Specification](http://www.cef-cfr.ca/index.php?n=Membres.PierreRacineWKTRasterSpecifications).




    
    Hacker #1: Why WKTRaster? sounds a bit silly :D
    Hacker #2: Apparently the initial thoughts on it were expressed using a textual representation for the rasters and the thinking was that this would be core to the effort, though it has proven not so important. I also find the name unhelpful.





Actually, this is not as trivial problem as it may seem. I am not sure myself that the name is _[WKT](http://en.wikipedia.org/wiki/Well-known_text) [Raster](http://en.wikipedia.org/wiki/Raster_graphics)_ or _WKTRaster_, nor I'm confident if the name is fixed and will be valid in future.




**Update** 2009-03-08 14:05: See [Pierre's comment](/?p=291#comment-2327) below.





### Where





At the moment, WKT Raster project does not have a single home, but different parts of it live in different places:




  * On [PostGIS Wiki](http://postgis.refractions.net/support/wiki/), there is [WKTRaster Home Page](http://postgis.refractions.net/support/wiki/index.php?WKTRasterHomePage), but it's only an overview of the project, not a real home page.


  * [WKT Raster Planning and Funding](http://www.cef-cfr.ca/index.php?n=Membres.PierreRacineWKTRaster) roadmap as well as the [Specification](http://www.cef-cfr.ca/index.php?n=Membres.PierreRacineWKTRasterSpecifications) document are available  in Wiki hosted by [Centre for Forest Research](http://www.cef-cfr.ca).


  * WKT Raster [discussions](http://www.google.com/search?hl=en&q=wktraster+site%3Ahttp%3A%2F%2Fpostgis.refractions.net%2Fpipermail%2Fpostgis-devel) take place through the [postgis-devel](http://postgis.refractions.net/mailman/listinfo/postgis-devel) mailing list as [agreed by the PostGIS Community](http://http://postgis.refractions.net/pipermail/postgis-devel/2009-February/004902.html).


  * Source code lives in Subversion [repository of PostGIS](http://svn.osgeo.org/postgis/), in [spike/wktraster](http://svn.osgeo.org/postgis/spike/wktraster/) module. There hasn't been released any source code package or snapshot. So, everyone interested in testing needs to grab source code directly from SVN (see notes below).







### Who





Currently, there is a small team of people who contribute their time, skills and money to move the project forward. Here is a summary of contributors everyone can collect from the scattered homepage(s) of WKT Raster:







  * [Pierre Racine](http://www.cef-cfr.ca/index.php?n=Membres.PierreRacine) - originator and author of the WKT Raster idea and specification and implementation developer.


  * [Sandro Santilli](http://foo.keybit.net/~strk/projects/WKTRaster/) -  well-known member of the PostGIS core team [who is the architect](http://svn.osgeo.org/postgis/spike/wktraster/doc/) of RASTER type definition, canonical and Well-Known-Binary format of stored raster, developer of input/output operations, and more.







There are also [prime financial contributors](http://www.cef-cfr.ca/index.php?n=Membres.PierreRacineWKTRaster) who established development of the WKT Raster project: [Steve Cumming](http://www.cef-cfr.ca/index.php?n=Membres.StevenGCumming), [Martin Daly](http://blog.lostinspatial.com/) (from [Cadcorp](http://www.cadcorp.com/), where I work as member of core development team) and [Tyler Erickson](http://wiki.mtri.org/display/mtripub/tyler+erickson/).





Recently, [I've also joined the WKT Raster team](http://postgis.refractions.net/pipermail/postgis-devel/2009-February/004902.html) and being led by Martin Daly I'm focused on programming new features and core testing.





### News




Today and during next 3 days, a few people interested in the PostGIS / WKT Raster project are meeting together for the [Toronto Code Sprint 2009](http://wiki.osgeo.org/wiki/Toronto_Code_Sprint_2009). I'm also present there, though in spirit by joining the event on [#tosprint](irc://irc.freenode.net/#tosprint) IRC channel. I have a hope that during this meeting, we will discuss and agree about a couple of outstanding issues:









  * meta data tables: Do we need them? How to define schema of meta data?


  * review of specification of [RT functions](http://www.cef-cfr.ca/index.php?n=Membres.PierreRacineWKTRasterSpecifications)


  * improvements in the solution architecture and design to handle common raster use cases, for both categories, visualizations and analysis


  * how to answer needs of [pyramids](http://download.oracle.com/docs/cd/B28359_01/appdev.111/b28398/geor_intro.htm#CHDDEGJJ)/overviews


  * does the project need an [infrastructure](http://postgis.refractions.net/pipermail/postgis-devel/2009-March/004991.html), a new home?


  * and last but not least, how to achieve [sustainability](http://www.oss-watch.ac.uk/resources/sustainableopensource.xml) and rise more funds.








By the way, isn't it good time to create [WKT Raster article](http://en.wikipedia.org/wiki/WKTRaster) on [Wikipedia](http://en.wikipedia.org)? Writers are welcome!
