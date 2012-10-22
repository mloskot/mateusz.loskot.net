---
comments: true
date: 2010-02-03 21:21:24
layout: post
slug: how-postgis-can-help-sql-server-users
title: How PostGIS can help SQL Server users?
wordpressid: 1829
categories: open source
tags: database,dbms,geospatial,gml,ogc,opengis,postgis,programming,project,rdbms,spatial,sptial,sql,sql
  server,stackoverflow
---

I may be a gonzo or it's just that today I didn't have my notorious _4th coffee_ in my favourite [Winnie The Pooh](http://www.whittard.co.uk/store/catalogue/China-P7000/Mugs-SC7002/Winnie-The-Pooh-Mug-208959.raa) cup I got from [Pantera](http://www.flickr.com/photos/mloskot/tags/pantera) on our **14th** (or 15th?) anniversary we celebrated a month ago, so...





Apparently, there are situations in which [PostGIS](http://www.postgis.org) could be an affordable anti-[GML](http://en.wikipedia.org/wiki/Geography_Markup_Language) vaccine jab. It seems there is [a potential market for PostGIS](http://blog.cleverelephant.ca/2008/10/sponsor-geos-make-postgis-faster.html) to conquer. Perhaps it wouldn't be estimated as profitable as the [H1N1](http://marketsandmarkets.wordpress.com/2009/10/23/h1n1-swine-flu-influenza-vaccine-market-worth-us-7028-million-by-2011/) but who knows what will happen if no one takes a brave stand and [stop GML designers](http://www.geoplace.com/me2/dirmod.asp?sid=119CFE3ACE2A48319AA7DE6A39B80D66&nm=News&type=Publishing&mod=Publications%3A%3AArticle&mid=8F3A7027421841978F18BE895F87F791&tier=4&id=A6331F2C001C4DBA81A350F0BA07980E)! Here I'd eagerly conclude with one of the famous [Scottish](http://en.wikipedia.org/wiki/A_History_of_Scotland_%28TV_series%29) [sentences](http://www.firstfoot.com/dictionary/full.html) :-)





Back to the subject matter. Today, I spotted an interesting question on the [StackOverflow](http://stackoverflow.com/) archives: [Is it possible to export spatial data from Sql Server 2008 in gml2 format?](http://stackoverflow.com/questions/352814/is-it-possible-to-export-spatial-data-from-sql-server-2008-in-gml2-format/). Natively? No, there is no such solution. Presumably, Microsoft thinks forward and thinks [GML 2](http://www.opengeospatial.org/standards/gml) is a legacy standard. Fair enough, someone has to draw a line between prehistoric and modern, somewhere. Why Microsoft? [Again](http://www.microsoft.com/visualstudio/en-us/products/2010/default.mspx)?





Facing such a tremendous suffer Microsoft exposed SQL Server users to, I suggested to visit the "underworld" for a while and [hire PostGIS to do the dirty job](http://stackoverflow.com/questions/352814/is-it-possible-to-export-spatial-data-from-sql-server-2008-in-gml2-format/2194841#2194841).





Paraphrasing [Andrei Alexan­dres­cu](http://en.wikipedia.org/wiki/Andrei_Alexandrescu)'s, hysterically [famous](http://www.reddit.com/r/programming/comments/8isiw/author_of_modern_c_design_stl_iterators_must_die/) recently, [sentence](http://lambda-the-ultimate.org/node/3520): _SQL Server should go!_.
