---
title: Visual Studio 11 support for Boost.Build
date: 2011-12-17 16:57:09

slug: visual-studio-11-support-for-boost-build
categories: [ "code" ]
---

I have just submitted [patch with update for Boost.Build](https://svn.boost.org/trac/boost/ticket/6283) machinery to properly detect Visual Studio 11 (currently available as Developer Preview).


I have very little experience with [Boost.Build v2](http://www.boost.org/boost-build2/) internals, so the patch may need further improvements. It works in my environment on Windows 7 (64-bit) with Visual Studio 2010 Express Edition installed alongside the [Visual Studio 11 Developer Preview](http://msdn.microsoft.com/en-us/vstudio/hh127353).


If you want to use Visual Studio 11 as Boost.Build toolset, just put the following entry in your user-config.jam file:


```
using msvc : 11.0 ;
```


To verify if the toolset is recognised correctly, use `b2` debugging options:
    
    
```
b2 --debug-configuration --debug-building --debug-generator buffer.cpp
notice: found boost-build.jam at D:/dev/boost/_svn/trunk/boost-build.jam
notice: loading Boost.Build from D:/dev/boost/_svn/trunk/tools/build/v2
notice: Searching C:\Windows C:\Users\mloskot C:\Users\mloskot D:\dev\boost\_svn\trunk\tools/build/v2 D:/dev/boost/_svn/trunk/tools/build/v2/kernel D:/dev/
boost/_svn/trunk/tools/build/v2/util D:/dev/boost/_svn/trunk/tools/build/v2/build D:/dev/boost/_svn/trunk/tools/build/v2/tools D:/dev/boost/_svn/trunk/tool
s/build/v2/contrib D:/dev/boost/_svn/trunk/tools/build/v2/. for site-config configuration file site-config.jam .
notice: Loading site-config configuration file site-config.jam from D:/dev/boost/_svn/trunk/tools/build/v2/site-config.jam .
notice: Searching C:\Users\mloskot C:\Users\mloskot D:\dev\boost\_svn\trunk\tools/build/v2 D:/dev/boost/_svn/trunk/tools/build/v2/kernel D:/dev/boost/_svn/
trunk/tools/build/v2/util D:/dev/boost/_svn/trunk/tools/build/v2/build D:/dev/boost/_svn/trunk/tools/build/v2/tools D:/dev/boost/_svn/trunk/tools/build/v2/
contrib D:/dev/boost/_svn/trunk/tools/build/v2/. for user-config configuration file user-config.jam .
notice: Loading user-config configuration file user-config.jam from C:/Users/mloskot/user-config.jam .
notice: [msvc-cfg] msvc-11.0 detected, command: 'C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\cl.exe'
notice: [msvc-cfg] msvc-10.0 detected, command: 'C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\cl.exe'
notice: [msvc-cfg] msvc-10.0express detected, command: 'C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\cl.exe'
notice: will use 'C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\cl.exe' for msvc, condition <toolset>msvc-11.0
notice: [msvc-cfg] condition: '<toolset>msvc-11.0/<architecture>/<address-model>', setup: 'call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcv
arsall.bat" x86 >nul
...
```
    

and look for the following message reported:
    

```
notice: will use 'C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\cl.exe' for msvc, condition <toolset>msvc-11.0
```
