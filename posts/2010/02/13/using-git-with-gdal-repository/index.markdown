---
title: Using Git with GDAL repository
date: 2010-02-13 22:15:26
category: code
layout: post
comments: true
slug: using-git-with-gdal-repository
wordpressid: 1878
categories: open source,programming
tags: gdal,git,ogr,open source,programming,project,repository,subversion,svn
---

I have mirrored Subversion [trunk](http://svn.osgeo.org/gdal/trunk/) of GDAL repository on [Gitorious](http://gitorious.org/) -  a free hosting for collaborating on distributed open source projects. It is available as [svn-trunk](http://gitorious.org/gdal/svn-trunk) repository of [gdal](http://gitorious.org/gdal/) project.


The main motivation is that it simplifies development of experiments in case one needs version control or complete disconnection from SVN trunk for some period. Thanks to git-svn, it is possible to push changes back to the trunk.


I outlined the process of maintaining GDAL trunk using Git in the Wiki article [Using Git To Maintain GDAL Workflow](http://trac.osgeo.org/gdal/wiki/UsingGitToMaintainGDALWorkflow).


The synchronization is not a time consuming process at all but even that I hope to make it automatic process in near future. First, I have to ship [my little personal server](http://mateusz.loskot.net/?p=869) to _a remote data centre_ and I'm hoping to do it next week. Lucky bastard going to bask in the warm sun of Portugal :-)
