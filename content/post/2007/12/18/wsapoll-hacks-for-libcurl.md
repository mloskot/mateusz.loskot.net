---
date: 2007-12-18 07:11:12
slug: wsapoll-hacks-for-libcurl
title: WSAPoll hacks for libcurl
categories: programming
  c++,visual studio,windows
---

![cURL logo](/images/logos/curl-logo-2.png)Continuing my adventures with Visual C++ 2008, I'd like to share some observations about new WinSock2 features. The Visual C++ 2008 uses new incarnation of Microsoft Platform SDK called Windows SDK ([New Windows SDK Available to Download](http://blogs.msdn.com/windowssdk/archive/2007/07/30/new-windows-sdk-available-to-download.aspx)). This SDK is named as _for Windows Vista_ what's quite misinforming because it also supports development for Windows XP, Windows Server 2003 SP1, and Windows Server 2003 R2.





One of new feature in Winsock API is [WSAPoll](http://msdn2.microsoft.com/en-us/library/ms741669.aspx) function. As the MSDN says, this function is _is defined on Windows Vista and later_. However, if the Windows SDK is used on Windows XP this function is also available when building software but it's not usable in run-time.





[![wsapoll-unresolved-winxp](http://farm3.static.flickr.com/2214/2119104521_ac913b03d2_t.jpg)](http://www.flickr.com/photos/mloskot/2119104521/)There is **Ws2_32.dll** available under Windows XP but **WSAPoll** function is inaccessible what can be tracked down with [dependency walker](http://www.dependencywalker.com/). The screenshot on the right shows dependency walker with loaded gdal15.dll. The gdal15.dll was built with libcurl support and the libcurl was built with **WSAPoll** function enabled using following definitions in libcurl config-win32.h header:




  * #define HAVE_POLL_FINE 1


  * #define HAVE_STRUCT_POLLFD 1







The red box next to the **WSAPoll** function in the _parent import function list view_ says that the function is unresolved, as not exported from the module. IOW, **ws2_32.dll** under Windows in other version than Vista or later does not export **WSAPoll** function.





Now, the heart of this matter is **why** libcurl built using Visual C++ 2008 and Windows SDK under Windows XP refers to WSAPoll function which is not available?




The answer is simple though not obvious. The new SDK forces Windows Vista as default target regardless of what host system is used. The default definitions come from file _C:\Program Files\Microsoft SDKs\Windows\v6.0A\Include\sdkddkver.h_:

    
    
    #if !defined(_WIN32_WINNT) && !defined(_CHICAGO_)
    #define  _WIN32_WINNT   0x0600
    #endif
    


and a few lines later:

    
    
    #ifndef WINVER
    #ifdef _WIN32_WINNT
    // set WINVER based on _WIN32_WINNT
    #define WINVER   _WIN32_WINNT
    #else
    #define WINVER   0x0600
    #endif
    #endif
    


The value 0x0600 represents Windows Vista. All macros and version numbers are listed in the MSDN article [Using the Windows Headers](http://msdn2.microsoft.com/en-us/library/aa383745.aspx).





In order to build libcurl using Visual C++ 2008 and Windows SDK but without referencing WSAPoll, I had to manually **downgrade target platform** to Windows XP by defining necessary macros:

    
    
    #define WINVER         0x0502
    #define _WIN32_WINNT   0x0502
    #define _WIN32_WINDOWS 0x0502
    



I put these definitions on top of the _libs\config-win32.h_ file but they can be also added to CFLAGS in Makefile.





After this small patch, libcurl rebuild and GDAL rebuild using Visual C++ 2008 + Windows SDK, there is no reference to new but unavailable **WSAPoll** function under Windows non-Vista.





Just for records, here is [Vista patch](http://curl.haxx.se/mail/lib-2006-09/0243.html) announcement with the WSAPoll function support for libcurl. I think there is a need for new **Makefile.vc9** and configuration option used to select target platform, so uses can libcurl with latest Visual C++ compiler and Windows SDK targetting older Windows versions too.
