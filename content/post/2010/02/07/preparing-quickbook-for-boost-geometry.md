---
title: Preparing Quickbook for Boost.Geometry
date: 2010-02-07 20:33:24
category: code
slug: preparing-quickbook-for-boost-geometry
categories: open source,programming
---

[![Generic Geometry Library (GGL)](/images/logos/ggl-logo.png)](http://trac.osgeo.org/ggl/)I've just [started](http://lists.osgeo.org/pipermail/ggl/2010-February/000592.html) writing [Boost.Geometry](http://thread.gmane.org/gmane.comp.lib.boost.devel/197108) (aka [GGL](http://trac.osgeo.org/ggl/)) documentation in [Quickbook](http://www.boost.org/doc/tools/quickbook/index.html). It is a lightweight format and parser being developed by Boost used to prepare technical documentation for software, mainly for for [Boost C++ Libraries](http://www.boost.org). Quickbook files ([.qbk](http://www.boost.org/doc/libs/1_42_0/tools/quickbook/doc/quickbook.qbk)) are used as input for [BoostDoc](http://www.boost.org/doc/html/boostbook.html) which in turn is an extension of [DocBook](http://www.docbook.org/).


Quickbook is a textual format, it feels quite similar to [AsciiDoc](http://en.wikipedia.org/wiki/AsciiDoc) or some sort of [Wiki](http://en.wikipedia.org/wiki/Wiki) dialect but dedicated for documenting C++ programming. It is extremely easy to grasp while drinking a single short coffee.


Anyway, it seems it is going to be a quite a book after all elements of Boost.Geometry are documented. One of the challenge I've found is to collect all bits necessary to document [C++ concepts](http://www.devx.com/SpecialReports/Article/38864) defined by Boost.Geometry. Unfortunately, [Doxygen](http://www.doxygen.org) is not an ideal tool for this purpose, so [current version](http://geometrylibrary.geodan.nl/) of the documentation lacks of some sections of concepts description. So, I have to dig the source code to find out formal definitions and details of valid expressions and semantics.


Another challenge related to concepts is to find best way to structure their documentation. I started to browse documentation of existing Boost libraries looking for examples and what I found is that there is no best example. Various libraries document concepts in very different way.


> A concept is a set of requirements consisting of valid expressions, associated types, invariants, and complexity guarantees

-- [David Abrahams](http://en.wikipedia.org/wiki/David_Abrahams_%28computer_programmer%29), [Generic Programming Techniques](http://www.boost.org/community/generic_programming.html)


For example, neatly [Boost.Fusion](http://www.boost.org/doc/libs/1_42_0/libs/fusion/doc/html/fusion/iterator/concepts/forward_iterator.html) documents concepts with Quickbook, though some elements seem to be omitted. [Boost.Graph](http://www.boost.org/doc/libs/1_42_0/libs/graph/doc/IncidenceGraph.html) doesn't document with Quickbook, looks good, but some details are missing to me, for instance, titles in headers of tables saying what is what is return type and pre-/post-condition for valid expressions, etc. Documentation of [Boost.IOStreams](http://www.boost.org/doc/libs/1_42_0/libs/iostreams/doc/concepts/source.html) concepts sound well. On the other hand, [Boost.GIL](http://www.boost.org/doc/libs/1_42_0/libs/gil/doc/html/g_i_l_0212.html) is an _example of why Doxygen should not be used_ to document concepts of a C++ library.


It looks to me the old good [Standard Template Library Programmer's Guide](http://www.sgi.com/tech/stl/) at SGI is still a _best and most complete example_ of how [C++ concepts](http://www2.research.att.com/~bs/C++0xFAQ.html#std-thread) should be documented.


Given these experiences, I started to think of a way to improve the way concepts are documented within Boost. I believe it would be a good idea to have predefined block for concept in Quickbook. Something along these lines:


```
[concepttype [Point Concept]
  [this is a concept for 0-dimensional geometry]
  [notation
    [term 1] [description 1]
  ]
  [refinement [concept 1] [concept 2]]
  [associated
    [type 1] [description 1]
  ]
  [expressions
    [name 1 [expr 1]
      [type requirement 1] [return type 1]
  ]
  [semantics
    [name 1 [expr 1]
      [precondition 1] [semantic 1] [postcondition 1]
  ]
  [complexity [...]]
  [invariants
    [invariant 1] [description 1]
  ]
  [models [model 1] [model 2]]
  [notes
    [ note 1] [ note 1]
  ]
  [seealso ...]
]
```


I [posted](http://lists.boost.org/MailArchives/boost-docs/2010/02/3976.php) my proposal to boost-docs list explaining the motivation in details. It's an interesting experience of a C++ documentation craftsman, anyway. (BTW, Daniel James just [announced](http://lists.boost.org/MailArchives/boost-docs/2010/02/3974.php) Quickbook port to [Spirit 2](http://boost-spirit.com/).)
