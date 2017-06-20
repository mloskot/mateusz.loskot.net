---
title: Illegal token on right side of
date: 2010-01-27 01:13:39
category: code
slug: illegal-token-on-right-side-of
categories: open source,programming
---

[![libLAS - ASPRS LiDAR data translation toolset](/images/logos/liblas-logo.png)](http://liblas.org/)One of [libLAS](http://liblas.org) users [reported](http://lists.osgeo.org/pipermail/liblas-devel/2010-January/000721.html) that when  use of `#include <liblas/lasreader.hpp>` in his application compiled with [Visual C++ 10.0](http://en.wikipedia.org/wiki/Visual_C%2B%2B) from [Visual Studio 2010](http://www.microsoft.com/visualstudio/en-us/products/2010/default.mspx) cause this error:

    
```
utility.hpp(253): error C2589: '(' : illegal token on right side of '::'
``


The error is an incarnation of a very [well-known problem in Visual C++](http://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=101300) when using the[ C++ Standard Library](http://en.wikipedia.org/wiki/C%2B%2B_standard_library) elements, especially the [Standard Template Library](http://en.wikipedia.org/wiki/Standard_Template_Library), in Windows API-based programs. As [libLAS](http://en.wikipedia.org/wiki/LibLAS) library does use the C++ library, so does a user's application if includes libLAS headers.


The problem is caused by conflicting definitions of `min()` and `max()` macros defined in [windef.h](http://www.cuil.com/search?q=windef.h) header. Macros in C++ are scope-less [evil](http://www.parashift.com/c++-faq-lite/inline-functions.html#faq-9.5), especially if defined in public headers using such _extremely unique names_ as _min_ or _max_. The fact that Microsoft defined it way before C++ was born absolves them at large, but for the Spirit sake, they should learn the lesson and disable it for good in C++ mode (but not [yet another MS-specific way](http://msdn.microsoft.com/en-us/library/aa242643%28VS.60%29.aspx)!). No one who's sane need or want to use them!


Pie in the sky. In the meantime, C++ programmers as the libLAS user who reported this problem have to deal with it on their own. The easiest way is to check [CodeProject](http://www.codeproject.com/) or [Q143208](http://support.microsoft.com/kb/143208) or search (not google) for solution like `#define NOMINMAX` for Visual C++ compiler.


However, is another option is to apply a simple trick to call of `*::min()` or `*::max()` functions (i.e. `std::min()` or `std::max()` which effectively prevents macro substitution, so the Visual C++ compiler (or any other compiler with similar problem) does not complain about _illegal token_. The trick is to wrap function name, fully qualified name, with parentheses:

    
```
(std::min)(x, y);
```


In most cases of use of C++ Standard Library as described above, it is required for the following functions:

    
```
(std::min)(x, y);
(std::max)(x, y);
(std::numeric_limits<T>::min)();
(std::numeric_limits<T>::max)();
```


In case a user-defined type has a member function with exactly the same name as a macro present in global scope (macros always live in global scope!), it may be necessary to apply the very same trick when a member function is called on an object:

    
```
template <typename T, int Size>
struct Series
{
  T min() { return *(std::min_element(s, s + Size); }
  T& operator[](int index) { return s[index]; }
private:
  T s[Size];
};

Series<int, 3> s;
s[0] = 2;
s[1] = 3;
s[2] = 1;

int m = (s.min)(); // long way, but here is the trick
```
    

There is one side effect which may be an inconvenience. This trick disables [argument dependent name lookup](http://en.wikipedia.org/wiki/Argument_dependent_name_lookup) (ADL, aka [Koenig](http://en.wikipedia.org/wiki/Andrew_Koenig_%28programmer%29) lookup).
