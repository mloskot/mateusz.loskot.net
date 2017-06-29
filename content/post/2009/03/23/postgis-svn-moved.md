---
date: 2009-03-23 23:05:18
slug: postgis-svn-moved
title: PostGIS SVN moved
categories: [ "code" ]
---

[Paul](http://www.cleverelephant.ca/) just [announced](http://postgis.refractions.net/pipermail/postgis-devel/2009-March/005284.html) that [Subversion](http://subversion.tigris.org/) repository of [PostGIS](http://postgis.refractions.net/) source code has moved to [OSGeo](http://www.osgeo.org) server. The new URL of SVN is: [http://svn.osgeo.org/postgis/](http://svn.osgeo.org/postgis/).





Only _base location_ of the repository has changed, so the cheapest way to switch existing working copy that points to [old location of SVN](http://svn.refractions.net/postgis/trunk/) is to [switch & relocate](http://svnbook.red-bean.com/en/1.0/re27.html):

    
    
    mloskot@dog:~/dev/postgis/_svn/trunk$ svn switch --relocate \
       http://svn.refractions.net/postgis/trunk/  \
       https://svn.osgeo.org/postgis/trunk
    








For the sake of security, I would recommend committers to use [https scheme](http://svnbook.red-bean.com/en/1.5/svn.serverconfig.httpd.html#svn.serverconfig.httpd.authn.basic) which is well supported on OSGeo server.
