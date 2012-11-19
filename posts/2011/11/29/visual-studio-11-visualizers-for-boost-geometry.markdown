---
title: Visual Studio 11 visualizers for Boost.Geometry
date: 2011-11-29 01:12:23
category: code
comments: true
layout: post
slug: visual-studio-11-visualizers-for-boost-geometry
wordpressid: 2816
categories: programming
tags: Barend Gehrels,boost,boost.geometry,debugger,ide,programming,visual studio,visual studio 11,visualizer
---

Some time ago [Barend Gehrels](http://barendgehrels.blogspot.com/) blogged about [Visual Studio 2010 debugger visualizers for Boost.Geometry](http://barendgehrels.blogspot.com/2011/05/debugger-visualizers.html). Barend's templates added to `autoexp.dat` file are of great help while working with the [Boost.Geometry](www.boost.org/doc/libs/release/libs/geometry/doc/html/index.html) library in Visual Studio.


Recently, I've started using [Visual Studio 11 Developer Preview](http://www.microsoft.com/download/en/details.aspx?id=27538) and discovered the [new style debugger visualizers](/?p=2289) this new edition introduces. I decided to port Barend's work to the new XML-based format in `.natvis` files.


[![vs11-visualizers-boost-geometry](http://farm8.staticflickr.com/7172/6421696735_8c7107bc3c_z.jpg)](http://www.flickr.com/photos/mloskot/6421696735/)


All my visualizers, not only for Boost.Geometry but also for other libraries, are available in [visualstudio11](https://github.com/mloskot/visualstudio11) Git repository on my [GitHub](https://github.com/mloskot/). The `.natvis` files are not overly complicated and the installation is dead easy, see README file attached.


Comments, suggestions and fixes are welcome.
