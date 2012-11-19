---
title: Formal Review of IO and Toolbox extensions to Boost.GIL starts TOMORROW
date: 2010-11-30 19:12:43
category: code
layout: post
comments: true
slug: formal-review-of-io-and-toolbox-extensions-to-boost-gil-starts-tomorrow
wordpressid: 2117
categories: programming
tags: adobe,boost,boost.gil,christian henning,colour,extension,gil,image,programming,project,raster,rgb,rgba,toolbox
---

I am honoured to act as a [Boost](http://boost.org) Review Manager for the proposed **Boost.GIL.IO** and **Boost.GIL.Toolbox** extensions. Today, I [announced the review](http://thread.gmane.org/gmane.comp.lib.boost.devel/211255) starting **tomorrow**:


According to the [Boost Formal Review Schedule](http://www.boost.org/community/review_schedule.html), review of Christian Henning's extensions to the [Boost Generic Image Library](http://www.boost.org/doc/libs/release/libs/gil/doc/index.html) (Boost.GIL), it is:

* **Boost.GIL.IO**
* **Boost.GIL.Toolbox**

starts on December 1st and lasts until December 10th, 2010.


### What is it?


The **Boost.GIL.IO** extension provides an easy to use interface for reading and writing various image formats. It also includes a framework for adding new formats. The **Boost.GIL.IO** is indent to replace the current IO extension which is part of Boost for several years now.

* A unified way to read and write image encoded in BMP, JPEG, PNG, PNM and TIFF formats. The capabilities to read and write in various formats have improved dramatically.
* Image data can be provided via standard file or string streams.

The **Boost.GIL.Toolbox** provides new color spaces and other small code to ease programming with Boost.GIL.

* Implementation of color spaces: Gray_Alpha, HSL, HSV, LAB, and XYZ.
* Utilities to support dynamic image workflows and color conversions.
* Collection of metafunctions to determine alignment, similarity and homogeneity at pixel level.


The Boost.GIL as well as the proposed extensions are provided in form of a headers-only library Although, some image formats come with their format dependency, it is corresponding third-party libraries:

* JPEG - [libjpeg](http://www.ijg.org/)
* PNG  - [libpng](http://www.libpng.org/pub/png/libpng.html)
* TIFF - [libtiff](http://www.remotesensing.org/libtiff/)


### Getting the library


The latest version of both extensions can be downloaded as [boost_review.zip](http://gil-contributions.googlecode.com/files/boost_review.zip) package or directly from the [Subversion repository](http://code.google.com/p/gil-contributions/source/browse/trunk/gil_2/). The docs can built as usual with bjam and quickbook tools from within `libs/gil/io_new/doc` directory. The `libs/gil/io_new/test/readme.txt` provides a step by step guide to configuring, building and running the unit tests. (By the way, [here](/?p=2113) are some more details on how we've managed to get the Boost.GIL tests building with [Boost.Build](http://www.boost.org/doc/tools/build/index.html) and [Boost.Build extensions](http://svn.boost.org/svn/boost/sandbox/tools/build_extensions/)


The boost_review.zip is about 20MB due to its extensive collection of test images. They are part of the test suite to make sure that different variations of each image format is read and written correctly. Please, be aware no guarantee can be given that all formats in their all variants are completely supported.


### Writing a review


If you feel the new **IO** and **Toolbox** are interesting extensions to the Boost.GIL library, then please submit your review to the developer list (preferably), or to the [review manager](/contact).


Here are some questions you might want to answer in your review:

* What is your evaluation of the design?
* What is your evaluation of the implementation?
* What is your evaluation of the documentation?
* What is your evaluation of the potential usefulness of the extensions?
* Did you try to use the extensions? With what compiler? Did you have any problems?
* How much effort did you put into your evaluation? A glance? A quick reading? In-depth study?
* Are you knowledgeable about the problem domain?


And finally, every review should answer this question:

* Do you think the extensions should be accepted as a part of Boost.GIL library?


Be sure to say this explicitly so that your other comments don't obscure your overall opinion.
