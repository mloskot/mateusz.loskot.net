---
comments: true
date: 2009-05-08 00:52:31
layout: post
slug: got-new-toy
title: Got new toy
wordpressid: 528
categories: programming
tags: algorithm,c++,comeau,compilation,compiler,error,example,gcc,language,libcomo,programming,sort,std,stl,template
---

I've just got new <del>toy</del> **tool**. Since yesterday, I'm a happy owner of the most standards-conformant C++ compiler that ever existed - [Comeau C/C++](http://en.wikipedia.org/wiki/Comeau) from [Comeau Computing](http://www.comeaucomputing.com/).





I've successfully installed[ Comeau C/C++](http://www.comeaucomputing.com/tryitout/) 4.3.10.1 Beta compiler and [libcomo36](http://www.comeaucomputing.com/libcomo/36.html), accompanying [Standard C++ Library](http://en.wikipedia.org/wiki/C%2B%2B_standard_library), on 32-bit version of latest [Ubuntu 9.04](http://www.ubuntu.com/getubuntu/releasenotes/904).





I'm going to use Comeau C/C++ for purposes like analysis and review of [C++ source code](http://www.boost.org/) I write or use, verification of code portability as well as for learning elements of C++ and experimenting. This is excellent compiler for learning [C++ language](http://www.open-std.org/jtc1/sc22/wg21/). Among loads of [features](http://www.comeaucomputing.com/43101features.html), one of the coolest is ability to give clear and informative error messages. This is very helpful while working with complex class and function [templates](http://en.wikipedia.org/wiki/Template_metaprogramming).







Let's go through a small sample of compilation errors. This is a short C++ program that seems to be correct or it's easy to overlook where it's buggy:




    
    <code>// numbers.cpp
    #include <algorithm>
    #include <vector>
    
    struct number
    {
        number() : n_(0) {}
        number(int n) : n_(n) {}
        int value() const { return n_; }
    private:
        int n_;
    };
    
    bool operator<(number& lhs, number& rhs)
    {
        return lhs.value() < rhs.value();
    }
    
    int main()
    {
        std::vector<number> n;
        n.push_back(number(3));
        n.push_back(number(2));
        n.push_back(number(1));
    
        std::sort(n.begin(), n.end());
    
        return 0;
    }</code>





First, let's see what [GCC 4.3](http://gcc.gnu.org/gcc-4.3) has to say about this code:




    
    $ g++ -Wall -pedantic numbers.cpp
    /usr/include/c++/4.3/bits/stl_algo.h: In function ?const _Tp& std::__median(const _Tp&, const _Tp&, const _Tp&) [with _Tp = number]?:
    /usr/include/c++/4.3/bits/stl_algo.h:1919:   instantiated from ?void std::__introsort_loop(_RandomAccessIterator, _RandomAccessIterator, _Size) [with _RandomAccessIterator = __gnu_cxx::__normal_iterator<number*, std::vector<number, std::allocator<number> > >, _Size = int]?
    /usr/include/c++/4.3/bits/stl_algo.h:4783:   instantiated from ?void std::sort(_RAIter, _RAIter) [with _RAIter = __gnu_cxx::__normal_iterator<number*, std::vector<number, std::allocator<number> > >]?
    numbers.cpp:30:   instantiated from here
    /usr/include/c++/4.3/bits/stl_algo.h:93: error: no match for ?operator<? in ?__a < __b?
    numbers.cpp:12: note: candidates are: bool operator<(number&, number&)





The GCC is able to tell that there is something wrong with the `operator<` function and application of `std::sort` algorithm, but it doesn't tell what exactly is wrong.





Now, let's check the code with Comeau C/C++:



    
    $ como numbers.cpp
    "/opt/libcomo36/include/stl_algo.h", line 120: error: no operator "<" matches these operands
                operand types are: const number < const number
       if (__a < __b)
               ^
    detected during:
       instantiation of "const _Tp &std::__median(const _Tp &, const _Tp &, const _Tp &) [with _Tp=number]" at line 1508
       instantiation of "void std::__introsort_loop(_RandomAccessIter,
                          _RandomAccessIter, _Tp *, _Size) [with
                          _RandomAccessIter=number *, _Tp=number, _Size=int]" at
                          line 1545





This time, compiler also complains there is no match for `operator<`, however, it also explains why well-matched operator can not be found: `std::sort` algorithm passes `const` qualified operands to `operator<`.





This should be enough information to fix the `operator<` signature to read:




    
    <code>bool operator<(number const& lhs, number const& rhs)</code>





Comeau C/C++. [The choice is clear](http://www.youtube.com/watch?v=WgAYNKlEaG4). _(0:28 sec)_
