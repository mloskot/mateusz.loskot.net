---
comments: true
date: 2009-11-15 02:19:50
layout: post
slug: inconsistent-int64_t-definition-in-gcc
title: Inconsistent int64_t definition in GCC?
wordpressid: 1497
categories: programming
tags: boost,c++,c99,comeau,como,compiler,cstdint,gcc,gnu,int64_t,linux,posix,programming,project,uint64_t
---

While compiling programs on [Linux](http://releases.ubuntu.com/9.04/) 32-bit with[ Comeau C/C++](http://www.comeaucomputing.com/) 4.3.10.1 front-end and [GCC 4.3.3](http://gcc.gnu.org/gcc-4.3/changes.html) I encountered some [problems]( https://svn.boost.org/trac/boost/ticket/3548) using Boost Integer library, namely `boost/cstdint.hpp` header. Here we go:





If I first include `sys/types.h` (added with [POSIX](http://www.unix.org/version3/ieee_std.html)), directly or indirectly, and then include `boost/cstdint.hpp` in C++ program:




    
    <span class="cp">#include <sys/types.h></span>
    <span class="cp">#include <boost/cstdint.hpp></span>
    <span class="kt">int</span> <span class="n">main</span><span class="p">()</span>
    <span class="p">{</span>
        <span class="n">boost</span><span class="o">::</span><span class="n">int64_t</span> <span class="n">a</span><span class="p">(</span><span class="mi">0</span><span class="p">);</span>
    <span class="p">}</span>





then it does not compile:




    
    $ como -I/home/mloskot/dev/boost/_svn/trunk test1.cpp 
    MODE:non-strict warnings C++ noC++0x_extensions
    "/home/mloskot/dev/boost/_svn/trunk/boost/cstdint.hpp", line 111: error: the
              global scope has no "int64_t"
        using ::int64_t;            
                ^
    "bad.cpp", line 5: error: namespace "boost" has no member "int64_t"
          boost::int64_t a(0);
                 ^
    





Then, if `stdint.h` (added with [C99](http://en.wikipedia.org/wiki/C99)) is included first (again, directly or indirectly), then the program compiles without any errors:




    
    <span class="cp">#include <stdint.h></span>
    <span class="cp">#include <boost/cstdint.hpp></span>
    <span class="kt">int</span> <span class="n">main</span><span class="p">()</span>
    <span class="p">{</span>
        <span class="n">boost</span><span class="o">::</span><span class="n">int64_t</span> <span class="n">a</span><span class="p">(</span><span class="mi">0</span><span class="p">);</span>
    <span class="p">}</span>





It turns out that _there is some amount of overlap_ in the `stdint.h` and `sys/types.h` headers. The issue is that the overlapped parts slightly differ. For the architecture, operating system and compilation toolset I use, both headers define `int64_t` type as follows:




    
    <span class="k">typedef</span> <span class="kt">long</span> <span class="kt">long</span> <span class="kt">int</span> <span class="n">int64_t</span><span class="p">;</span>





However, the definition in `sys/types.h` header is guarded with different preprocessor condition testing `__GLIBC_HAVE_LONG_LONG`:




    
    <span class="cp">#  elif __GLIBC_HAVE_LONG_LONG</span>
    <span class="n">__extension__</span> <span class="k">typedef</span> <span class="kt">long</span> <span class="kt">long</span> <span class="kt">int</span> <span class="n">int64_t</span><span class="p">;</span>
    <span class="cp">#  endif</span>





If I change `sys/types.h` replacing the ` clause with simple ``#else`:



    
    <span class="cp">#  else</span>
    <span class="n">__extension__</span> <span class="k">typedef</span> <span class="kt">long</span> <span class="kt">long</span> <span class="kt">int</span> <span class="n">int64_t</span><span class="p">;</span>
    <span class="cp">#  endif</span>

then the first variant of my program, the one including `sys/types.h`, does compile perfectly well.



Now, is this small difference a bug in the GNU C Library?   
I'm going to try to confirm it.
