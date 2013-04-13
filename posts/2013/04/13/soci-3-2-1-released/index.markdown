---
date: 2013-04-13T01:30:00Z
title: SOCI 3.2.1 released
description: Announcement of new version of SOCI library
category: code
tags: soci,announcement,dbms
---

A few weeks after [SOCI 3.2.0 release](/posts/2013/03/26/soci-3-2-0-released/),
we are delivering a bugfix release of SOCI 3.2.1. We haven't issued bugfix
release since 1.2.1, so I hope the packages are in order.

The source packages are available for 
[download from SF.net](https://sourceforge.net/projects/soci/files/soci/soci-3.2.1/).
or directly from the Git repository in [3.2.1 tag](https://github.com/SOCI/soci/tree/3.2.1).

Documentation for the current 3.2 line is available at 
[http://soci.sourceforge.net](http://soci.sourceforge.net/doc.html)

Priceless contributions allowed to collect some important fixes.
From the [CHANGES](https://github.com/SOCI/soci/blob/3.2.0/src/CHANGES) file, 
the version 3.2.1 differs from 3.2.0 in the following ways:

* Fixed binding of Oracle type `NUMBER(9,0)` to C++ `int`, by Tomasz Olszewski
* Fixed Oracle client library detection on Windows, by Tomasz Olszewski
* Fixed PostgreSQL issue with `deallocate_prepared_statement` called for non-existing statement
* Fixed prepared insert statements with custom data types support, by Tomasz Olszewski
* Fixed recent improvements in `x:=y` name binding, by Poul Bondo
* Fixed query transformation assignment in pooled sessions, by Stefan Chrobot
* Cleaned up `SOCI_POSTGRESQL_NOPARAMS` and related options in code and documentation
* Dropped patch (micro) version number from documentation URLs on the website

Complete [list of issues](https://github.com/SOCI/soci/issues?milestone=4&state=closed) 
is available at GitHub.

On behalf of SOCI team, thanks to everyone involved!

In case of questions or problems, drop us a line to 
[soci-users](https://lists.sourceforge.net/lists/listinfo/soci-users).
If you have encountered a bug, [open new issue](https://github.com/SOCI/soci/issues)
at GitHub.
