---
date: 2009-07-29 23:47:44
slug: atl-security-update
title: ATL Security Update
categories: programming
  c++,visual studio,webcast,windows,wtl
---

Those of you who use [Visual Studio](http://msdn.microsoft.com/en-gb/vstudio/default.aspx) in daily work have probably noticed there is has been new [security update](http://www.microsoft.com/technet/security/advisory/973882.mspx) issued for [Active Template Library](http://en.wikipedia.org/wiki/Active_Template_Library). The [Channel 9](http://channel9.msdn.com/) also published very [interesting webcast](http://channel9.msdn.com/posts/Charles/Out-of-Band-Inside-the-ATL-Security-Update/) in which three engineers from [Microsoft explain](http://msdn.microsoft.com/en-us/visualc/ee309358.aspx) [what's inside the update for ATL](http://blogs.technet.com/srd/archive/2009/07/28/overview-of-the-out-of-band-release.aspx).



 

> Developers who have built controls using vulnerable versions of ATL should take immediate action to review and identify any vulnerabilities, modify and recompile their affected controls and components using the updated versions of ATL and finally distribute a non-vulnerable version of the controls and components to their customers.





Along with security fixes, the update includes one more interesting feature. [Damien Watkins](http://mateusz.loskot.net/?p=753&preview=true) announced (12 min 20 sec) that now:





> you can include ATL as a kind of header only implementation





I suppose, it may make it easier to port [ATL](http://msdn.microsoft.com/en-us/library/t9adwcde.aspx) features to development environments produced by parties like [MinGW](http://www.mingw.org/), so users of these will likely be able to use [Windows Template Library](http://en.wikipedia.org/wiki/Windows_Template_Library) (WTL) based on ATL. I'm dreaming, am I?





[Inside the Active Template Library (ATL) Security Update](http://channel9.msdn.com/posts/Charles/Out-of-Band-Inside-the-ATL-Security-Update/) | Jul 28th @ 10:02 AM
