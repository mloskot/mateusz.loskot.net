---
date: 2005-12-28 22:05:00
slug: how-visual-c-2005-is-compliant-to-c-standards-regarding-windows-ce
title: How Visual C++ 2005 is compliant to C++ standards regarding Windows CE?
category: code
---

Recently, I started small investigation to find out what may I expect from the new [Visual C++ 2005](http://msdn.microsoft.com/visualc/) compiler if I'd like to start using it for [Windows CE](http://msdn.microsoft.com/embedded/windowsce/default.aspx) software development. Yes, I'm still using [eMbedded Visual C++ 4.0](http://msdn.microsoft.com/mobility/othertech/eVisualc/default.aspx), but Visual C++ 2005 seems very interesting for me. After my investigation I'm convinced it would help me to solve many problems related to low [ANSI/ISO C++](http://www.open-std.org/jtc1/sc22/wg21/) standard conformance of the older eVC++ 4.0. But let's start from the beginning.

**What was the question?**

Unlike previews versions, Visual C++ 2005 (8.0) seems to be a bundle of more than one compilers. Now, you can target not only [desktop Windows](http://msdn2.microsoft.com/en-us/library/ms235435.aspx) but also mobile devices running [Pocket PC 2003](http://www.microsoft.com/windowsmobile/pocketpc/default.mspx), [Smartphone 2003](http://www.microsoft.com/windowsmobile/smartphone/default.mspx), custom Windows CE systems.
Here comes a confusion I had  regarding new features of Visual C++ 2005 compiler. I was wondering if ANSI/ISO C++ standard conformity applies also devices development. Does it?

**What is the answer?**

Shortly, yes  it does. Visual C++ 2005 claims to be much more conformant to ANSI/ISO C++ Standard. In the [What's New in Developing Visual C++ Device Applications](http://msdn2.microsoft.com/en-us/library/dxdd87tf.aspx), among other improvements, you can read that Visual C++ 2005 device compilers have _Updates to conform to a higher percentage of C++ standards_. Sounds very good.

Next citation from MSDN provides better picture of consequence of compilers releases and explains where are new C++ conformance changes from:


> Because the device compilers are based on the desktop computer VC compiler, 
> examining the differences between the desktop computer VC 6.0 compiler and 
> 8.0 compiler provides a good approximation about the changes between the 
> eMbedded Visual C++ device compilers and the Visual Studio 2005 device compilers.

For more details follow this link [Migrating Microsoft eMbedded Visual C++ Projects to Visual Studio 2005](http://msdn.microsoft.com/library/en-us/dnppcgen/html/migrating_evc_vs2005.asp)

Now, I'm pretty sure I won't become disappointed after I move to VC++ 8.0. Only one question remains not answered: _are there any changes and improvements to CRT and C++ libraries included?_

There's a light at the end of the tunnel. I've just scanned following article [What's New in Developing Visual C++ Device Applications](http://msdn2.microsoft.com/en-us/library/dxdd87tf.aspx) and I see there are listed changes in C run-time and C++ libraries. What do they include? Hm, not much details but _extensive security, performance, stability and standards compliance_. So, I hope there is a chance one day Windows CE software developers will get complete implementations of C run-time and C++ libraries and we won't have to post questions like _Where is my mktime()  function on Windows CE?_  ;-)

In the meantime, I also asked my questions about Visual C++ 2005 and ANSI/ISO C++ conformance [here](http://forums.microsoft.com/msdn/showpost.aspx?postid=181181), on the MSDN forum [Smart Devices Native C++ Development](http://forums.microsoft.com/MSDN/ShowForum.aspx?ForumID=35).

By the way, here is my old post I sent to [microsoft.public.windowsce.embedded.vc](http://groups.google.pl/group/microsoft.public.windowsce.embedded.vc) in which I asked [Is VC++ 8 really new and standard conformant compiler?](http://groups.google.pl/group/microsoft.public.windowsce.embedded.vc/browse_frm/thread/228f7298b4a63af6/f64ed7bc0aa4df14). Among many opinions in that thread, Mr. P.J. Plauger from [Dinkumware, Ltd.](http://www.dinkumware.com) recommends their new C and C++ libraries as an interesting alternative:

> We're in final testing of our next release, which supports all the desktop versions 
> of VC++ from V6 to V8 and all the eVC versions from eVC to V8. All compilers have 
> essentially the same (and full) Standard C and Standard C++ library support.

Finally, I'd like to thank people who helped me a lot during my Visual C++ 
investigation: **P.J. Plauger**, **Vikas Taneja** and  **Mario Chenier**. Thank you very much!
