---
date: 2009-11-15 04:44:57
slug: traits-of-void
title: Traits of void
categories: [ "code" ]
  c++,visual studio
---

Long time ago, I reported bug to [Visual C++ 9.0](http://en.wikipedia.org/wiki/Visual_C%2B%2B) (Visual Studio 2008 SP1) complaining that [has_trivial_destructor applied to void returns true](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=458570) (ID:458570). I also discussed it with folks on [comp.std.c++](http://groups.google.com/group/comp.std.c++/browse_thread/thread/01381d52adc619d6/) where, among quite different voices, [Pete Becker](http://en.wikipedia.org/wiki/Pete_Becker) writes:




> [tr.meta.req]/8 in [TR1](http://en.wikipedia.org/wiki/C%2B%2B_Technical_Report_1) requires is_pod::value to be 1. [n2857](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2009/sd-1.htm) is not a standard, and implementations of previous standards are not wrong for not doing what isn't yet required of them.




and later concludes:




> Under the current standard, using the name std::is_pod requires a diagnostic. So if you want to be literal, both compilers are "wrong". Nevertheless, neither is really "wrong", they just implement different non-standard versions of is_pod. 






So, [Visual C++](http://blogs.msdn.com/vcblog/) might actually not be wrong. Fair enough.





Today, I got back to this issue for a while a little extending my test program to use the [type traits](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2003/n1424.htm) from both, TR1 and [C++0x](http://en.wikipedia.org/wiki/C%2B%2B0x):




    
    <span class="cp">#include <iostream></span>
    <span class="cp">#include <tr1/type_traits></span>
    <span class="kt">int</span> <span class="n">main</span><span class="p">()</span>
    <span class="p">{</span>
    <span class="k">using</span> <span class="n">std</span><span class="o">::</span><span class="n">cout</span><span class="p">;</span> <span class="k">using</span> <span class="n">std</span><span class="o">::</span><span class="n">endl</span><span class="p">;</span>
    <span class="n">cout</span> <span class="o"><<</span> <span class="n">std</span><span class="o">::</span><span class="n">tr1</span><span class="o">::</span><span class="n">is_pod</span><span class="o"><</span><span class="kt">void</span><span class="o">>::</span><span class="n">value</span> <span class="o"><<</span> <span class="n">endl</span><span class="p">;</span>
    <span class="n">cout</span> <span class="o"><<</span> <span class="n">std</span><span class="o">::</span><span class="n">tr1</span><span class="o">::</span><span class="n">has_trivial_destructor</span><span class="o"><</span><span class="kt">void</span><span class="o">>::</span><span class="n">value</span> <span class="o"><<</span> <span class="n">endl</span><span class="p">;</span>
    <span class="n">cout</span> <span class="o"><<</span> <span class="n">std</span><span class="o">::</span><span class="n">is_pod</span><span class="o"><</span><span class="kt">void</span><span class="o">>::</span><span class="n">value</span> <span class="o"><<</span> <span class="n">endl</span><span class="p">;</span>
    <span class="n">cout</span> <span class="o"><<</span> <span class="n">std</span><span class="o">::</span><span class="n">has_trivial_destructor</span><span class="o"><</span><span class="kt">void</span><span class="o">>::</span><span class="n">value</span> <span class="o"><<</span> <span class="n">endl</span><span class="p">;</span>
    <span class="p">}</span>





and compiled it with [GCC 4.4.1](http://gcc.gnu.org/gcc-4.4/changes.html):



    
    $ g++ -Wall -pedantic -std=c++0x void.cpp
    $ ./a.out 
    1
    1
    0
    0





Now, my confusion has been raised to the power of 2. This is clearly a [Polnische Wirtschaft](http://blogs.wsj.com/new-europe/2009/09/15/%E2%80%9Cpolnische-wirtschaft%E2%80%9D/) or [Czech movie](http://www.transparent.com/polish/nobody-knows-anything/) or [Turkish sermon](http://www.lexiophiles.com/english/polish-idioms)...





...let's try to ask [libstdc++](http://gcc.gnu.org/ml/libstdc++/2009-11/msg00041.html) folks.
