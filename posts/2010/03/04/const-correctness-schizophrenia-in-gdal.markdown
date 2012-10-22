---
comments: true
date: 2010-03-04 00:23:59
layout: post
slug: const-correctness-schizophrenia-in-gdal
title: Const-correctness schizophrenia in GDAL
wordpressid: 1951
categories: open source,programming
tags: gdal,ogr,open source,programming,project
---

[Const-correctness](http://en.wikipedia.org/wiki/Const-correctness) rants are quite common topic of chats on [#gdal](irc://irc.freenode.net/#gdal) IRC channel. Some of the pearls I've got printed in to my mind:





> **A**: The lesson is I ought to get things right the first time.
**B**: The issue with `const` method is that if you want to add lazy loading later, it can cause problems
**C**: GDAL is rather painful to use with `const` correct code, unfortunately :(
**B**: The solution is obvious: don't write `const` correct code





Who's right then, A or B?




I recall another motto from #gdal channel that sounds like _"when unsure, do nothing"_ which has the following rationale:




> especially when I realize afterwards that I've f**cked things because I neglected to follow the motto





Remembering these recommendations, it's pretty clear why _the const-mess_ in [GDAL](http://www.gdal.org) has happened. I'd conclude paraphrasing the motto this way:





> I've f**cked things because I neglected to make a decision.





Now, poor [GDAL beginner deadpickle](http://lists.osgeo.org/pipermail/gdal-dev/2010-March/023776.html), trying to find out ([it's me the evil](http://lists.osgeo.org/pipermail/gdal-dev/2010-March/023781.html)) why compiler complains about his not-that-bad-written code, [wandered to find and ask C gurus](http://groups.google.co.uk/group/comp.lang.c/browse_thread/thread/41e53e9bb82de6ec) @ [comp.lang.c](http://groups.google.com/group/comp.lang.c) and got the problem explained by Malcolm who wrote:





> The problem is that, when C was first developed, there was no const keyword. So strings literal, which are constant, had to be non-const for backwards compatibility. This means that lots of programmers get lazy and omit the const, even from functions which don't modify their string arguments. (There are also some subtle problems with const which means that this isn't always a case of pure laziness). So a sort of solution is to discard the const qualifiers. However this is perpetuating the problem in your own code. 





The motto stays in contradiction to a well-known best practice of [const correct sooner than later](http://www.parashift.com/c++-faq-lite/const-correctness.html#faq-18.3). It's way easier and cheaper to remove const-correctness once it turns out it does not express properly the actual design and contract than to apply it to existing codebase. Sometimes, the latter is even not possible making things _f**cked up twice, in existing code base and in client's code_.
