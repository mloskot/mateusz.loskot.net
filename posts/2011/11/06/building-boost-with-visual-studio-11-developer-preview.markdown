---
title: Building Boost with Visual Studio 11 Developer Preview
date: 2011-11-06 21:39:11
category: code
layout: post
comments: true
slug: building-boost-with-visual-studio-11-developer-preview
wordpressid: 2254
categories: programming
tags: boost,build,c++,Henning,ide,linux,microsoft,programming,project,visual c++,visual studio,visual studio 11,windows
---

Yesterday, I installed [Visual Studio 11 Developer Preview](http://www.microsoft.com/visualstudio/en-us/visual-studio-11). The new release is available for free and is usable for free until June 2012, so it's a great opportunity to try and learn what Microsoft has to offer for C++ programmers. And, it looks [it offers a lot](http://msdn.microsoft.com/en-us/library/hh409293%28v=vs.110%29.aspx), including [SCARY](http://www.open-std.org/jtc1/sc22/WG21/docs/papers/2009/n2980.pdf) features.


The first test I usually do when it comes to test a new C++ toolset is to build [Boost C++ Libraries](http://www.boost.org/) using mainstream development [sources](https://svn.boost.org/svn/boost/trunk/).


The Boost simply builds well. I have even configured build of [Boost.Python](http://www.boost.org/doc/libs/release/libs/python/doc/index.html) using [Python](http://www.python.org) version 3.2.


There are no hacks required to make the build happen. Simply, follow [Boost Getting Started on Windows](http://www.boost.org/doc/libs/release/more/getting_started/windows.html), section _5.3. Or, Build Binaries From Source_. Once the Boost.Build tools bootstrapped, I issued the following command:

    
```
b2 --toolset=msvc variant=debug runtime-link=shared threading=multi define=_CRT_NONSTDC_NO_DEPRECATE define=_CRT_SECURE_NO_DEPRECATE define=_SCL_SECURE_NO_DEPRECATE stage
```


Fifteen minutes later, the Boost build was ready and staged.


By the way, some time ago Christian Henning posted a quick [cheat sheet of bjam commands for Visual Studio](http://cppsnippets.wordpress.com/2010/07/17/building-the-boost-libraries/). It's very handy.
