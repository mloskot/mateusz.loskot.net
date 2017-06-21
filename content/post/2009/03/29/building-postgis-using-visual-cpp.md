---
date: 2009-03-29 06:36:25
slug: building-postgis-using-visual-cpp
title: Building PostGIS using Visual C++
categories: life,open source,programming
  source,open source,postgis,postgresql,programming,proj.4,proj4,project,spatial,srs,visual
  c++,visual studio,visualc++,windows,wktraster
---

I don't like [MinGW](http://www.mingw.org/). I've been dreaming about building [PostGIS](http://postgis.refractions.net/) using [Visual C++](http://msdn.microsoft.com/en-us/visualc/) - the **native** development toolset for Windows platform - without being forced to install Unix-like environment inside Windows. Finally, I've got motivated enough and decided to make my dreams reality, so here is the story.

First, I collected all _run-time_ dependencies required by PostGIS. I intentionally used the word _run-time_ to indicate I'm not going to install MinGW neither [Cygwin](http://www.cygwin.org/) or any other [GCC](http://gcc.gnu.org/)-for-Windows package. GNU make is also not required.

I use [PostGIS source code from trunk](http://svn.osgeo.org/postgis/trunk/) in the Subversion [repository](/?p=310).

### Dependencies

There are only 3 software packages required:

  1. PostgreSQL [8.3.6](http://www.postgresql.org/docs/8.3/static/release-8-3-6.html) - [official Win32 binaries](http://www.postgresql.org/download/windows) and [source code](http://www.postgresql.org/ftp/source/v8.3.6/)

  2. [GEOS](http://trac.osgeo.org/geos) - build from sources, it's safe to grab SVN [trunk](http://svn.osgeo.org/geos/trunk)

  3. [PROJ.4](http://buildbot.osgeo.org/proj4) - also build from sources and also from SVN [trunk](http://svn.osgeo.org/metacrs/proj/trunk/proj/)

I installed the [PostgreSQL 8.3.6](http://www.postgresql.org/docs/8.3/interactive/index.html) **without** PostGIS [extensions](http://www.postgresql.org/docs/8.3/interactive/xfunc-c.html), as I'm going to provide my own :-), using default location `c:\Program Files\PostgreSQL\8.3`. The source code of PostgreSQL 8.3.6 went to `d:\dev\postgresql\postgresql-8.3.6`.

Short note on directories layout using for projects downloaded directly from repositories. Root path of source tree of each project have the same layout: `D:\dev\PROJECT\_svn\trunk`. For Visual Studio projects, these paths are defined as [macros](http://msdn.microsoft.com/en-us/library/f2t8ztwy(VS.80).aspx) in `postgis.vsprops` ([Visual C++ Property Sheet](http://msdn.microsoft.com/en-us/library/a4xbdz1e(VS.80).aspx)), so it should be easy to redefine them without any need to hack other project settings like [Additional Include Directories](http://msdn.microsoft.com/en-us/library/73f9s62w(VS.80).aspx) and others.


Building GEOS using Visual C++ is quite an easy task:
    
    D:\dev\geos\_svn\trunk> svn co http://svn.osgeo.org/geos/trunk .
    D:\dev\geos\_svn\trunk> autogen.bat
    D:\dev\geos\_svn\trunk> nmake /f makefile.vc

Building PROJ.4 is even easier:

```    
D:\dev\proj4\_svn\trunk> svn co http://svn.osgeo.org/metacrs/proj/trunk/proj .
D:\dev\proj4\_svn\trunk> nmake /f makefile.vc
```

There is no need to copy any files from GEOS or PROJ.4 tree anywhere. DLL binaries (only) will be copied later.

### Patching PostGIS sources

Now, it's time to get ready for building PostGIS DLL.

After I took up the idea of building PostGIS using [Visual C++](http://en.wikipedia.org/wiki/Visual_C%2B%2B), I realized there are number fixes required. Some of them have been already submitted to the SVN trunk: [#125](http://code.google.com/p/postgis/issues/detail?id=125), [#128](http://code.google.com/p/postgis/issues/detail?id=126), [r3828](http://postgis.refractions.net/pipermail/postgis-commits/2009-March/001341.html), [r3848](http://postgis.refractions.net/pipermail/postgis-commits/2009-March/001361.html), [r3846 ](http://postgis.refractions.net/pipermail/postgis-commits/2009-March/001359.html).

However, more patches were required as well as I had to prepare complete solution and projects for [Visual Studio 2005](http://msdn.microsoft.com/en-us/library/669zx6zc(VS.80).aspx). The last revision of PostGIS SVN trunk I used to build it using Visual C++ was **r3938**. In order to make it easier to discover what's the complete set of changes required by Visual C++ here are two packages:

  * [postgis-r3938-msvc-build.zip](/download/projects/postgis/postgis-r3938-msvc-build.zip) - complete package with my working copy including all updates required by Visual C++ (r3938)
  * [postgis-r3938-msvc-build.patch](/download/projects/postgis/postgis-r3938-msvc-build.patch) - [svn diff](http://svnbook.red-bean.com/en/1.5/svn.ref.svn.c.diff.html) output for the working copy tree

This is [status](http://svnbook.red-bean.com/en/1.5/svn.ref.svn.c.status.html) summary reported by [svn]() for my working copy of PostGIS trunk:

```    
D:\dev\postgis\_svn\trunk>svn st
A      postgis_config.h.in.vc
M      liblwgeom\lex.yy.c
M      liblwgeom\wktparse.tab.c
M      liblwgeom\wktparse.lex
M      liblwgeom\vsprintf.c
M      liblwgeom\wktparse.y
A      platform
A      platform\win32
A      platform\win32\ChangeLog.txt
A      platform\win32\inttypes.h
A      platform\win32\README.txt
A      platform\win32\stdint.h
A      platform\win32\sys
A      platform\win32\sys\param.h
A      postgis\postgis.def
A      postgis\postgis.sql.vc
A      build
A      build\msvc80
A      build\msvc80\liblwgeom
A      build\msvc80\liblwgeom\liblwgeom.vcproj
A      build\msvc80\postgis.sln
A      build\msvc80\postgis.vsprops
A      build\msvc80\postgis_dll
A      build\msvc80\postgis_dll\postgis_dll.vcproj
A      build\msvc80\bootstrap
A      build\msvc80\bootstrap\bootstrap.vcproj
D:\dev\postgis\_svn\trunk>
``` 

### Building PostGIS binaries

I think the easiest way to try this building procedure is to download the package with [my working copy](/download/projects/postgis/postgis-r3938-msvc-build.zip) and unpack it somewhere on your disk. Alternatively, you can grab PostGIS sources directly from SVN, then _diff & patch_ (manually) to apply changes from my working copy. The package includes Visual Studio solution located in `trunk\build\msvc80` subdirectory. Here are the steps:

  1. Open solution file `postgis.sln` in [Visual Studio 2005 or Visual Studio 2008](http://technet.microsoft.com/en-us/library/zcbsd3cz(VS.80).aspx) (in this case, projects will be converted automatically, just accept it).

  2. Go to Property Manager tab and double click on `postgis.vsprops` sheet.

  3. Expand _Common Properties_ and go to _User Macros_ dialog.

  4. Here, you need to verify and update (if your paths are different) four macros with locations of the PostGIS dependencies. Here are the macros with paths I used ([screenshot](http://www.flickr.com/photos/mloskot/3394521036/)):

```   
GEOS_SRC_ROOT = D:\dev\geos\_svn\trunk
PROJ4_SRC_ROOT = D:\dev\proj\_svn\trunk
POSTGRESQL_SRC_ROOT = D:\dev\postgresql\postgresql-8.3.6
POSTGRESQL_ROOT = C:\Program Files\PostgreSQL\8.3
```

Do **NOT** change any other macros than the four listed above, especially do not change `POSTGIS_DLL_NAME` macro.

  5. Click OK to accept your changes and save the Property Sheet. It's a good idea to click on _Save_ button on the small toolbar of Proprety Manager.

Everything is configured and ready to build: _Build -> Build Solution_ or hit _F7_ (I tested only Debug build). [Visual C++ compiler](http://en.wikipedia.org/wiki/Visual_C%2B%2B) will flood the IDE _Output_ window with nearly **1600** warnings. It is (probably) safe to ignore them. If you are lucky, after a few minutes `postgis-1.4.dll` binary is ready inside `trunk\build\msvc80\debug` directory.

### Installing PostGIS extension

Now, it's time to install all binaries:

  1. Install GEOS libraries (DLL):
    
    D:\dev\geos\_svn\trunk>copy source\geos.dll "c:\Program Files\PostgreSQL\8.3\bin"
    D:\dev\geos\_svn\trunk>copy source\geos_c.dll "c:\Program Files\PostgreSQL\8.3\bin"

  2. Install PROJ.4 library (DLL):
    
    D:\dev\proj\_svn\trunk>copy src\proj.dll "c:\Program Files\PostgreSQL\8.3\bin"

  3. Intall PostGIS library (DLL):
    
    D:\dev\postgis\_svn\trunk>copy build\msvc80\debug\postgis-1.4.dll "c:\Program Files\PostgreSQL\8.3\lib"


Double check if all libraries have been delivered:

```
C:\Program Files\PostgreSQL\8.3>ls -l lib\postgis-1.4.dll
-rw-rw-rw-  1 mloskot 0 770048 2009-03-29 02:10 lib\postgis-1.4.dll
C:\Program Files\PostgreSQL\8.3>ls -l bin\geos*
-rw-rw-rw-  1 mloskot 0 1236992 2009-03-28 21:02 bin\geos.dll
-rw-rw-rw-  1 mloskot 0 1056768 2009-03-28 21:02 bin\geos_c.dll
C:\Program Files\PostgreSQL\8.3>ls -l bin\proj.dll
-rw-rw-rw-  1 mloskot 0 233472 2009-03-29 00:58 bin\proj.dll
```

(don't be confused seeing `ls` command, I have GnuWin32 installed.

### The Moment of Truth

As a shortcut, I generated `postgis.sql` on my Linux box (based on SVN trunk r3938 too) and copied to `trunk\postgis\postgis.sql.vc`. This file is included in the [postgis-r3938-msvc-build.zip](/download/projects/postgis/postgis-r3938-msvc-build.zip) as well as in the patch. The `trunk\postgis\postgis.sql.vc` refers to `postgis-1.4` library. This is the reason why I warned above to not to change value of POSTGIS_DLL_NAME macro. Visual Studio automatically make a copy of the SQL script with new name `trunk\postgis\postgis.sql` (see configuration of _bootstrap_ project).

All components are in place: binaries installed in PostgreSQL 8.3.6 directory, main SQL script prepared in `trunk\postgis\postgis.sql` and original version of `trunk\spatial_ref_sys.sql` file provided by SVN trunk. Moving on to create PostGIS-enaled database called _test_:

```   
C:\Program Files\PostgreSQL\8.3>createdb -E UTF-8 -O mloskot test
```

It seems it's not necessary to first enable PL/pgSQL langauge:

```   
C:\Program Files\PostgreSQL\8.3>createlang plpgsql test
createlang: language "plpgsql" is already installed in database "test"
```

So, you can skip to loading PostGIS extensions:

```    
C:\Program Files\PostgreSQL\8.3>psql -d test -f d:\dev\postgis\_svn\trunk\postgis\postgis.sql
BEGIN
psql:d:/dev/postgis/_svn/trunk/postgis/postgis.sql:34: NOTICE:  type "spheroid" is not yet defined
DETAIL:  Creating a shell type definition.
...
CREATE FUNCTION
psql:d:/dev/postgis/_svn/trunk/postgis/postgis.sql:2201: NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "spatial_ref_sys_pkey" for table "spatial_ref_sys"
CREATE TABLE
psql:d:/dev/postgis/_svn/trunk/postgis/postgis.sql:2219: NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "geometry_columns_pk" for table "geometry_columns"
CREATE TABLE
...
CREATE FUNCTION
COMMIT
```

and definition of [Spatial Reference Systems](http://spatialreference.org):

```   
C:\Program Files\PostgreSQL\8.3>psql -d test -f d:\dev\postgis\_svn\trunk\spatial_ref_sys.sql
BEGIN
INSERT 0 1
...
INSERT 0 1
COMMIT
VACUUM
```

If every step explained above succeeded, the _test_ database has been enabled with PostGIS features. Simple version check can confirm that it is:

```    
C:\Program Files\PostgreSQL\8.3>psql -d test -c "SELECT postgis_version();"
            postgis_version
---------------------------------------
    1.4 USE_GEOS=1 USE_PROJ=1 USE_STATS=1
(1 row)
```

For development purposes, to be sure in 100% I use my own build of PostGIS, I redefined value of build date macro in `trunk\postgis_config.h.in.vc`:

```    
#define POSTGIS_BUILD_DATE "2009-03-29 (MSVC)"
```

and _MSVC_ tag is reported as expected:

```   
C:\Program Files\PostgreSQL\8.3>psql -d test -c "SELECT postgis_lib_build_date();"
    postgis_lib_build_date
------------------------
    2009-03-29 (MSVC)
(1 row)
```

### Testing Visual C++ build of PostGIS

I have not run complete set of the [regression tests](http://svn.osgeo.org/postgis/trunk/regress/). Chances are, that some functions do not work as expected or they may even crash! However, as a basic test I've run [regress.sql](http://svn.osgeo.org/postgis/trunk/regress/regress.sql) on my installation. Here are file swith test [output](/download/projects/postgis/regress-sql.log) and [errors log](/download/projects/postgis/regress-sql-errors.log).

### Summary

It works! The PostGIS sources (r3938 + patches) compile using Visual C++ compiler (tested only with [8.0](http://en.wikipedia.org/wiki/Visual_C%2B%2B)). The PostGIS binaries link against all run-time dependencies. Basic tests run successfully.

Apparently, it's not the end. Next steps include running the complete regression tests package. Also, I think it's a good idea to rewrite Visual Studio solution and projects to [NMAKE](http://msdn.microsoft.com/en-us/library/dd9y37ha(VS.71).aspx) makefiles or - even better - prepare [CMake](http://www.cmake.org/) configuration, which could serve well in both environments, Unix and Windows. If there is volunteer willing to prepare configuration for these builders, I very eager to help in testing it using Visual Studio 2005 and 2008. If it will be CMake, then I can test it on Linux too.

By the way, looks like we're getting closer to make [WKT Raster](/posts/2009/03/08/wkt-raster-crash-course-1/) _build-able_ using Visual C++ for Windows :-)
