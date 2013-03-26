---
date: 2013-03-26T03:00:00Z
title: SOCI 3.2.0 released
description: Announcement of new version of SOCI library
category: code
tags: soci,announcement,dbms
---

## SOCI delayed news

In November 2011, [Maciej Sobczak](http://www.msobczak.com/) announced his departure 
from the project and called for
[new SOCI project leader needed](/posts/2011/11/07/new-soci-project-leader-needed/).
Almost year later, I decided to step forward and become a new 
[SOCI project manager](https://sourceforge.net/mailarchive/message.php?msg_id=29565142).

I would like to take this opportunity I'm writing about SOCI and thank Maciej for SOCI
- quite a revolutionary C++ idea he came up with *decade ago*; for long-standing
C++ *mentorship* while working on the project together or discussing C++ on 
[pl.comp.lang.c](https://groups.google.com/forum/?fromgroups#!forum/pl.comp.lang.c) 
in the great days of Usenet; finally, for showing me the real value of 
[lean thinking](http://en.wikipedia.org/wiki/Lean_manufacturing) in hacking.

I was born in country which undergoes 
[revolution every four years](http://pl.wikipedia.org/wiki/Wybory_parlamentarne_w_Polsce)
and very first decisions new leaders is to make things over.
Trying to not to neglect the rich legacy of my fathers, 
I [planned my first revolution](https://sourceforge.net/mailarchive/message.php?msg_id=29939144) 
for the project. That was to migrate the development infrastructure to GitHub and 
create an organization there. The motion was successfully 
[completed month later](https://sourceforge.net/mailarchive/message.php?msg_id=30090409).

All SOCI development and code slinging activities take place at https://github.com/SOCI.
The release downloads and mailing lists remain hosted at https://sourceforge.net/p/soci
and the website with documentation at http://soci.sourceforge.net.

## SOCI 3.2.0

On behalf of the whole [SOCI](http://soci.sourceforge.net) team I extremely 
pleased to announce this new release of SOCI 3.2.0 version. 

The SOCI 3.2.0 source packages are available for download from SF.net: 

https://sourceforge.net/projects/soci/files/soci/soci-3.2.0/

or as .zip for the whole [3.2.0 tag](https://github.com/SOCI/soci/tree/3.2.0) 
directly from the current Git repository: https://github.com/SOCI/soci

Documentation for the current version is available at http://soci.sourceforge.net/doc.html

I'd like to thank **each and everyone** involved, who helped in any
kind of way to make this release happen: all developers 
and contributors as well as SOCI users here and everywhere. 
It's a *great feeling* to grow the list of 
[AUTHORS](https://github.com/SOCI/soci/blob/3.2.0/src/AUTHORS) 
with new names on every release. 

Below, I copied the relevant part from the 
[CHANGES](https://github.com/SOCI/soci/blob/3.2.0/src/CHANGES) file:

---------------------------------------------------------------------------
Version 3.2.0 differs from 3.1.0 in the following ways: 

- SOCI is now organization at GitHub 
-- Git repository moved to https://github.com/SOCI/soci
-- Opened new bug tracker (SF.net tracker is read-only) 
-- Opened Wiki for FAQ and development articles 
-- Website, mailing lists and downloads remain on SourceForge.net 
-- Applied GitFlow branching model 
-- Added package maintenance repository https://github.com/SOCI/soci-pkg

- Core 
-- Added ```connection_parameters``` to enable support for session options 
used by core, backends or low-level API. 
-- Added user-defined query transformation support based on function, 
functor and lambda 
-- Fixed missing connection check and backend setup ensured for session 
-- Fixed backend initialization when used with connection pool (Core) 
-- Fixed memory leaks on exception thrown during statement preparation stage 

- DB2 
-- Added new backend for IBM DB2 

- Firebird 
-- Fixed bug in repeated statement execution 
-- Fixed issues with input parameter binding 
-- Fixed connection string parsing to handle possible white-spaces 
-- Fixed issues with C++ type ```unsigned long```
-- Fixed reading negative values into C++ type ```double```
-- Added option to fetch numeric/decimal data into string of characters 
-- Added CMake configuration 
-- Updated tests 
-- Continued regular testing on Windows and Unix platforms 

- MySQL 
-- Replaced use of type=InnoDB with engine=InnoDB 
-- Improved CMake configuration 

- ODBC 
-- Added connection_parameters option ```ODBC_OPTION_DRIVER_COMPLETE``` 
-- Fixed issues in handling C++ types ```int``` and ```long``` on 64-bit architectures 
-- Added missing CMake configuration for tests 
-- Continued regular testing on Windows and Unix platforms 

- Oracle 
-- Implemented ```statement::get_affected_rows()``` operation 
-- Use ```OCI_THREADED``` and ```OCI_ENV_NO_MUTEX``` with ```OCIEnvCreate```
-- Added numerous fixes and improvements in tests 
-- Added option to fetch numeric/decimal data into string of characters 
-- Fixed issues in binding procedure IN/OUT parameters 

- PostgreSQL 
-- Add reading of ```BYTEA``` data into ```std::string``` (not fully-featured 
binary data support yet)
-- Add JSON data type support available in PostgreSQL 9.2+ 
-- Fixed incorrect assertion in ```postgresql::get_error_details```
-- Fixed premature deallocation of prepared statements
-- Fixed servers-side memory leak in prepared statements
-- Fixed memory leak of PGresult on exception thrown
-- Fixed isues in parsing complex PL/PSQL functions

- SQLite3 
-- Implemented ```statement::get_affected_rows()``` operation 
-- Fixed handling of database file path with spaces 

- Building, testing and installation 
-- Marked Makefile.basic as deprecated (maintainer wanted) 
-- Cleaned numerous compilation warnings reported by various compilers 
-- Improved compilation using latest version of clang 
-- Added numerous improvements in CMake configuration 
-- Added ```SOCI_STATIC``` option to enable/disable static libraries build 
-- Fixed issues with ignored ```-DWITH_<dependency>``` options 
-- Fixed ```FindMySQL.cmake``` to allow use of mysqlclient from custom location 
-- Added support of ```SQLITE_ROOT_DIR``` variable to ```FindSQLite3.cmake``` module 
-- Fixed and tested CMake configuration on OSX 
-- Fixed and tested CMake configuration on FreeBSD 
-- Fixed and tested CMake configuration to use with Ninja 
-- Fixed building using Visual Studio 2010 
-- Added support for building using Visual Studio 2012 
-- Set up SOCI continuous integration at travis-ci.org 
-- Added Debian packaging support to [soci-pkg](https://github.com/SOCI/soci-pkg) repository 
-- Added Fedora/CentOS/RedHat packaging support to soci-pkg repository 

- Documentation 
-- Review and update to catch up with current status quo 
-- Updated code examples 
-- Start maintenance and hosting of SOCI documentation per released version

---------------------------------------------------------------------------

A complete changelog of commits 
[generated from Git](https://github.com/SOCI/soci/issues/93#issuecomment-15434667) 
history in pretty Markdown format is available as a Gist in 
[soci-3.2.0-github-changelog.md](https://gist.github.com/mloskot/5241027).

In case of questions or problems, drop us a line to 
[soci-users](https://lists.sourceforge.net/lists/listinfo/soci-users).
If you have encountered a bug, [open new issue](https://github.com/SOCI/soci/issues) at GitHub.

Thank you all!
