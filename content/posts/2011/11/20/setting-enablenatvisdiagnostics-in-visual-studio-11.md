---
title: Setting EnableNatvisDiagnostics in Visual Studio 11
date: 2011-11-20 04:54:42
category: code
slug: setting-enablenatvisdiagnostics-in-visual-studio-11
categories: programming
---

Previously, I [posted](/?p=2289) about the new XML-style debugger visualizers I discovered in Visual Studio 11. I mentioned that one of reasons the feature has been redesigned is to enable debugging of the visualizers templates defined in default or user-defined `.natvis` files. So, it looks there is something more to discover: how to actually make use of the diagnostics capability.





Unfortunately, it seems the new debugger visualizers have not been documented anywhere. At the time of writing this blog, Google reports one link about [defaultvis.natvis](http://www.google.com/search?q=%22defaultvis.natvis%22), it is the [brief post](http://social.msdn.microsoft.com/Forums/is/vcgeneral/thread/5e847744-aa01-49cd-ac47-fe32da1673a3) on Visual C++ forum.





Luckily, there is a short manual included as comment in header of the `%ProgramFiles%\Microsoft Visual Studio 11.0\Common7\Packages\Debugger\Visualizers\defaultvis.natvis` file. It says:





> 1) give better diagnostic reporting.
 a) Set the name-value entry under the Debugger registry key: EnableNatvisDiagnostics which is a REG_DWORD to a value of 1 this will output each expression string that is evaluated under the native visualizer into the output window and is good for debugging type definition typos in .natvis files.





The first thing is to figure out where to set the `EnableNatvisDiagnostics` flag. The Visual Studio 11 installer does not put it into the registry. Also, there are several `Debugger` keys. However, a few experiments proved the flag should be set under `HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\11.0\Debugger`:





[![vs11-visualizers-enable-natvis-diagnostics](http://farm7.staticflickr.com/6058/6366775823_6c76e463e1_o.png)](http://www.flickr.com/photos/mloskot/6366775823/)






Once it is set, every time Visual Studio 11 debugger is launched and use of visualized types is determined, the .natvis files are parsed and evaluated templates validated. The process is reported in the Output window:





[![vs11-evaluating-visualizer-1](http://farm7.staticflickr.com/6045/6366775645_20e510cc0e_z.jpg)](http://www.flickr.com/photos/mloskot/6366775645/)





If anything goes wrong, a type definition template is incorrect and its evaluation fails, it is also reported in the Output window:





[![vs11-evaluating-visualizer-2-validation](http://farm7.staticflickr.com/6034/6366775745_a2b0770a59_z.jpg)](http://www.flickr.com/photos/mloskot/6366775745/)





It will be a very useful feature especially when defining visualizers of complex types. Previous versions of Visual Studio used old format of templates defined in autoexp.dat file which stated its own [DSL](http://en.wikipedia.org/wiki/Domain-specific_language) based on regular expressions, so the syntax was complex and fragile, and as [Andy Pennel has confessed](http://blogs.msdn.com/b/andypennell/archive/2006/03/28/563221.aspx), [not documented](http://connect.microsoft.com/VisualStudio/feedback/details/168571/publish-documentation-for-visualizer-section-of-autoexp-dat). (Here kudos to [Avery Lee](http://www.virtualdub.org) who did great job [reverse-engineering the autoexp.dat syntax](http://www.virtualdub.org/blog/pivot/entry.php?id=172).)





At least, this time folks get the XML Schema for the Visual Studio debugger visualizers.
