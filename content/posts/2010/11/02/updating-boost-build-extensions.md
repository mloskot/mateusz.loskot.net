---
title: Updating Boost.Build extensions
date: 2010-11-02 02:07:40
category: code
layout: post
comments: true
slug: updating-boost-build-extensions
wordpressid: 2113
categories: programming
tags: bjam,boost,boost.build,boost.gil,build,gil,image,patch,programming,project,raster
---

I've been continuing [my Boost.Build adventures](/?p=2099) leading to preparation for [review](http://www.boost.org/community/reviews.html) of the new [Boost.GIL I/O](http://code.google.com/p/gil-contributions/) framework. Here is a short patch with update I had to applie to Boost.Build extensions scripts for the libraries: [jpeg-8a](http://www.ijg.org/), [libtiff 3.9.4](http://www.remotesensing.org/libtiff/)  and [zlib 1.2.4](http://www.zlib.net/). It is [boost-build_extensions-r66346-update.patch](/download/patches/boost-build_extensions-r66346-update.patch)


This patch allowed me to successfully compile Boost.GIL tests. It's been [posted](http://lists.boost.org/Archives/boost/2010/10/index.php) to the Boost mailing list, so perhaps it will be integrated with boost_extensions in the Boost Sandbox repository.
