---
date: 2009-08-07 00:55:54
slug: portability-poem
title: Portability poem
categories: [ "code" ]
---

![Meaning of Portability](/images/portability-toytoy.jpg)Number of [OSGeo](http://osgeo.org) stack software written by C/C++ camp[ have to run on Microsoft Windows systems](http://lists.osgeo.org/pipermail/discuss/2009-August/005644.html). I think I wouldn't be dead wrong if said that most of hackers from [OSGeo Community](http://wiki.osgeo.org/wiki/Category:OSGeo_Member) work on [Unix](http://xkcd.com/) systems ([Linux](http://en.wikipedia.org/wiki/Linux), [Mac OS X](http://en.wikipedia.org/wiki/Mac_OS_X))  but there is large number of users who work on Windows.

Conclusion? Portability. [Google](/?p=758) is bursting at the seams of the [essays](http://www.cuil.com/search?q=c+c%2B%2B+portability) about how to write portable code in C or C++ language. [I'd add a little poem](http://lists.osgeo.org/pipermail/discuss/2009-August/005646.html) to the collection.


## Principles of Portability

  * Obey the [standards](http://en.wikipedia.org/wiki/ISO/IEC_14882), because they are not just dumb rules.
  * Make a list of [compilers](http://en.wikipedia.org/wiki/List_of_compilers#C.2FC.2B.2B_compilers) that must be supported. Learn about their differences.
  * If possible, use [GCC 4+](http://gcc.gnu.org/) and [Visual C++ 7.1+](http://en.wikipedia.org/wiki/Visual_C%2B%2B).
  * Using old compilers? If possible, use [C89](http://en.wikipedia.org/wiki/C89_(C_version)#ANSI_C_and_ISO_C) but avoid [C99](http://en.wikipedia.org/wiki/C99).
  * Prefer [GCC 4.3](http://gcc.gnu.org/gcc-4.3/changes.html) and [Visual C++ 8.0+](http://msdn.microsoft.com/en-us/library/bb531344.aspx?ppud=4), so you get [C++0x](http://en.wikipedia.org/wiki/C%2B%2B0x) support. [C++0x](http://en.wikipedia.org/wiki/C%2B%2B_Technical_Report_1) "brings C++ more in line with the C99" - Wikipedia, so portability is much easier.
  * Write code in C or in C++, but do not write both at the same time.
  * Avoid (direct) use of [C POSIX Library](http://en.wikipedia.org/wiki/C_POSIX_library).
  * Never ever disable any [warnings](http://np237.livejournal.com/22270.html) compiler throw. Fix them.
  * Be pedantic. Compile in highest [strict mode possible](http://peter.hates-software.com/2004/08/20/6550cefa.html).
  * If possible, do not use compiler-specific features.
  * Do not make platform/architecture specific assumptions about memory addressing, memory layout, etc.
  * [First understand why, then cast the hack](http://www.cellperformance.com/mike_acton/2006/06/understanding_strict_aliasing.html).
  * Personal preferences are evil. Make decisions based on reasoning.
  * (Re)Use good code that already exist. [Boost C++ Libraries](http://www.boost.org/) **won't** bite you!
  * KIMS (Keep it modular, stupid) and let modules to [loose coupling](http://en.wikipedia.org/wiki/Loose_coupling) but [keep cohesion](http://en.wikipedia.org/wiki/Cohesion_(computer_science)) in architecture, design as well as in development cycle (releases, inter-modular dependencies).
