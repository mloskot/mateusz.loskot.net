---
title: When Boost.Geometry release?
date: 2010-02-07 00:28:42
categories: [ "code" ]
---

[![Generic Geometry Library (GGL)](/images/logos/ggl-logo.png)](http://trac.osgeo.org/ggl/)The [Boost 1.42](http://www.boost.org/users/download/version_1_42_0) was released a week ago, however this release does not include [Boost.Geometry (aka GGL)](http://trac.osgeo.org/ggl/) which was [accepted](http://permalink.gmane.org/gmane.comp.lib.boost.announce/246) 2 months ago. It is nothing uncommon, though many people have been asking obvious question, why Boost.Geometry is not there and when it will be there.


Boost.Geometry is accepted but with a sticky note attached with a list of issues that need to be solved before the library can be included in official Boost release. It means there is still plenty of work necessary to be done and as soon as they are done and confirmed, we're in.


Hartmut Kaiser, the review manager, included compete and detailed list of all the issues that need to be addressed in the [GGL review results report](http://thread.gmane.org/gmane.comp.lib.boost.devel/197108). Shortly, the contingencies are:

* Robustness: complete review of all elements of the library to assure it allows to instantiate all algorithms with arbitrary number types. By design, it is possible to specialise types and algorithms of Boost.Geometry with [GMP](http://en.wikipedia.org/wiki/GNU_Multi-Precision_Library) or [CLN](http://en.wikipedia.org/wiki/Class_Library_for_Numbers), so it computes with [arbitrary-precision arithmetic](http://en.wikipedia.org/wiki/Arbitrary-precision_arithmetic ). This feature is possible thanks to [numeric_adaptor](http://lists.boost.org/Archives/boost/2009/11/157732.php) developed by Bruno and Barend. Also, details of computational complexity per algorithms shall be updated.

* Concepts: during the review, a few problems have been revealed with adapting custom geometries for Boost.Geometry. The concepts are _a moral backbone_ of the library, so they need to be sound making the adaptation process simpler as that's what the whole idea of [concepts in C++](http://www.devx.com/SpecialReports/Article/38864) is for.

* Boolean operations: robustness and coping with different coordinate orders of polygons should be improved.

* Documentation: currently only [Doxygen-based documentation](http://geometrylibrary.geodan.nl/) is available. This system does not work well for Boost, so migration to [Quickbook](http://www.boost.org/doc/tools/quickbook/index.html) system is to be done.

* Testing: simply, a collection of basic unit tests is not enough and _verification of the correctness of the algorithms in a wide range of use cases_ is necessary along with high volume and random tests.


There are also a few minor issues specified as non-contingencies, however.


It is quite a list and plenty of work that needs to be done and [Barend replied on the list](http://lists.osgeo.org/pipermail/ggl/2010-February/000590.html):


> We're working on the library, I don't hope it will take us that long, but 1.42 was not feasable at all.
> I hope [1.43](https://svn.boost.org/trac/boost/milestone/Boost%201.43.0) but even that is already coming soon.


Tasks dispatched. Fingers crossed.
