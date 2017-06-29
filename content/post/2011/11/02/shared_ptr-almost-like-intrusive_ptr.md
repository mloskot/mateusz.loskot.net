---
title: shared_ptr almost like intrusive_ptr
date: 2011-11-02 00:55:51

slug: shared_ptr-almost-like-intrusive_ptr
categories: [ "code" ]
---

The current [C++11](http://en.wikipedia.org/wiki/C%2B%2B11) Standard consists of a very important remark in section _20.9.11.2.6_. It is about creation of `shared_ptr` object. The remarks state:


> Implementations are encouraged, but not required, to perform no more than one memory allocation.
> (Note: this provides efficiency equivalent to an intrusive smart pointer. end note)


At work [1], I use [Visual C++ 2010+](http://en.wikipedia.org/wiki/Visual_C%2B%2B) implementation of C++. I couldn't resist myself to check if the standard managed to encourage [Stephan T. Lavavej (STL)](http://channel9.msdn.com/Tags/stephan-t-lavavej) and his team at [Microsoft](http://www.microsoft.com/) to go for this optimisation.

I compiled and run a quick test:

```  
#include <memory>
int main()
{
    std::shared_ptr<int> p0(new int(3)); // #1
    
    std::shared_ptr<int> p1 = std::make_shared<int>(3); // #2
}
```

Quick check using breakpoints confirmed that Visual C++ 2010 indeed optimises construction of the `shared_ptr`. The difference between **#1** and **#2** is an important one: the second version causes 50% less memory allocations than the first one. Namely, one allocation. `std::make_shared` packs bookkeeping data and the user-defined data into a single block of memory.

Know your tools or suffer fragmented.

GCC At Home
-----------

I couldn't leave a blog post alone without some kind of unrelated off-topic and pointless digression. So, here is one: [Stephan T. Lavavej](http://nuwen.net/) on his homepage provides custom-built distribution of [MinGW](http://nuwen.net/mingw.html) toolset with [What MinGW Is](http://nuwen.net/mingw.html#about) section starting as follows:


> I recommend that anyone who is learning Standard C++ and who uses Windows for a primary development environment should use two compilers: the most modern version of Microsoft Visual C++ (currently [2010 SP1](http://blogs.msdn.com/b/vcblog/archive/2011/03/10/10139062.aspx)) and the most modern version of[ GCC, the GNU Compiler Collection](http://gcc.gnu.org).

Stephan works at [Microsoft](http://www.microsoft.com/). I admire this kind of professionalism free from strategically competitive marketing b******t. GCC should definitely be included in the list of [New Seven Wonders of the World](http://en.wikipedia.org/wiki/New_Seven_Wonders_of_the_World). Recently, a new wonder has emerged: [LLVM](http://en.wikipedia.org/wiki/Low_Level_Virtual_Machine)/[Clang](http://en.wikipedia.org/wiki/Clang). I'm a user of all the three compilers (and related toolsets). It is easy for me to dream about <del>Visual C++</del>Visual Studio IDE based on LLVM/Clang as C++ compiler and shipped with C/C++ standard libraries provided by GCC. That would be a real [C++ Renaissance](http://mariusbancila.ro/blog/2011/06/20/cpp-renaissance-at-microsoft/)
