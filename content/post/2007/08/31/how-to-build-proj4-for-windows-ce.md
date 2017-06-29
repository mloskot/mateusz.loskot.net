---
date: 2007-08-31 19:35:43
slug: how-to-build-proj4-for-windows-ce
title: How to build PROJ.4 for Windows CE
categories: [ "code" ]
---

Recently, I've been asked for some help in building [PROJ.4](http://proj.maptools.org/) library for Windows CE systems, like [Windows Mobile 5.0](http://en.wikipedia.org/wiki/Windows_Mobile) for Pocket PC. So, I decided to write down all steps required to get this task done with success.







**Ingredients**







  * Sources of PROJ.4
`cvs -d :pserver:cvsanon@cvs.maptools.org:/cvs/maptools/cvsroot login
Password: 
cvs -d :pserver:cvsanon@cvs.maptools.org:/cvs/maptools/cvsroot co proj
`



  * Sources of WCELIBCEX
`svn co https://wcelibcex.svn.sourceforge.net/svnroot/wcelibcex/trunk wcelibcex`



  * Compiler - Microsoft [Visual C++ 2005](http://msdn.microsoft.com/visualc/) (equal to or higher than the Standard Edition)







**...and Grandmother's Recipe**





I assume the following directories structure is used:
`
C:\dev
C:\dev\proj
C:\dev\wcelibcex
`







  1. Open one of available solutions - projce_lib (static library) or projce_dll - located under following location:
`C:\dev\proj\wince\msvc80`



  2. Add project of WCELIBCE library to the loaded solution:


    * Go to the Solution Explorer


    * Select File > Add > Existing Project...


    * Navigate to _C:\dev\wcelibcex\msvc80_ and select **wcelibcex_lib.vcproj** file. OK.





  3. Set **WCELIBCEX_PATH** macro in the Property Sheet of PROJ.4 project (projce_common.vcproj):


    * Go to the Property Manager (in the View menu)


    * Double-click on **projce_common** leaf in the tree (it doesn't matter if you expand Debug or Release node)


    * Go to Common Properties > User Macros


    * Double-click on WCELIBCEX_DIR macro and set proper location: _C:\dev\wcelibcex\src_.


    * Apply and OK





  4. Set **wcelibcex_lib** as a dependency of **projce_dll**: Project > Project Dependencies and select projce_dll **Depends on:** wcelibcex_lib.



  5. Grab some beer(s) from the fridge :-)



  6. Run Build > Build Solution (F7)








For example, if you're building PROJ.4 as DLL for Windows Mobile 5.0 for Pocket PC, and you select debug configuration, you will find PROJ.4 binaries - **proj.dll** and **proj_i.lib** in following location:

`C:\dev\proj\wince\msvc80\projce_dll\Windows Mobile 5.0 Pocket PC SDK (ARMV4I)\Debug
`





I hope someone will find this guide helpful. If there is anything unclear, put your questions as a comment below





BTW, there is **README** file in _proj/wince/msvc80_ including helpful information about how to build and use PROJ.4 under Windows CE platforms.
