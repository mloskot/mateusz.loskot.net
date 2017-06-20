---
title: AX_LIB_LIBKML macro
date: 2010-03-04 01:10:11
category: code
slug: ax_lib_libkml-macro
categories: open source,programming
---

Recently, I was playing for a while with [Brian](http://lists.osgeo.org/pipermail/gdal-dev/2010-February/023718.html)'s new [OGR LIBKML driver](http://winkey.org/svn/libkml/) and I integrated it with [GDAL/OGR](http://www.gdal.org/ogr/) build system, so it's more convenient to build, test and use it. The complete tree is available in GDAL sandbox in [mloskot/winkey-libkml](https://svn.osgeo.org/gdal/sandbox/mloskot/winkey-libkml/). (It is just a _give it a try_-like prototype and I don't actively maintain this branch myself. Hopefully, Brian will take it over.)


By the way, I crafted [AX_LIB_LIBKML](http://github.com/mloskot/workshop/blob/master/autotools/macros/ax_lib_libkml.m4) macro for [Autoconf](http://www.gnu.org/software/autoconf/). This macros checks for headers and libraries of specified version (or newer) of Google [libkml](http://code.google.com/p/libkml/) library and defines compilation and linking flags.


I [submitted the macro](http://savannah.gnu.org/patch/index.php?7109) to [GNU Autoconf Archive](http://www.gnu.org/software/autoconf-archive/). It is the new incarnation of well-known [autoconf-archive.cryp.to](http://autoconf-archive.cryp.to). Peter Simons [announced](http://lists.gnu.org/archive/html/autoconf-archive-maintainers/2009-12/msg00000.html) not long time ago that


> The archive has moved to Savannah: [http://www.nongnu.org/autoconf-archive/](http://www.nongnu.org/autoconf-archive/).
> Version 2009-04-26 was the last to be released at autoconf-archive.cryp.to.


Happy detecting libkml!
