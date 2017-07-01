---
date: 2008-01-29 03:55:28
slug: std-basic_istream-fixed-in-vc9
title: std::basic_istream fixed in VC++ 9.0
categories: [ "code" ]
---

[Stephan T. Lavavej](http://nuwen.net/stl.html) from the [Visual C++ Libraries Development Team](http://blogs.msdn.com/vcblog/default.aspx) [confirmed](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=323765) that the bug I've [reported](/2008/01/23/a-bug-in-stdbasic_istream-from-visual-c) recently about incorrect cast in the input operator implemented in the  _std::basic_istream_ class has been fixed. New corrected implementation is available in the [C++ Standard Library](http://en.wikipedia.org/wiki/C%2B%2B_standard_library) shipped with latest version of the Visual C++ 9.0 compiler from the [Visual Studio 2008](http://msdn2.microsoft.com/en-us/vstudio/default.aspx).
