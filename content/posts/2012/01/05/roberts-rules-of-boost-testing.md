---
date: 2012-01-05 23:16:44
slug: roberts-rules-of-boost-testing
title: Robert's rules of Boost testing
category: code
categories: open source,programming
---

By the way of trying to figure out [how to make tests building faster?](http://lists.boost.org/Archives/boost/2011/12/189026.php) (I will post about it later), I have learned some interesting practices regarding Boost testing in general. Especially, [Robert Ramey shared](http://lists.boost.org/Archives/boost/2011/12/189045.php) his best practices, worth to look at really. New release of Boost will be released [next week](http://www.boost.org/community/index.html), so I'm testing [Boost.Geometry](http://www.boost.org/libs/geometry/) library and it is a good opportunity to apply some of Robert's rules.


> I'm testing against "known good" components - the next release branch.


How to run tests of current development line of a library (a Boost library, e.g. Boost.Geometry) against Boost release branch? Assuming all the library development happens in Boost trunk, let's say in `${DEV}/boost/_svn/trunk` where `${DEV}` is your base workshop location, do this:

* Checkout Boost release branch


```
mkdir -p ${DEV}/boost/_svn/branches/release
cd ${DEV}/boost/_svn/branches/release
svn co https://svn.boost.org/svn/boost/branches/release/ .
```

* Stay in ```${DEV}/boost/_svn/branches/release```

* Build and install Boost.Build v2 from the release branch:


```
cd tools/build/v2
# On Windows, run bootstrap.bat
./bootstrap.sh
# On Windows, I use C:\usr as prefix for my Boost installation
./b2 --prefix=/usr/local install
# Note, this command will also install b2 utility in ${prefix}/bin
```

* Switch Boost.Geometry directories to trunk:
    

```
svn switch https://svn.boost.org/svn/boost/trunk/boost/geometry boost/geometry
svn switch https://svn.boost.org/svn/boost/trunk/libs/geometry libs/geometry
```

* Run tests and generate full log in file:


```
export BGLOG=boost-geometry-test.log
date > $BGLOG & b2 >> $BGLOG 2<&1 & date >> $BGLOG
# On Windows, I run this with logging this way:
set BGLOG=%CD%\boost-geometry-test.log
dateu.exe > %BGLOG% & b2 >> %BGLOG% 2<&1 & dateu.exe >> %BGLOG%
```
    
Note, the `dateu.exe` is renamed Unix utility `date.exe` installed from [GnuWin32](http://gnuwin32.sourceforge.net/) packages. I just like it.

Inspect the log file for test failures, for example by quick check of number of passed tests:
    
```    
$ grep "\*passed\*" boost-geometry-test.log | wc -l
111
```

That's it.

> Try this out - it will help a lot.
