---
title: File version is not supported by the launcher
date: 2011-11-10 23:01:04
category: code
slug: file-version-is-not-supported-by-the-launcher
categories: programming
---

**UPDATE**: This bug (see below) [has been fixed](http://cmake.org/gitweb?p=cmake.git;a=commitdiff;h=f0d66ab4) a few days ago. The fix is available in CMake git repo and should be release in the upcoming CMake 2.8.7 release.


What is the difference between these two Visual Studio solution (.sln) files?


[![vs11-cmake-sln-version-compare](http://farm7.static.flickr.com/6033/6332341933_e0b55823e6_o.png)](http://www.flickr.com/photos/mloskot/6332341933/)


They both have been generated using [CMake 2.8.6](http://cmake.org/). However, having Visual Studio 11 Developer Preview installed, every time I try to launch the `Hello2011.sln` I'm getting mysterious error message: _File version is not supported by the launcher_.


Quick look at what CMake actually outputs in to .sln confirms there is a bug. CMake generates [.sln file signature ](http://blogs.msdn.com/b/andrewarnottms/archive/2008/02/13/why-double-clicking-on-an-sln-file-doesn-t-always-launch-visual-studio.aspx)which does not match release version/name of the Visual Studio 11. In `Hello2011.sln` CMake generated:

    
    Microsoft Visual Studio Solution File, Format Version 12.00
    # Visual Studio 2011


but correct version of the output, fixed in `Hello11.sln`, is this:

    
    Microsoft Visual Studio Solution File, Format Version 12.00
    # Visual Studio 11


Bug report [submitted](http://public.kitware.com/Bug/view.php?id=12572) to CMake developers.


By the way, I have to admit different icons displayed for correct and incorrect .sln file are quite useful.
