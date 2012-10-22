---
comments: true
date: 2009-03-12 16:14:57
layout: post
slug: lambda-i-love-you
title: Lambda, I love you!
wordpressid: 296
categories: programming
tags: anonymous,connection,db,expression,fun,function,lambda,libpq,parsing,postgresql,python,short,string,tiny
---

[I'm writing a small driver](http://twitter.com/mloskot/status/1315705612) for readint [WKT Raster](/?p=291) data from [RASTER](http://postgis.refractions.net/pipermail/postgis-devel/2009-March/005091.html) column in [PostGIS](http://postgis.refractions.net/)-enabled database and I want to report name of database I'm connected with. My reader eats connection string, and here I've fallen in love with [Python lambda](http://docs.python.org/reference/expressions.html#lambda).





Given _connstr_ stores connection string to [PostgreSQL](http://www.postgresql.org/) database in format well-known from [libpq](http://www.postgresql.org/docs/8.3/interactive/libpq-connect.html), single-line [anonymous function](http://en.wikipedia.org/wiki/Anonymous_function) can do the whole job:




    
    <code>filter(lambda db: db[:6] == 'dbname', connstr.split())[0].split('=')[1]</code>





Complete example:




    
    <code>$ python
    Python 2.5.2 (r252:60911, Oct  5 2008, 19:24:49) 
    >>> connstr = "dbname='rtest' host='localhost' user='mloskot'"
    >>> filter(lambda db: db[:6] == 'dbname', connstr.split())[0].split('=')[1]
    "'rtest'"
    >>> connstr = "password='xxx' port=5432 dbname='rtest' host='localhost' user='mloskot'"
    >>> filter(lambda db: db[:6] == 'dbname', connstr.split())[0].split('=')[1]
    "'rtest'"
    >>></code>





Have fun!
