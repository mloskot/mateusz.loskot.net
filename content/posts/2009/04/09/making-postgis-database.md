---
date: 2009-04-09 11:59:57
slug: making-postgis-database
title: Make'ing PostGIS database
categories: none
---

I've extended [Sean's idea](http://sgillies.net/blog/176/create-a-postgis-db-with-make/) of baking [PostGIS](http://postgis.refractions.net/)-enabled databases using [GNU Make](http://www.gnu.org/software/make/) a little bit and prepared new version of [Makefile.postgis](/download/projects/postgis/Makefile.postgis).





How to use it:






  * Install it to save yourself some typing:

    
    $ ln -s Makefile.postgis Makefile




  * Run `make` to get basic usage information:

    
    $ make
    ****** Makefile.postgis usage ******
    *** Create new PostGIS database:
    	DBNAME=mydb make -f Makefile.postgis create
    *** Drop PostGIS database:
    	DBNAME=mydb make -f Makefile.postgis drop
    *** Check if database exists and PostGIS if enabled with PostGIS:
    	DBNAME=mydb make -f Makefile.postgis check
    *** Check if database exists:
    	DBNAME=mydb make -f Makefile.postgis check-db
    *** Check if database is enabled with PostGIS:
    	DBNAME=mydb make -f Makefile.postgis check-postgis




  * Check if your database exists:

    
    $ DBNAME=mydb make check-db
    ****** Makefile.postgis ******
    ****** Database 'mydb' not found




  * Create your database with PostGIS extension installed:

    
    $ DBNAME=mydb make create
    ****** Makefile.postgis ******
    ****** Creating database 'mydb'...
    ****** Loading PostGIS into 'mydb'...




  * Check what has been created and installed:

    
    $ DBNAME=mydb make check
    ****** Makefile.postgis ******
    ****** Database 'mydb' found
    ****** Makefile.postgis ******
    ****** Database 'mydb' is enabled with PostGIS
    1.4 USE_GEOS=1 USE_PROJ=1 USE_STATS=1




  * When you don't need your database anymore, just drop it:

    
    $ DBNAME=mydb make drop





