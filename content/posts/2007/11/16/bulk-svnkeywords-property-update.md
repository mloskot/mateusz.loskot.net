---
comments: true
date: 2007-11-16 17:09:06
layout: post
slug: bulk-svnkeywords-property-update
title: Bulk svn:keywords property update
wordpressid: 168
categories: programming
tags: programming,rcs svn subversion keywords id date,subversion
---

How to set [svn:keywords](http://en.wikipedia.org/wiki/Subversion_(software)#Properties) property recursively on a set of files?




It's easy using a couple of GNU and OpenSource utilities. Following example presents how to set the _Id_ keyword on all [C/C++ header](http://en.wikipedia.org/wiki/Header_file) files in sample project.

    
    
    $ cd myproject
    


Set svn:keywords to all .h and .hpp files

    
    
    $ find . -regex '.*\.h' -o -regex '.*\.hpp' | xargs svn propset svn:keywords "Id"
    


Commit submit property changes back to the repository

    
    
    $ cvs commit -m "Set svn:keywords property on all header files."
    







Here is a post explaining how to set the svn:keywords property automatically using private SVN configuration file: [Subversion and keyword substitution](http://fixlinux.com/2006/07/24/subversion-and-keyword-substitution/) (at fixlinux.com)
