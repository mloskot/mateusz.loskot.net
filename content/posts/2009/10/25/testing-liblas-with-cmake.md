---
date: 2009-10-25 01:25:58
slug: testing-liblas-with-cmake
title: Testing libLAS with CMake
categories: open source,programming
---

[![libLAS - ASPRS LiDAR data translation toolset](/images/logos/liblas-logo.png)](http://liblas.org/) As a part of [CMake configuration for libLAS](http://liblas.org/ticket/52), I've enabled support CTest. It is CMake test driver program that can be used to run automated tests and perform continuous integration. I also registered [libLAS](http://liblas.org) at [CDash](http://my.cdash.org/) testing server.





> CDash aggregates, analyzes and displays the results of software testing processes submitted from clients located around the world




Check [libLAS dedicated quality dashboard](http://my.cdash.org/index.php?project=libLAS) - <del> registration is required</del> it is public project and available for anonymous visitors to browse the dashboard (thanks to Julien from Kitware for [quick fix](http://public.kitware.com/pipermail/cdash/2009-October/000574.html)).





Anyone who is would like to [build libLAS using CMake](/?p=1019) and run tests can find details on the [CMake article](http://liblas.org/wiki/CMake) on the [Wiki](http://liblas.org/wiki/). I would also encourage interested users to issue [make Continuous](http://en.wikipedia.org/wiki/Continuous_integration) to submit test results to the dashboard.





Feedback kindly wanted!
