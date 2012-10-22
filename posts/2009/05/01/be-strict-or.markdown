---
comments: true
date: 2009-05-01 22:10:47
layout: post
slug: be-strict-or
title: Be strict or...
wordpressid: 482
categories: programming
tags: c++,code,compiler,error,gcc,geometry,geos,jts,malloc,memcpy,namespace,open source,open
  source,programming,project,quality,spatial,strict
---

...you may have to eat the [C++ programming language standard](http://www.open-std.org/jtc1/sc22/wg21/) (may be with the C one together, brrr) half-baked or even raw.





[GEOS 3.0.0](http://download.osgeo.org/geos/) does not compile using [GCC 4.3.3](http://gcc.gnu.org/gcc-4.3/). The compiler complains, surprisingly, about missing functions like `std::memcpy` ([GEOS](http://trac.osgeo.org/geos/) core is written in C++, not C):




    
    DoubleBits.cpp: In static member function 'static double geos::index::quadtree::DoubleBits::powerOf2(int)':
    DoubleBits.cpp:51: error: 'memcpy' was not declared in this scope
    DoubleBits.cpp: In constructor 'geos::index::quadtree::DoubleBits::DoubleBits(double)':
    DoubleBits.cpp:94: error: 'memcpy' was not declared in this scope


...

    
    StringTokenizer.cpp: In member function 'int geos::io::StringTokenizer::nextToken()':
    StringTokenizer.cpp:75: error: 'strtod' was not declared in this scope
    StringTokenizer.cpp: In member function 'int geos::io::StringTokenizer::peekNextToken()':
    StringTokenizer.cpp:123: error: 'strtod' was not declared in this scope


...


These functions come from the [C/C++ Standard](http://en.wikipedia.org/wiki/C%2B%2B_standard_library) [Library](http://en.wikipedia.org/wiki/String.h), so how they could be missing? They are because the files reported above do not include standard header `<cstring>`. GEOS 3.0.0 <del>had</del> used to compiled using GCC without problems, what happened? GCC is just being aligned to the standards closer and closer, so it becomes strict and unforgiving.





There is a lot of C/C++ code of [FOSS](https://www.ohloh.net/) written in sloppy way being compiled in relaxed mode without use of strict compilation flags. Having in mind number of [bugs reported](http://trac.osgeo.org/gdal/search?q=gcc+4.3&ticket=on) after GCC 4.3 was released, I presume dark clouds are coming again with just released [GCC 4.4.0](http://gcc.gnu.org/gcc-4.4/) and upcoming [4.5.0](http://lwn.net/Articles/329532/). It's always a good idea to not to trust chain or implicit inclusion of standard headers - wherever `std::malloc` is used `<cstdlib>` must be included, same about `std::vector` and `<vector>` and so on.





By the way, this particular bug in GEOS was [spotted](http://lists.osgeo.org/pipermail/geos-devel/2008-October/003659.html) using GCC 4.3, [reported](http://trac.osgeo.org/geos/ticket/196), patched and fix was released as [GEOS 3.0.3](http://download.osgeo.org/geos/).
