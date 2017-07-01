---
date: 2009-11-15 20:18:30
slug: traits-of-void-resolved
title: Traits of void resolved
categories: [ "code" ]
---

It looks like I've got clarified status of the [traits of void](/?p=1519) type. I [posted my question to libstdc++](http://gcc.gnu.org/ml/libstdc++/2009-11/msg00041.html) where [Paolo Carlini](http://blogs.oracle.com/pcarlini/) kindly [provided me what the bits](http://gcc.gnu.org/ml/libstdc++/2009-11/msg00042.html) I have been [missing](http://groups.google.com/group/comp.std.c++/browse_thread/thread/01381d52adc619d6/). Now, all the puzzles are in place:





> [n1836], the specifications for the [TR1](http://en.wikipedia.org/wiki/C%2B%2B_Technical_Report_1) features mandates true for is_pod<void>, etc. Arguably this is a defect, which has been fixed in the ongoing work for the next standard, so-called [C++0x](http://en.wikipedia.org/wiki/C%2B%2B0x).





The TR1 document in section 4.9 states:




> 8 It is unspecified under what circumstances, if any, is_pod::value evaluates to true, except that, for all types T:




    <span class="n">is_pod</span><span class="o"><</span><span class="n">T</span><span class="o">>::</span><span class="n">value</span> <span class="o">>=</span>
       <span class="p">(</span><span class="n">is_scalar</span><span class="o"><</span><span class="n">T</span><span class="o">>::</span><span class="n">value</span> <span class="o">||</span> <span class="n">is_void</span><span class="o"><</span><span class="n">T</span><span class="o">>::</span><span class="n">value</span><span class="p">);</span>





Given that, the bug report [ID:458570](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=458570#details) I submitted to [Visual C++ 9.0 and it's TR1](http://channel9.msdn.com/shows/Going+Deep/Stephan-T-Lavavej-Digging-into-C-Technical-Report-1-TR1/) implementation on Microsoft Connect stays valid and according to what [Stephan T. Lavavej](http://nuwen.net/stl.html) confirmed in comments to my report, it's been fixed in Visual C++ 10.0.





Paolo also added a note particularly important to programmers relying on [C++](http://www.open-std.org/jtc1/sc22/wg21/) [implementation](http://gcc.gnu.org/onlinedocs/gcc/C_002b_002b-Implementation.html) by [GCC](http://gcc.gnu.org/) compiler and [libstdc++](http://gcc.gnu.org/libstdc++/) library:





> In general, we consider TR1 essentially frozen at this time and minimally maintained, consider that it was just an interim Technical Report





Here are references that are fundamental for the matter:






  * [n1836](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2005/n1836.pdf) - Draft Technical Report on C++ Library Extensions


  * [n2960](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2009/n2960.pdf) - Working Draft, Standard for Programming Language C++


  * Implementation of [is_pod<T>](http://www.boost.org/doc/libs/1_40_0/libs/type_traits/doc/html/boost_typetraits/reference/is_pod.html) and the rest of type traits by [Boost.TypeTraits](http://www.boost.org/doc/libs/1_40_0/libs/type_traits/doc/html/index.html) library.





Mission accomplished ;-)
