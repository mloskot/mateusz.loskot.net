---
date: 2006-01-20 11:14:33
slug: automatic-layout-of-resizable-dialogs-in-wtl
title: Automatic Layout of Resizable Dialogs in WTL
categories: none
---


![WTL Logo](/images/logos/wtl-logo.jpg)Today, [CodeProject](http://www.codeproject.com) announced me about new WTL article has been published. This one is very interesting. [Till Krullmann](http://www.codeproject.com/script/profile/whos_who.asp?id=110306) explains how to implement layout manager for dialog boxes using WTL in his article [Automatic Layout of Resizable Dialogs](http://www.codeproject.com/wtl/dialoglayout.asp). The concept is derived from WTL map based on macros. So, Till introduces new macros for that purpose: _BEGIN_LAYOUT_MAP()_ and _END_LAYOUT_MAP()_ as well as new base class for your own dialogs _CDialogLayout_:






> So I came up with a "semi-automatic" solution that pretty much meets the spirit of WTL. This solution is called "layout maps" and is, like all other ATL/WTL maps, based on macros. Though I don't particularly like hiding lots of code behind the innocent-seeming macros, I found it adequate in this case as it keeps things readable.






Equipped with Till's tools you can implement resizable dialog boxes with a few steps. Thanks Till!





