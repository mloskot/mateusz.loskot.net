---
comments: true
date: 2009-10-25 14:06:02
layout: post
slug: como-adventures-with-boost-cstdint-hpp
title: como adventures with boost/cstdint.hpp
wordpressid: 1408
categories: programming
tags: boost,boost.geometry,c++,comeau,como,compiler,cstdint,generic geometry library,geometry,library,project
---

While compiling a program that uses [boost/cstdint.hpp](http://www.boost.org/doc/libs/release/libs/integer/cstdint.htm) from [Boost Integer Library](http://www.boost.org/doc/libs/release/libs/integer/index.html):




    
    <span class="cp">#include <iostream></span>
    <span class="cp">#include <boost/cstdint.hpp></span>
    <span class="kt">int</span> <span class="n">main</span><span class="p">()</span>
    <span class="p">{</span>
        <span class="n">boost</span><span class="o">::</span><span class="n">int64_t</span> <span class="n">i64</span> <span class="o">=</span> <span class="o">-</span><span class="mi">2</span><span class="p">;</span>
        <span class="n">boost</span><span class="o">::</span><span class="n">uint64_t</span> <span class="n">ui64</span> <span class="o">=</span> <span class="mi">2</span><span class="p">;</span>
        <span class="n">boost</span><span class="o">::</span><span class="n">uint64_t</span> <span class="n">d</span> <span class="o">=</span> <span class="n">ui64</span> <span class="o">-</span> <span class="n">i64</span><span class="p">;</span>
        <span class="n">std</span><span class="o">::</span><span class="n">cout</span> <span class="o"><<</span> <span class="n">d</span> <span class="o"><<</span> <span class="n">std</span><span class="o">::</span><span class="n">endl</span><span class="p">;</span>
        <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
    <span class="p">}</span>
    





front-end of [Comeau](http://www.comeaucomputing.com/) [C/C++ 4.3.10.1](http://www.comeaucomputing.com/4.3.0/minor/linux/) compiler complains:




    
    <code>boost/cstdint.hpp", line 111: error: the
              global scope has no "int64_t"
        using ::int64_t;            
                ^
    </code>





However, if I reorder include directives:




    
    <span class="cp">#include <boost/cstdint.hpp></span>
    <span class="cp">#include <iostream></span>





then the program compiles well.





I believe that the order of header files should not be relevant here, but seems it is. I've submitted a [ticket #3548](https://svn.boost.org/trac/boost/ticket/3548) to Boost.Integer and I'm curious awaiting the diagnosis.





After this issue is fixed, I'm looking forward building the [Generic Geometry Library](http://trac.osgeo.org/ggl/) using Comeau C/C++ compiler. This should help us to maintain [high quality of standard and yet more portable C++ code](http://en.wikipedia.org/wiki/Comeau_C/C%2B%2B).
