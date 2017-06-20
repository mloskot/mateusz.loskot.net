---
title: Quick CMake of GEOS
date: 2010-01-16 03:52:17
category: code
slug: quick-cmake-of-geos
categories: open source,programming
---

It's an example of b..dy quick attempt to configure [CMake](http://en.wikipedia.org/wiki/CMake)-based build of [a fairly large library](https://www.ohloh.net/p/geos) written in [C++](http://cpp-next.com/) programming language. It is [GEOS](http://trac.osgeo.org/geos/).


[Seven](http://en.wikipedia.org/wiki/7_%28number%29). A lucky number. [Arnulf](http://arnulf.us/User:Seven)'s nickname. Total number of lines (commands) of [CMake](http://www.cmake.org) script to configure build of [GEOS C++ core](http://trac.osgeo.org/geos/browser/trunk/src/) as a static library using sources form [SVN trunk](http://svn.osgeo.org/geos/trunk/):

Create `trunk/CMakeLists.txt` file:

```
project(geos)
cmake_minimum_required(VERSION 2.6)
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
add_subdirectory(src)
```


Create `trunk/src/CMakeLists.txt` file:


    
```
include_directories(${CMAKE_SOURCE_DIR}/include)
file(GLOB_RECURSE geos_SRC ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
add_library(geos STATIC ${geos_SRC})
```


In fact, only six lines are really required. The third line in file `trunk/CMakeLists.txt` is optional.


```
mloskot@dog:~/dev/geos/_svn/trunk$ svn status
?       CMakeLists.txt
?       src/CMakeLists.txt
mloskot@dog:~/dev/geos/_svn/trunk$ mkdir ../build
mloskot@dog:~/dev/geos/_svn/trunk$ cd ../build/
mloskot@dog:~/dev/geos/_svn/build$ cmake ../trunk
-- The C compiler identification is GNU
-- The CXX compiler identification is GNU
-- Check for working C compiler: /usr/bin/gcc
-- Check for working C compiler: /usr/bin/gcc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/mloskot/dev/geos/_svn/build
mloskot@dog:~/dev/geos/_svn/build$ 
mloskot@dog:~/dev/geos/_svn/build$ make -j5
Scanning dependencies of target geos
[  0%] Building CXX object src/CMakeFiles/geos_lib.dir/operation/valid/RepeatedPointTester.cpp.o
...

```


and **53 seconds** later my Intel Core 2 Duo 2.4GHz box announces:


```
[100%] Building CXX object src/CMakeFiles/geos.dir/linearref/LengthIndexOfPoint.cpp.o
Linking CXX static library libgeos.a
[100%] Built target geos
```


This build configuration is universal and cross platform, thus should work on all platforms supported by CMake.


Simply, you can not afford not use the [best cross-platform build system](http://www.youtube.com/watch?v=8Ut9o4OdSC0) that ever existed :-)
