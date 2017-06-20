---
date: 2006-02-21 23:44:34
slug: gdalogr-for-windows-ce
title: GDAL/OGR for Windows CE
categories: none
---

![GDAL Icon](http://www.gdal.org/gdalicon.png)After 22 weeks ;-) of the [initial post](http://thread.gmane.org/gmane.comp.gis.gdal.devel/5025) I'm [very glad to announce](http://thread.gmane.org/gmane.comp.gis.gdal.devel/6616) the first release of [GDAL/OGR](http://www.gdal.org) port for [Windows CE](http://en.wikipedia.org/wiki/Windows_CE).
Two days ago I commited all files and changes to the official GDAL [CVS repository](http://www.gdal.org/download.html).







Here is a list of features and my comments to the current state of work. GDAL/OGR for Windows CE features:



	
  * base [OGR API](http://www.gdal.org/ogr/ogr_apitut.html) and modules

	
  * subset of OGR drivers: generic, [mitab](http://www.gdal.org/ogr/drv_mitab.html), [shape](http://www.gdal.org/ogr/drv_shapefile.html)

	
  * wcelibcex - extension to C library on Windows CE (It was created by me and my colleagues in Taxus SI Ltd. and it will be hosted on the [SourceForge.net](http://sourceforge.net), under [MIT License](http://opensource.org/licenses/mit-license.php))


Features not included in GDAL/OGR for Windows CE:

	
  * in fact, this port does not include rasters support

	
  * [GEOS](http://geos.refractions.net) has not been ported yet, so OGR for Windows CE compiles without GEOS support.

	
  * [OGR drivers](http://www.gdal.org/ogr/ogr_formats.html) which are not listed above like GML, CSV, etc.


_NOTE: As you may noticed, I call this port as GDAL/OGR but, in fact, 
currently it only includes OGR - vectors support. Simply, I hope it will 
become more complete port of GDAL, with rasters support, in future.
_





### How to use it?





Untill now, I managed to build GDAL/OGR with [eVC++ 4.0](http://www.microsoft.com/downloads/details.aspx?familyid=1DACDB3D-50D1-41B2-A107-FA75AE960856) and use it on my device running [Pocket PC 2003](http://msdn.microsoft.com/mobility/windowsmobile/default.aspx) ([Windows CE .NET 4.2](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/wcelib40/html/pb_start.asp)).






Here I posted the complete story on [gmane.comp.gis.gdal.devel](http://news.gmane.org/gmane.comp.gis.gdal.devel/) - [[ANN] First release of GDAL/OGR for Windows CE](http://thread.gmane.org/gmane.comp.gis.gdal.devel/6616). Building instructions can be found in [gdal\wince\README](http://www.gdal.org/download.html) file in the official CVS.





### Roadmap





This week, I'm porting [GEOS](http://geos.refractions.net) to Windows CE. I hope it will work soon. Then it will be possible to measure performance of complete solution (OGR + GEOS) and optimize it if necessary.





### Contributors wanted!





If you are interested in using, testing or contributing to the Windows CE port of GDAL/OGR, please [give me a note](http://mateusz.loskot.net/contact/) on or post your message to the [mailing list](http://lists.maptools.org/mailman/listinfo/gdal-dev/). I'd be very thankful for every support.





### Thanks





I'd like to give **BIG THANKS** to [Frank Warmerdam](http://pobox.com/~warmerdam) and [Taxus SI Ltd.](http://www.taxussi.com.pl) where I'm employed, for their great support.

