---
comments: true
date: 2009-05-09 01:51:31
layout: post
slug: hi-com-hows-it-going
title: Hi COM! How's it going?
description: On future of COM technology
wordpressid: 563
category: code
tags: dotnet,com,framework,ide,microsoft,pdc,visualc,visualstudio,windows
---

In June 2000 at [PDC](http://en.wikipedia.org/wiki/Professional_Developers_Conference) in Orlando [Microsoft announced](http://www.microsoft.com/presspass/press/2000/Jul00/PDCDeliversPR.mspx) [.NET Framework](http://en.wikipedia.org/wiki/Microsoft_.NET#Microsoft_.NET) project. Shortly after that developers concentrated around products and technologies made by Microsoft started debate on what's the future of software development. One of questions and quite obvious was: **So does this mean that COM is dead?**. A few months later, [Don Box](http://en.wikipedia.org/wiki/Don_Box) addressed that concern in his extensive article [Is COM Dead?](http://msdn.microsoft.com/en-us/magazine/cc301471.aspx):


> It depends on what your [definition of COM](http://en.wikipedia.org/wiki/Component_Object_Model) is. 
> COM is many things to many people. To me, COM is a programming model based on integrating 
> components based on type. Period. This was COM's primary contribution to the field of component 
> software, and that contribution has changed the way millions of programmers build systems today.

Don is right and the answer is historically and technically correct, however this is an indirect answer that didn't cheer up at all. Given the closing words in that article:

> (...) CLR provides significant benefits to developers who are using COM today. Virtually all 
> aspects of the COM programming model have survived (...) I look at the CLR as breathing new 
> life into the programming model that I've spent the last seven years of my life working with, 
> and I know there are other programmers out there who share this sentiment.


overall conclusion becomes more an abstruse philosophy than binary answer. What about all these cryptic terms of [Component Object Model](http://c2.com/cgi/wiki?ComponentObjectModel) technology made by Microsoft, like [OLE](http://en.wikipedia.org/wiki/Object_Linking_and_Embedding), ActiveX, DCOM and other? Silent.


Nearly ten years later, developers are [still asking the same question](http://groups.google.com/group/comp.lang.c++/browse_thread/thread/7e4032e096d0b8bf) (a few days ago, similar discussion took place on [ACCU](http://accu.org/) mailing list) about COM. [Alf. P. Steinbach](http://alfps.izfree.com/) gave an interesting answer that, however, sounds very similar to the one given by Don Box:


> COM is one of the few successful C++ component technologies, if not the only one 
> (depending on one's definition of "successful (...) Some reduced and slightly modified versions of 
> COM are used in e.g. Linux user interface and in Firefox browser (XCOM). Original COM itself is 
> however a Windows-specific technology. But while it's necessarily used to interface to the operating 
> system and at higher levels in e.g. scripting, it's my impression that it's now now not much used 
> as a general C++ component technology, i.e., that use of COM is something forced, not something desired and freely chosen.


Even though both are similar, it's been decade since the question was asked for the first time and now we have 10 years of experience based on observations what has changed after .NET was thrown on the marked. The [managed baby](http://blogs.msdn.com/brada/archive/2004/01/09/48925.aspx) seems to be winning the market of Microsoft-oriented ([not only](http://www.mono-project.com/), though) developers and users. COM is widely used as components of Windows systems  and other already existing software but are new [COM servers](http://en.wikipedia.org/wiki/Component_Object_Model#COM_as_an_object_framework) and [objects](http://c2.com/cgi/wiki?AreComponentsObjects) still being developed? Or, has it started to suffer of COM programmer species extinction?


The [www.microsoft.com/COM/](http://www.microsoft.com/COM/) website confirms that:


> Microsoft recommends that developers use the .NET Framework rather than COM for new development.


In my humble opinion, Mr. COM is like an old veteran, alive, but most of his comrades-in-arms have died, so he usually goes to pub alone.
