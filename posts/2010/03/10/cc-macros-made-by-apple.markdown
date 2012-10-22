---
comments: true
date: 2010-03-10 01:48:39
layout: post
slug: cc-macros-made-by-apple
title: Boost.Geometry and macros made by Apple
wordpressid: 1984
categories: open source,programming
tags: apple,boost,boost.geometry,gcc,geometry,macosx,macros,programming,project,xcode
---

[![Boost Geometry (aka Generic Geometry Library, GGL)](/images/logos/ggl-logo.png)](http://trac.osgeo.org/ggl/)I have no pleasure continuing my [macros are evil tales](/&p=1755) but the life of C++ programmer eagerly wants to writes add another chapter to the story. Today, it's time to rant on [Apple](http://www.apple.com) and its [XCode](http://en.wikipedia.org/wiki/XCode).





One of [Boost Geometry](http://trac.osgeo.org/ggl/) (aka GGL) users, Mark, [reported](http://lists.osgeo.org/pipermail/ggl/2010-March/000649.html) that he can not compile his program using the library with GNU C++ compiler from XCode. The compiler throws mysterious complain of a very low-level nature of C++ programming language:




    
    Expected unqualified-id before 'do' in
    /usr/local/include/boost_1_42_0/boost/geometry/geometries/concepts/check.hpp





Thanks to [follow-up by Stjepan](http://lists.osgeo.org/pipermail/ggl/2010-March/000653.html) we quickly know who to blame for that. It is XCode header `AssertMacros.h`. It even might be [one of public headers](http://www.opensource.apple.com/source/xnu/) from development package of [XNU](http://en.wikipedia.org/wiki/XNU), the Mac OS X kernel, what's even more fun.





### What actually happens that causes the problem?





Boost Geometry defines function template for concept checking:




    
    <code>template <typename Geometry>
    inline void check()
    {
        detail::checker<Geometry, boost::is_const<Geometry>::type::value> c;
        boost::ignore_unused_variable_warning(c);
    }</code>





Apple XCode defines macro using exactly the same name as the function `check`. The C++ preprocessor, which operates before compiler, substitutes the name `check` with content of the macro. For the Boost Geometry function `check` it means that a pile of garbage is injected in place were the function name is expected:




    
    <code>template <typename Geometry>
    inline void do { if ( __builtin_expect(!(), 0) ) { DebugAssert('?*?*',  
    0, "Third Party Client" ": " "", 0, 0, "/usr/local/include/boost/ 
    geometry/geometries/concepts/check.hpp", 181, (void*)0); } } while ( 0 )
    {
         detail::checker<geometry , boost::is_const<Geometry>::type::value> c;
         boost::ignore_unused_variable_warning(c);
    }</code>





Obviously, it makes compiler to give up to instantiate the `check` function from the template and to compile it properly.





C/C++ macros are evil, however, not by design but by insanity of programmers. Every macro defined in a public C/C++ header, should be defined using _as unique as possible, but still usable_ name. I wish Apple folks designed their C/C++ macros as unique as they make their hardware products, even if [made in China](http://en.wikipedia.org/wiki/Made_in_China#Marketing_significance) eventually. This particular macro that caused the problems discussed here, could be named to `APPLE_XNU_CHECK` and life would be easier. Or, given the fact that [almost 3000 files using these identifiers](https://svn.boost.org/trac/boost/ticket/2115#comment:7) live in [Boost C++ Libraries](http://www.boost.org) only, I probably should say: life would be more productive, efficient and cheaper.





By the way, it's a known problem @ Boost and it looks Boost Folks are trying to figure out best solution. See ticket [#2115 - Avoid bad Apple macros](https://svn.boost.org/trac/boost/ticket/2115).





...to be continued
