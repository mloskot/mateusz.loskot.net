---
comments: true
date: 2009-04-26 20:58:31
layout: post
slug: bjam-output-in-colours
title: bjam output in colours
wordpressid: 465
categories: programming
tags: bjam,boost,boost.geometry,build,colorgcc,colormake,compilation,gcc,geometry,linux,project
---

Recently, I've been heavily using [Boost Build](http://www.boost.org/doc/tools/build/index.html) and [bjam](http://www.boost.org/doc/tools/build/doc/html/jam/usage.html) utility for building [GGL](http://mateusz.loskot.net/?p=399) library tests on Linux, so I developed a small tool that makes it easier to visually recognize compilation output by printing bjam messages in colours.





The script is called [colorbb](http://github.com/mloskot/workshop/tree/master/scripts/colorbb/) and was inspired by [colormake](http://bre.klaki.net/programs/colormake/) written by [Bjarni R. Einarsson](http://bre.klaki.net/). Actually, I grabbed Bjarni's two scripts written in Perl and Shell and adopted it to parse [bjam](http://www.cuil.com/search?q=bjam) output.





[![colorbb-ggl-build](http://farm4.static.flickr.com/3303/3476777817_12d0a53442_m.jpg)](http://www.flickr.com/photos/mloskot/3476777817/)





[colorbb](http://github.com/mloskot/workshop/tree/master/scripts/colorbb/) is a very simple utility and it likely needs to be improved to properly recognize all bjam messages. It's available from my <del>SVN repository at [http://svn.devjavu.com/mloskot/scripts/colorbb/](http://svn.devjavu.com/mloskot/scripts/colorbb/)</del> personal Git repository at [http://github.com/mloskot/](http://github.com/mloskot/workshop/tree/master/scripts/colorbb/).
