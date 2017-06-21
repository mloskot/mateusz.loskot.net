---
date: 2007-02-04 02:24:46
slug: fdo-postgis-turning-point
title: FDO PostGIS turning point
categories: none
---

More than a week ago, after longer discussion in the [FDO](http://fdo.osgeo.org/) PostGIS team ([Paul Ramsey](http://geotips.blogspot.com/), [Jason Birch](http://www.jasonbirch.com/) and [I](http://mateusz.loskot.net/)) we decided about a turning point in the development of [PostGIS](http://postgis.refractions.net/) provider for FDO. The most important part of our decision is about dropping the [Generic RDBMS](http://fdo.osgeo.org/fdordbms/index.html) framework as an intermediate API for the provider and implementing FDO core interface directly.






What is the _Generic RDBMS_ framework:


> The Generic RDBMS project provides FDO with access to RDBMS systems through a generic framework that allows code reuse and reduces the development time for creating new FDO providers.







I've been working with the Generic RDBMS and learning its internals straight from the code long weeks. It wasn't easy due to fact [it feels big](http://www.foss4g2006.org/contributionDisplay.py?contribId=211&sessionId=42&confId=1) and also because it's not friendly documented for users yet. Nevertheless, I can say I've became familiar with internals of Generic RDBMS quite well.





Recently, I've started to experience [some](http://lists.osgeo.org/pipermail/fdo-internals/2007-January/000542.html) difficulties and [limitations](http://lists.osgeo.org/pipermail/fdo-internals/2007-January/000563.html) of the Generic RDBMS layer. I faced all these problems while adding support of another DBMS engine - [PostgreSQL](http://www.postgresql.org/) - to the Generic RDBMS layer and it's internal components like RDBI and GDBI  (the PostgreSQL is not yet supported by Generic RDBMS, so it was obvious for me I need to implement it in order to develop PostGIS provider).





[Follow this link](http://lists.osgeo.org/pipermail/fdo-internals/2007-January/000657.html) to read _the turning point_ announcement posted by Paul on the fdo-internals mailing list, in which you can find more details about the rationale of our decision.





As a conclusion of my experiences from using Generic RDBMS, here is my personal summary of reasons why it's important to analyse this framework in details before making a final choice (random order):




  * Every DBMS engine is specific and it's worth to consider specific solution.


  * It's not possible to develop a database abstraction layer for every kind of application.


  * The Generic RDBMS _makes_ some decisions first and they should be analysed before attempting to implement new provider to find if these decisions won't become limitations.


  * The Generic RDBMS forces a provider to require existence of FDO Meta Schema - a set of predefined tables


  * Workarounds for decisions made by Generic RDBMS are mostly based on bringing and extending new level(s) of abstraction.


  * The former point leads to increase of complexity of the solution.


  * The FDO is complex and _feels big_. The Generic RDBMS framework increases this complexity.


  * It's probably easier to achieve optimal performance with very specific solution, so the Generic RDBMS might cause another limitations in this area.


  * IMHO, there are too many abstraction levels in the Generic RDBMS itself (RDBI, DBI, GDBI, ...)


  * Creating new FDO provider by directly implementing FDO core interfaces **is**: easier to develop, easier to test and debug, maintainer friendly and it **may be** more robust.









_I can confirm it's easier because I've been developing on new generation of PostGIS provider for more than a week. I suppose thin implementation of FDO core interfaces will be faster because of use of as little abstraction levels as possible._





I'm not against of the idea of abstraction layers for DBMS and I'm not against the idea of the Generic RDBMS framework for FDO. Better, I like the concept. I'm a member of development team of [SOCI](http://soci.sourceforge.net/) library - a database access library for C++. It's a simple abstraction providing common layer for SQL queries execution and fetching query results. I'd call SOCI as a pretty simple example of common denominator for various DBMS and even that we've experienced number of problems and limitations resulting from specific nature of various database engines. So, developing **usable** and extensible abstraction above yet more complex system is tricky for sure, but may be impossible too.





I know there are some users waiting for the PostGIS provider for FDO. I'd like to apologise all of you waiting for it for the significant delay. I'm sure our latest decision about the turning point will favourably influence the PostGIS provider development and make the release date closer.
