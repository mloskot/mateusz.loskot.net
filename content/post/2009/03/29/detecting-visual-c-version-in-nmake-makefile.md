---
date: 2009-03-29 20:12:17
slug: detecting-visual-c-version-in-nmake-makefile
title: Detecting Visual C++ version in NMAKE makefile
categories: [ "code" ]
  source,programming,project,spatial,version,visual c++,visual studio,windows,_MSC_VER,_NMAKE_VER
---

Traditionally when building [GDAL/OGR](http://www.gdal.org/), [GEOS](http://trac.osgeo.org/geos/) or [libLAS](http://www.liblas.org/) using [NMAKE](http://msdn.microsoft.com/en-us/library/dd9y37ha(VS.71).aspx) users specify version of [Visual C++ compiler](http://en.wikipedia.org/wiki/Visual_C%2B%2B) being used as value of `MSVC_VER` [macro](http://msdn.microsoft.com/en-us/library/wc38eeb4(VS.71).aspx). This macros is not required but it's recommended, so NMAKE can compose best possible set of compilation and linking flags for particular version of [Visual C++](http://msdn.microsoft.com/en-us/library/60k1461a(VS.80).aspx). For instance, command specifying [Visual C++ 8.0](http://msdn.microsoft.com/en-us/library/bw65k95a(VS.80).aspx) ([Visual Studio 2005](http://msdn.microsoft.com/en-us/library/ms950416.aspx)) looks like this:



    
    nmake -f makefile.vc MSVC_VER=1400





Recently, I [hacked libLAS makefiles](http://liblas.org/changeset/1140) (and GEOS [makefiles](http://trac.osgeo.org/geos/changeset/2308) [too](http://trac.osgeo.org/geos/changeset/2309)), so Visual C++ version can be determined (semi-)automatically. NMAKE 1.62 or higher reports its version as value of _NMAKE_VER macro. The solution is to defined compiler version based on version of NMAKE tool:





**Update 2009-04-03**: Added _`NMAKE_VER` number `9.00.21022.08`




    
    !IF "$(_NMAKE_VER)" == ""
    MSVC_VER = 4.0
    !ERROR *** Prehistoric version of Visual C++
    !ELSEIF "$(_NMAKE_VER)" == "162"
    MSVC_VER = 5.0
    !ERROR *** Prehistoric version of Visual C++
    !ELSEIF "$(_NMAKE_VER)" == "6.00.8168.0"
    MSVC_VER = 6.0
    MSC_VER = 1200
    !ERROR *** Prehistoric version of Visual C++
    !ELSEIF "$(_NMAKE_VER)" == "7.00.9466"
    MSVC_VER = 7.0
    MSC_VER = 1300
    !ELSEIF "$(_NMAKE_VER)" == "7.10.3077"
    MSVC_VER = 7.1
    MSC_VER = 1310
    !ELSEIF "$(_NMAKE_VER)" == "8.00.50727.42"
    MSVC_VER = 8.0
    MSC_VER = 1400
    !ELSEIF "$(_NMAKE_VER)" == "8.00.50727.762"
    MSVC_VER = 8.0
    MSC_VER = 1400
    !ELSEIF "$(_NMAKE_VER)" == "9.00.21022.08" 
    MSVC_VER = 9.0
    MSC_VER = 1500
    !ELSEIF "$(_NMAKE_VER)" == "9.00.30729.01"
    MSVC_VER = 9.0
    MSC_VER = 1500
    !ELSE
    MSVC_VER = 0.0
    MSC_VER = 0
    !ENDIF





Later macros `MSVC_VER` and `MSC_VER` can be used to report Visual C++ version:




    
    !IF "$(MSVC_VER)" == "0.0" && "$(MSC_VER)" == "0"
    !MESSAGE *** Cannot determined Visual C++ version
    !ERROR *** Aborting make job
    !ELSE
    !MESSAGE *** Using Microsoft NMAKE version $(_NMAKE_VER)
    !MESSAGE *** Using Microsoft Visual C++ version $(MSVC_VER)
    !MESSAGE *** Using Microsoft C/C++ version $(MSC_VER)
    !ENDIF





This is not a rocket science, but it seems to work well and it frees users from manual specification of Visual C++ version. I'm not sure how the NMAKE version numbers vary across Visual Studio versions and builds. It would be good _collect these version numbers_ to make the solution reliable. So, I'd be **thankful** if readers using Visual Studio **2002**, **2003**, **2005** and **2008** or [newer](http://www.microsoft.com/visualstudio/en-gb/products/2010/default.mspx) :-) could report their NMAKE versions [directly to me](/contact) or post them as comments below.
