---
date: 2007-12-18 00:12:25
slug: building-libcurl-with-visual-c-2008
title: Building libcurl with Visual C++ 2008
categories: programming
  c++,visual studio,windows
---

![cURL logo](/images/logos/curl-logo.gif)Today, I've been testing GDAL builds using [Visual C++ 2008 Express Edition](http://www.microsoft.com/express/vc/Default.aspx), compiler [version 9.0](http://en.wikipedia.org/wiki/Visual_C_Plus_Plus). There are few drivers based on [libcurl](http://curl.haxx.se/libcurl), so I needed to build this library as well. I used [curl 7.17.1](http://curl.haxx.se/download.html) (released in Oct 29, 2007) and it almost worked. In order to build libcurl using Visual C++, small patch required for _lib/config-win32.h_ file:

    
    
    /* Define to make select.h work fine on VC++ 9.0 (2008) */
    #if defined(_MSC_VER) && (_MSC_VER >= 1500)
    /* The poll struct and associated defines are present in the Windows SDK v6.0 that comes with this version... */
    #define HAVE_STRUCT_POLLFD 1
    #endif
    








It's correct to assume all pre-7.17.1 also need this patch. This patch has been [applied to the cURL CVS](http://article.gmane.org/gmane.comp.web.curl.cvs/8548) and should be available in next future. Thanks to Daniel Stenberg for assistance on the #curl channel.
