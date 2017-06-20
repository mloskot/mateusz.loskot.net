---
date: 2009-08-26 23:21:27
slug: strongly-typed-enum-in-visualcpp
title: Strongly typed enum in Visual C++?
categories: programming
---

Not yet. Victor Bazarov confirmed in [reply to my post]( http://www.microsoft.com/communities/newsgroups/en-us/default.aspx?dg=microsoft.public.vc.language&tid=0126da78-22ff-4062-8914-4ab19e901c79&cat=&lang=&cr=&sloc=&p=1) that there is no official announcement nor rumours that Microsoft is going to include native implementation of [scoped and strongly typed enumerations](http://www.research.att.com/~bs/C++0xFAQ.html#enum) defined in [C++0x](http://en.wikipedia.org/wiki/C%2B%2B0x) in upcoming [Visual C++ 10.0](http://blogs.msdn.com/vcblog/archive/2008/10/28/visual-studio-2010-ctp-released.aspx). That's a pity!





Thankfully, [Boost](http://www.boost.org/) provides portable [emulation](https://svn.boost.org/trac/boost/browser/trunk/boost/detail/scoped_enum_emulation.hpp) of scoped enums. It is compatible with compilers that already support this feature like [GCC 4.4.0](http://gcc.gnu.org/gcc-4.4/changes.html) (thought it's still [buggy](http://gcc.gnu.org/bugzilla/show_bug.cgi?id=38064)). Nothing is perfect :-)
