---
date: 2013-02-15T23:35:00Z
title: PostGIS Raster is four years old
description: Short history of PostGIS Raster and delayed fourth birthday celebration
category: code
tags: postgis,database,raster,planetosgeo,planetpostgis
---

(let's go sentimental)

On January 27, 2009, [Sandro Santilli][strk] did the [initial import of wktraster code][r3571] 
into the [spike][spk] branch of the [PostGIS][pg] repository. 

The submission followed shortly after Sandro posted to postgis-devel list 
[call for funding][cff] for the [WKT Raster][wkt] project. The call had been 
successful and Sandro secured [initial fundings][initf] from [Steve Cumming][sgc] 
(Université Laval), [Martin Daly][mpd] (Cadcorp) and [Tyler Erickson][te] 
(Michigan Tech Research Institute). The project started to roll.

Where the whole idea came form? From Sandro's [WKT Raster project][wktp] page: 

> The initial idea and proposal was developed by [Pierre Racine][pr] for the 
> BAM project of the Laval University, and presented to the PostGIS 
> community on July 2008.

Here is the original [PostGIS WKT Raster][init] post sent by Pierre.

On February 17, 2009, I joined the party myself making my first (test) 
commit [r3733][r3733] in the spike and, on behalf of Cadcorp 
(I [joined the company][cc] in December 2008), I had been working with
Sandro and Pierre developing the initial working specification and 
implementing usable prototype(s). In November 2009, [Jorge Arévalo][jr]
joined the raster team at PostGIS with fresh [stream contributions][oh1].

In October 2010, Jorge completed the task [#587][587] and moved WKT Raster
from ```spike/wktraster``` to ```trunk/raster```.
The WKT Raster experiment has been reborn as the PostGIS Raster.

In 2011, the team grew stronger and was joined by new developers interested 
in the raster features: [Bborie Park][cabp] in May and [David Zwarg][cadz] in October.
The project has taken the wings and in April 2012, PostGIS Raster was officially
released for the very first time with [PostGIS 2.0.0][pg2].

Today, I was looking at the backlog of changes in specifications of the WKT Raster 
and the following PostGIS Raster, and I realised that three weeks ago,
the project celebrated its fourth birthday!


[pg]:http://postgis.org
[strk]:http://strk.keybit.net/
[pr]:http://geospatialelucubrations.blogspot.ca/
[r3571]:http://trac.osgeo.org/postgis/browser/spike/wktraster?rev=3571
[spk]:http://trac.osgeo.org/postgis/wiki/DevWikiComitGuidelines
[cff]:http://lists.osgeo.org/pipermail/postgis-devel/2008-December/004235.html
[wkt]:http://trac.osgeo.org/postgis/wiki/WKTRaster
[initf]:http://blog.ominiverdi.org/index.php?/archives/69-PostGIS-Rasters.html
[mpd]:http://blog.lostinspatial.com/
[sgc]:http://www.cef-cfr.ca/index.php?n=Membres.StevenGCumming
[te]:http://wiki.mtri.org/display/mtripub/tyler+erickson
[rfc1]:http://lists.osgeo.org/pipermail/postgis-devel/2009-January/004730.html
[wktp]:http://strk.keybit.net/projects/WKTRaster/
[init]:http://lists.osgeo.org/pipermail/postgis-users/2008-July/020456.html
[r3733]:http://lists.refractions.net/pipermail/postgis-commits/2009-February/001245.html
[jr]:http://libregis.org/
[caja]:http://lists.osgeo.org/pipermail/postgis-devel/2009-November/007315.html
[cabp]:http://lists.osgeo.org/pipermail/postgis-devel/2011-May/012722.html
[cadz]:http://lists.osgeo.org/pipermail/postgis-devel/2011-October/015383.html
[oh1]:http://www.ohloh.net/p/WKTRaster/contributors/summary
[587]:trac.osgeo.org/postgis/ticket/587
[pg2]:http://lists.osgeo.org/pipermail/postgis-devel/2012-April/020079.html
[cc]:/posts/2008/12/11/they-got-me/
