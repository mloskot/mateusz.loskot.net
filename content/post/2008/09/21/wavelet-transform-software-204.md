---
date: 2008-09-21 16:59:51
slug: wavelet-transform-software-204
title: Wavelet Transform Software 2.04
categories: [ "code" ]
---

[![GDAL logo](/images/logos/gdal-logo.png)](http://www.gdal.org/)This post should be interesting to users of GDAL MSG driver - [Meteosat Second Generation](http://www.gdal.org/frmt_msg.html).




In July 2008, by the way of doing [GDAL](http://www.gdal.org/) [MSG](http://trac.osgeo.org/gdal/wiki/MSG) driver cleanup, I've also applied [a few fixes](http://trac.osgeo.org/gdal/ticket/2168) to the _Public Wavelet Transform Decompression Library_ (aka Wavelet Transform Software) developed by [EUMETSAT](http://www.eumetsat.int/). I patched WT version 2.03 and sent my fixes to EUMETSAT.





Recently, I've got a message from [EUMETSAT](http://en.wikipedia.org/wiki/European_Organisation_for_the_Exploitation_of_Meteorological_Satellites) they approved the patch and will include it in upcoming release of the Wavelet Transform Decompression Library. Actually, new version 2.04 has been already published and is [available to download](http://www.eumetsat.int/Home/Main/Access_to_Data/User_Support/SP_1117714787347) (after [registration](http://oiswww.eumetsat.int/WEBOPS-cgi/wavelet/register)) from the EUMETSAT website.



> Modification of the source code to support a newer version of gcc compiler. gcc 4.2.x and previous versions are now supported. Upgrade fixes kindly provided by Mateusz Loskot.

Modified files with respect to previous version: CImage.h, CJBlock.h, CJBlock.cpp








It's really nice to see my work wasn't a waste of time :-)
