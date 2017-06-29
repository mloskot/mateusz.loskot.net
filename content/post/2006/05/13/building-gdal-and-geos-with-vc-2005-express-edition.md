---
date: 2006-05-13 16:15:38
slug: building-gdal-and-geos-with-vc-2005-express-edition
title: Building GDAL and GEOS with VC++ 2005 Express Edition
categories: [ "code" ]
  c++,visual studio
---

![GEOS Logo](/images/logos/postgis-globe-logo.gif)Yesterday, I installed [Visual C++ 2005 Express Edition](http://msdn.microsoft.com/vstudio/express/visualc/) and [Microsoft Platform SDK](http://www.microsoft.com/downloads/details.aspx?FamilyId=A55B6B43-E24F-4EA3-A93E-40C0EC4F68E5&displaylang=en). I followed [manual installation instructions](http://msdn.microsoft.com/vstudio/express/support/install/) to install Visial C++ 2005. Second, I installed Platform SDK as described [here](http://msdn.microsoft.com/vstudio/express/visualc/usingpsdk/). I also had to take a few additional steps, not explained in the guidelines above. Simply, official guidelines seems to be incomplete. So, if you are going to build [GDAL](http://www.gdal.org) with Visual C++ 2005, please follow instructions from the [[Gdal-dev] Building with Visual C++ 2005 Express](http://lists.maptools.org/pipermail/gdal-dev/2005-December/007537.html) thread on the [gdal-dev](http://lists.maptools.org/mailman/listinfo/gdal-dev/) list. I also wrote short HOWTO as [comment #3](http://bugzilla.remotesensing.org/show_bug.cgi?id=1170#c3) to bug report [#1170](http://bugzilla.remotesensing.org/show_bug.cgi?id=1170) recently submitted to GDAL bugzilla.






After you have installed and configured Visual C++ environment, you can follow the official [Building GDAL From Source](http://www.gdal.org/gdal_building.html) instructions to build GDAL.






If you want to build [GEOS](http://geos.refractions.net) with Visual C++ 2005, visit my GEOS [unofficial resources website](http://mateusz.loskot.net/projects/geos/) and [download](http://mateusz.loskot.net/download/projects/geos/geos-msvc-2005-project.zip) project files for Visual C++ 2005 from section titled as **GEOS 3.0.0 (current development)**. Next, unzip the package, get GEOS sources and put them into the _geos_ directory (you'll get it after unzipping). Finally, open the **geos_lib.sln** solution file with Visual C++ 2005 IDE and try to build it.






If you'll meet any problems or you have question, please don't hesitate to catch me.

