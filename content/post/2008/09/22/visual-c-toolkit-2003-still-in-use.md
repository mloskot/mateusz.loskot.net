---
date: 2008-09-22 17:58:13
slug: visual-c-toolkit-2003-still-in-use
title: Visual C++ Toolkit 2003 still in use
description: Short tutorial on how to use Visual C++ Toolkit 2003

---

[![Charles Petzold's Tattoo](/images/logos/charles-petzold-tattoo.jpg)](http://www.charlespetzold.com/)In 2004, Microsoft 
[published](http://blogs.msdn.com/brianjo/archive/2004/04/17/115335.aspx) Visual C++ Toolkit 2003 - full version of 
[Visual C++](http://en.wikipedia.org/wiki/Visual_C++) 2003 optimizing compiler (version 1310) available free of charge. 
It was the first free, good and almost complete implementation of [C++ programming language](http://en.wikipedia.org/wiki/C%2B%2B) 
by Microsoft. It is quite old but still used by many developers.

The Toolkit is fairly complete, but you can not avoid a few hacks if you want to use it :-) 
So, I've decided to collect them all in one place to help building projects like [GEOS](http://trac.osgeo.org/geos/), 
[libLAS](http://liblas.org/) or [GDAL/OGR](http://www.gdal.org/) with the Visual C++ Toolkit 2003.

## Installation

First, installation of the following packages is required:

1. Microsoft [.NET Framework SDK 1.1](http://www.microsoft.com/downloads/details.aspx?familyid=9b3a2ca6-3647-4070-9f41-a333c6b9181d&displaylang=en)
2. Microsoft [Platform SDK for Windows Server 2003 R2](http://www.microsoft.com/downloads/details.aspx?familyid=A55B6B43-E24F-4EA3-A93E-40C0EC4F68E5&displaylang=en)
3. Microsoft [Visual C++ Toolkit 2003](http://msdn.microsoft.com/visualc/vctoolkit2003/) (_no longer available_ from Microsoft website, just be _persistent_ [cuiling](http://www.cuil.com/) for it)

## Hacks

This is list of hacks like installation of missing components and fixing a project makefiles:

1. The [.NET Framework SDK 1.1](http://www.microsoft.com/downloads/details.aspx?familyid=9b3a2ca6-3647-4070-9f41-a333c6b9181d&displaylang=en) 
installation (listed above) is required in order to get C Run-Time libraries installed: msvcrt.lib and msvcrtd.lib. 
The .NET SDK installer will copy these files (and a few other components) to directories located in:

```
C:\Program Files\Microsoft Visual Studio .NET 2003
```

2. Surprisingly, import library for [C++ Run-Time Library](http://msdn.microsoft.com/en-us/library/abx4dbyh(VS.80).aspx) 
msvcp71.dll is not included in the Visual C++ Toolkit 2003 distribution. Missing files can be downloaded from 
[CERN](http://root.cern.ch/root/Procedure/) server: [msvcprt.lib](http://root.cern.ch/root/Procedure/msvcprt.lib) 
and [msvcprt.def](http://root.cern.ch/root/Procedure/msvcprt.def). Copy them into
    
```
C:\Program Files\Microsoft Visual C++ Toolkit 2003\lib 
```

3. The Toolkit does not include [lib.exe](http://msdn.microsoft.com/en-us/library/7ykb2k5f(VS.71).aspx) 
utility - Microsoft Library Manager. Fortunately, lib.exe is just a simple wrapper on Microsoft 
Incremental Linker - [link.exe](http://msdn.microsoft.com/en-us/library/y0zzbyt4(VS.71).aspx). 
So, in your NMAKE makefiles replace lib.exe (or lib) command with:


```
link.exe /lib
```

Alternatively, you can build custom lib.exe wrapper using 
[lib.c](http://sapdb.2scale.net/maxdb-wiki/MS_C++_Toolkit#head-ccc72c032728f3e8df0f45339c4a4ea332c880b4) program. 
Recently, I've fixed NMAKE makefiles of [GEOS](http://trac.osgeo.org/geos/) 
([r2190](http://trac.osgeo.org/geos/changeset/2190)) and [libLAS](http://liblas.org/) 
([r876](http://liblas.org/changeset/876)) projects using the former option.

## Environment

Most of articles about Visual C++ Toolkit 2003 and Platform SDK installation procedure suggest to permanently 
update environment variables like INCLUDE, LIB and PATH. Personally, I don't like this approach. 
Instead, I write a simple _SET_MSVC71.BAT_ script which I execute in console window before I run 
NMAKE to build a software project using Visual C++ Toolkit 2003.


The script I use consists of three commands:

    
```
@echo off
CALL "C:\Program Files\Microsoft Platform SDK for Windows Server 2003 R2\SetEnv.Cmd"
CALL "C:\Program Files\Microsoft Visual C++ Toolkit 2003\vcvars32.bat"
CALL "C:\Program Files\Microsoft.NET\SDK\v1.1\Bin\sdkvars.bat"
```

Copy this script to location that is available from the PATH.

## Sample build - libLAS

Below, a few simple steps are presented of using Visual C++ Toolkit 2003 and environment 
configured as presented above to build [libLAS](http://liblas.org/) project. 
The same procedure should work for projects like [GEOS](http://trac.osgeo.org/geos/) 
or [GDAL](http://www.gdal.org/)/[OGR](http://www.gdal.org/ogr/).

1. Run _Command Prompt_ (cmd.exe)
2. Configure environment by executing _SET_MSVC71.BAT_ script:

```
C:\> SET_MSVC71.BAT
```
Check if basic commands are available: cl.exe, nmake.exe, link.exe.

3. Go to [libLAS](http://liblas.org/svn/trunk/) source code directory:
    
```
C:\> cd dev\liblas\trunk
```

4. Run NMAKE command to build [libLAS](http://liblas.org/) library and utilities:
    
```
C:\dev\liblas\trunk> nmake /f makefile.vc
```

Good luck!
