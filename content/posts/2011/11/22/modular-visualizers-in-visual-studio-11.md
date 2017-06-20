---
title: Modular visualizers in Visual Studio 11
date: 2011-11-22 00:58:34
category: code
slug: modular-visualizers-in-visual-studio-11
categories: programming
---

Previously, I talked about the new 
[debugger visualizers in Visual Studio 11](/?p=2289) (Developer Preview) 
based on XML. By the way, I haven't any luck trying to figure out where 
does the file type `.NATVIS` come from.

In previous versions of the Visual Studio, all templates of debugger visualizers 
have to be saved in single file: 
`%VSINSTALLDIR%\Common7\Packages\Debugger\autoexp.dat`. 
In case one wants to extend or improve the templates definition, maintaining 
everything in one system-wide file is neither practical nor safe.

The visualizers in Visual Studio 11 seem to solve the maintenance hassle by 
allowing more modular approach. First nice feature is that custom templates can 
be defined without touching any of the installed Visual Studio files and can be 
put in `%USERPROFILE%\Documents\Visual Studio 11\Visualizers`. 
Second nice feature I've just discovered is that definitions of visualizers can be 
split into several separate `.natvis` files. It is especially useful if one wants 
to maintain visualizers grouped according to libraries 
(e.g. [Loki](http://loki-lib.sourceforge.net/), [Boost](http://www.boost.org), 
 [POCO](http://pocoproject.org)).

Basically, `%USERPROFILE%\Documents\Visual Studio 11\Visualizers` works like a 
package of custom visualizers now:

[![vs11-user-natvis](http://farm7.staticflickr.com/6223/6379533713_9362254f30_o.png)](http://www.flickr.com/photos/mloskot/6379533713/)

Having the [visualizers diagnostics enabled](/?p=2781), whole process of parsing 
and loading `.natvis` files will be traced in Visual Studio 11 output window:

[![vs11-modular-natvis](http://farm7.staticflickr.com/6037/6379627735_e6388b61b2_z.jpg)](http://www.flickr.com/photos/mloskot/6379627735/)

No more copying and pasting 
[debugger visualizers for Boost](https://svn.boost.org/trac/boost/wiki/DebuggerVisualizers) 
and others into big muddy autoexp.dat.

BTW, who knows where does NATVIS come from, hmm? :-)

## Update 2031-06-28:

There is a very good article by Cagri Aslan from Microsoft about
[Writing debugger type visualizers for C++ using .natvis files](http://code.msdn.microsoft.com/Writing-type-visualizers-2eae77a2)

