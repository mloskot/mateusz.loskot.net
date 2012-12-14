---
title: SOCI 3.1.0 Released
date: 2011-10-11 21:21:15
category: code
comments: true
layout: post
slug: soci-3-1-1-released
wordpressid: 2206
categories: programming
tags: abstraction,backend,c++,database,dbms,library,maciej sobczak,project,release,rero,soci
---

It has been a very long journey since version 3.0.0 of SOCI was released. Namely, it's been nearly three years. The [RERO](http://en.wikipedia.org/wiki/Release_early,_release_often) philosophy didn't quite kick in somehow, but the new [SOCI 3.1.0](https://sourceforge.net/mailarchive/message.php?msg_id=28213168) is finally out.


The latest package can be downloaded from here [http://sourceforge.net/projects/soci/](http://sourceforge.net/projects/soci/) and the complete documentation is part of the package as well as available on-line at [http://soci.sourceforge.net/doc/index.html](http://soci.sourceforge.net/doc/index.html). The project web page reflects the latest changes as well [http://soci.sourceforge.net/](http://soci.sourceforge.net/).


This new release brings all the developments that took place during the last two years and that were up to now somewhat inconveniently available only from our [Git repository](https://sourceforge.net/scm/?type=git&group_id=121480). At the same time it also defines the snapshot and a basis for subsequent library evolution.


Here extract from the [CHANGES](soci.git.sourceforge.net/git/gitweb.cgi?p=soci/soci;a=blob;f=src/CHANGES;hb=HEAD) file


Version 3.1.0 differs from 3.0.0 in the following ways:

* Added [Ada](http://en.wikipedia.org/wiki/Ada_%28programming_language%29) language binding
* Migrated build system from GNU Autotools and Visual Studio projects to [CMake](http://www.cmake.org)
* CMake build tested with Visual Studio, [GCC](http://gcc.gnu.org) and [clang](http://clang.llvm.org/)
* Incorporated a compromise for naming versioned shared libraries
* Enhanced and improved integration with [Boost](http://www.boost.org) libraries: Boost.DateTime, Boost.Fusion, Boost.Optional, Boost.Tuple
* Bug fixes and improvements in core and backends:
    * Added soci::values::get_properties accessor useful for composing soci::type_conversion
    * Export advanced API of backend loader from DLL
    * Added static factory registration functions for backends
    * Added get_affected_rows operation
    * Fixed thread-safety of connection pool under Windows
    * Fixed bug with dropping const qualifiers when binding to std::vector<soci::indicator>
    * Fixed bug in default initialization of an object of const backend_factory which requires user-provided default constructor (see C++03/C++0x)
    * Fixes for 64-bit builds
    * Removed redundant exchange_traits breaking ODR on LP64
    * Better ODBC support
    * Type conversion support for unsigned integer types
    * Bug ID:1971436 - incorrect rowset copy operations
    * Bug ID:2010367 - memory leak (ODBC)
    * Bug ID:2010409 - invalid memory allocation in define by position (ODBC)
    * Bug ID:2021243 - long long type support in Visual C++
    * Patch ID:2483066 - 64bit Linux and 64bit integer submitted
    * Patch ID:2809809 - Fix build with GCC 4.4
    * Patch ID:2809810 - Fix SQLite3 build with GCC 4.3
    * Patch ID:2581206 - Windows Unicode application
    * Patch ID:3058275 - install target for CMake build submitted
    * Patch ID:3069375 - use $(prefix)/lib64 on AMD64 platforms
    * Improved performance while accessing query results (MySQL)
    * Bug fixes for PROCEDURE support (MySQL)
    * Removed throw statements from mysql_rowid_backend and mysql_blob_backend destructors (MySQL)
    * Verify that prepared statements survive session::reconnect() operation (MySQL)
    * Improved support for time and date (MySQL, PostgreSQL)
    * Fixed bug with strings of length exceeding 255 characters (ODBC)
    * Improved interpretation of the connect string (Oracle)
    * Added handling of unsigned long long (Oracle, SQLite3, PostgreSQL)
    * Fixes in integral types support (PostgreSQL)
    * Support for colon-casts (PostgreSQL)
    * Added possibility for use BLOB (PostgreSQL)
    * Added support for connection property "synchronous=on|off" (SQLite3)
    * Improved BLOB data handling (SQLite3)
    * Improved boolean type support (SQLite3)
    * Session timeout support (SQLite3)
    * Improved tests clean-up (SQLite3)
    * Added missing typedef of sqlite3_destructor_type which has been defined in sqlite3.h but since 3.3.10 (see comment for reference to SQLite ticket)
* Updated tests for various backends and SQL data types
* Changed naming conventions and style across all the source code
* Firebird backend removed from official release as not actively maintained. Available in the Git repository
* Migrated from CVS to Git repository


On behalf of [SOCI Team](http://soci.sourceforge.net/people.html), I'd like to thank all users and contributors who actively helped us to bring the new release to the public. I have tried hard to list everyone in the [AUTHORS](soci.git.sourceforge.net/git/gitweb.cgi?p=soci/soci;a=blob;f=src/AUTHORS;hb=HEAD) file. If anyone has been omitted, it happened by mistake and please don't hesitate to tell me.


Unfortunately, due to lack of active maintenance the [Firebird](http://www.firebirdsql.org/) backend has been removed. Also, the ODBC backend needs more love, especially testing. However, we welcome anyone who is interested in taking over the maintenance of the Firebird backend as well as helping us to test and improve the ODBC backend.


As the author of the [CMake configuration](http://soci.sourceforge.net/doc/installation.html#cmake), I'm strongly interested in any feedback and constructive critique. Please, feel free to post your comments to [soci-users](https://sourceforge.net/mail/?group_id=121480). Do you have any ideas for SOCI backends to other databases? Share it!


We are very excited about this release. It allows us to define the directions for future work. There is plenty of ideas to pursue.
