---
date: 2009-10-02 19:29:05
slug: liblas-121-released
title: libLAS 1.2.1 Released
categories: open source,programming
---

[![libLAS - ASPRS LiDAR data translation toolset](/images/logos/liblas-logo.png)](http://liblas.org/) Howard just posted [announcement](http://lists.osgeo.org/pipermail/liblas-devel/2009-October/000647.html) about patch of [libLAS 1.2.1](http://liblas.org/wiki/1.2.1) release.




Detailed list of fixes includes:






  * [#120](http://liblas.org/ticket/120) - support 'comma' as a separator in las2txt


  * [#121](http://liblas.org/ticket/121) - las2txt and txt2las don't work with the Point Source ID


  * [#122](http://liblas.org/ticket/122) - las2las does not eliminate requested classifications


  * [#124](http://liblas.org/ticket/124) - some files have pad bytes when they shouldn't


  * [#127](http://liblas.org/ticket/127) - Scan flags is order sensitive


  * [#129](http://liblas.org/ticket/129) - Version.rc doesn't make the release


  * [#132](http://liblas.org/ticket/132) - Require libgeotiff when GDAL is requested


  * [#133](http://liblas.org/ticket/133) - FreeBSD endian.hpp


  * [#134](http://liblas.org/ticket/134) - GDAL transform translates the points incorrectly when there is a scale or translation on the points


  * [#136](http://liblas.org/ticket/136) - Problem overwritting Reader's dataoffset due to VLR


  * [#139](http://liblas.org/ticket/139) - txt2las is not setting the point source id correctly for values > 255


  * [#140](http://liblas.org/ticket/140) - liblas 1.2 linking problems due to --with-hide-internals gdal option


  * [#141](http://liblas.org/ticket/141) - lasinfo in not reporting info about point source id


  * [#143](http://liblas.org/ticket/143) - libLAS 1.2 requires GDAL 1.7 (unreleased)


  * [#144](http://liblas.org/ticket/144) - Apps should take in filenames without -i argument


  * [#145](http://liblas.org/ticket/145) - Memory leak from LASWriter / lasspatialreference assignment operator=


  * [#148](http://liblas.org/ticket/148) - No prototype in core.py for LASPoint_Destroy





On behalf of the [libLAS team](http://liblas.org/browser/AUTHORS), thanks to all who provided bug reports and patches!





Before delivering next major release of libLAS, there is one big issue that must be fixed. It is problem with large files under Windows 32-bit operating system - [ticket #147](http://liblas.org/ticket/147). Volunteers are welcome to take care of it :-)




I would also like to see completed build configuration based on [CMake](http://cmake.org/) - [ticket #52](http://liblas.org/ticket/52). [It is already usable](/?p=1019) on Unix (GCC) and Windows (Visual C++), so testers are welcome to give it a try and give us feedback.
