---
date: 2009-05-24 17:37:34
slug: size-of-enumeration-type-in-c
title: Size of enumeration type in C++
categories: open source,programming
---

In [C++](http://en.wikipedia.org/wiki/C%2B%2B) [enumeration](http://www.research.att.com/~bs/glossary.html#Genumeration) is used to define set of named constants. Each enumeration is a _distinct compound type_ ([enumerated type](http://en.wikipedia.org/wiki/Enumerated_type)) and is subject to all rules of type system defined in C++ language. Internally, enumeration is represented with so called _underlying type_. The [C++ Standard](http://www.research.att.com/~bs/C++.html#standard) [ISO/IEC 14882:2003](http://www.open-std.org/jtc1/sc22/wg21/) (Section 7.1/5) specifies it as follows:





> The underlying type of an enumeration is an integral type that can represent all the enumerator values defined in the enumeration.





It is not specified which particular integral type is used to represent an enumerated type. Given that number of bytes representing fundamental integral types is [implementation defined](http://www.research.att.com/~bs/glossary.html#Gimplementation-defined) in C++ and only `sizeof(char)`, `sizeof(signed char)` and `sizeof(unsigned char)` are guaranteed to be always **1**, value reported by [sizeof](http://en.wikipedia.org/wiki/Sizeof) operator applied on enumeration is considered as [implementation defined](http://www.research.att.com/~bs/bs_faq2.html#undefined) as well. Sometimes one may need to control size of enumerated type in memory, for instance to serialise and de-serialise objects easier.





Some compilers allow to specify underlying type of enumeration. For instance, [Microsoft Visual C++](http://msdn.microsoft.com/en-gb/visualc/default.aspx) provides dedicated [language extension](http://mateusz.loskot.net/?p=602&preview=true):




    
    <code>enum Color : unsigned char
    {
       red, green, blue
    };
    // assert(sizeof(Color) == 1);
    </code>





Obviously, this technique is not portable across other implementations of  C++ language.





In order to solve this problem in portable way, a simple [class template](http://en.wikipedia.org/wiki/Template_(programming)) can be defined:




    
    <code>template <class E, class T>
    struct enumeration
    {
        typedef T type;
        typedef E enum_type;
    
        enumeration()
            : e_(E())
        {}
    
        enumeration(E e)
            : e_(static_cast<T>(e))
        {}
    
        operator E() const
        { return static_cast<E>(e_); }
    
    private:
        T e_;
    };</code>





The `enumeration` class can be used as a portable way to wrap any enumerated type and to specify (or limit) amount of bytes used to represent it. It is also interchangeable with actual enumeration being wrapped:




    
    <code>#include <cassert>
    
    enum Color { red, green, blue };
    
    int main()
    {
        enumeration<Color, unsigned char> color(blue);
        assert(sizeof(color) == 1);
    
        Color c = color;
        assert(c == blue);
    }</code>





It's also possible to provide default argument for template parameter `T` specifying underlying type of wrapped enumeration. For instance, if most constant values in a project range from 0 to 255, default type value of T can be `unsigned char`.
