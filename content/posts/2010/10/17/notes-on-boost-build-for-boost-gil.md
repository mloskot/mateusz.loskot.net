---
title: Notes on Boost.Build for Boost.GIL
date: 2010-10-17 04:54:38
category: code
slug: notes-on-boost-build-for-boost-gil
categories: programming
---

**Update:** [Updating Boost.Build extensions](/?p=2113)


Christian Henning, [Boost.GIL](http://www.boost.org/libs/gil) developer, has been working intensively on design and implementation of the new image I/O [extensions for Boost.GIL](http://code.google.com/p/gil-contributions/). It is Boost.GIL I/O v2. Official [review](http://www.boost.org/community/reviews.html) of this piece of software by the [Boost](http://boost.org) project Community is [coming soon](http://www.boost.org/community/review_schedule.html).


I have been playing with this new I/O lately myself and building it mostly using manually crafted solutions for Microsoft Visual Studio.
I decided to learn a bit more about the mysterious [Boost.Build](http://www.boost.org/doc/tools/build/index.html), so I can configure all Boost.GIL dependencies resolution in `Jamfile` and make testing process more portable.


Below, I include some notes of how I accomplished it. However, due to the cryptic nature of Boost.Build and my honest lack of understanding of this system, I have found my way through this configuration following bumpy path of trial and error. Thus, my findings may seem
weird to Boost.Build zealots and there surely is better way of doing it. Basically, I will use [Boost.Build extensions](http://svn.boost.org/svn/boost/sandbox/tools/build_extensions/) - a very nice project which has a chance to become [official part of the Boost.Build](http://lists.boost.org/Archives/boost/2010/10/171618.php).


Here is directories layout I used in the following configuration with base path tagged using `{DEV}`. So, wherever you see the `{DEV}` tag in examples below, just substitute it with your own location:

    
```
$ cd {DEV}
$ ls -1
build_extensions
deps
Jamroot
output
test_images
trunk
```


**First**, checkout sources of Boost C++ libraries from the trunk in the Subversion repository:


```
$svn co http://svn.boost.org/svn/boost/trunk trunk
```


**Second**, get copy of the Boost.Build extensions from the [Boost Sandbox](http://www.boost.org/community/sandbox.html) - a place for software closely related but not included in official Boost:

   
```
svn co http://svn.boost.org/svn/boost/sandbox/tools/build_extensions/ build_extensions
```


**Third**, configure a couple of environment variables to locate Boost.Build components:


```
$ export BOOST_BUILD={DEV}/trunk/tools/build/v2
$ export BOOST_BUILD_PATH={DEV}/build_extensions/ext
```


**Fourth**, grab source code of dependencies of Boost.GIL I/O extensions like [libjpeg](http://www.ijg.org/), [libpng](http://libpng.org/), [zlib](http://zlib.net/), [libtiff](http://www.remotesensing.org/libtiff/) and install them by repeating the following two-steps procedure:

    
```    
for library in (jpeg, libpng, zlib)
   download library
   unpack lib to {DEV}/deps
```


**Fifth**, get the new Boost.GIL I/O extensions. Current version at the moment of posting these notes is available as [boost_review.zip](http://code.google.com/p/gil-contributions/downloads/detail?name=boost_review.zip&can=2&q=) package. Unpack it and copy content of _boost_ directory in to _boost_ subtree - `{DEV}/trunk/boost`, content of _libs_ to `{DEV}/trunk/libs`. Basically, files of the GIL extensions should be installed in the following locations:

    
```
{DEV}/boost/gil/extension/io_new
{DEV}/trunk/boost/gil/extension/toolbox
{DEV}/trunk/libs/gil/io_new
```


**Sixth**, create empty `Jamroot` file:

```
$touch {DEV}/trunk/libs/gil/Jamroot
```


I found this file is required to not to confuse Boost.Build unnecessarily and without this file executing `bjam` throws a bunch of cryptic errors starting with:

    
```
trunk/tools/build/v2/build/virtual-target.jam:452: in _adjust-name from module object(file-target)@904
    error: @rulename is present but is not the only feature
```


**Finally**, create Jamfile building your program based on Boost.GIL with all image format libraries specified as dependencies. As a quick test, I have modified (shorten) `{DEV}/trunk/libs/gil/io_new/test/Jamfile.v2` to build one of tests for JPEG:

    
```    
$ cat {DEV}/trunk/libs/gil/io_new/test/Jamfile.v2
import testing ;
using jpeg : 6a : {DEV}/deps/jpeg-8a ;

project
    : requirements
        <library>/boost/test//boost_unit_test_framework
        <link>static
    ;

test-suite "gil::io_new"
    :
        [ run jpeg_read_test.cpp /ext/jpeg//jpeg ]
    ;
```


Quick check if the test program builds and runs:

    
```
$ bjam
...patience...
...
gcc.link bin/jpeg_read_test.test/gcc-4.4.5/debug/link-static/jpeg_read_test
testing.capture-output bin/jpeg_read_test.test/gcc-4.4.5/debug/link-static/jpeg_read_test.run
**passed** bin/jpeg_read_test.test/gcc-4.4.5/debug/link-static/jpeg_read_test.test
...updated 9 targets...
```


Note, that executing `bjam` will build all the third-party libraries from their sources, as dependencies of Boost.GIL, and next all targets of your own binaries being dependant on Boost.GIL. No extra _Jamfiles_ for _libjpeg_, _libpng_ and other libraries are required. Here simply the magic of Boost.Build and its extensions kicks in.


If you need to use other formats, you need to import other libraries as well. Like this:

    
```
using zlib : 1.2.4 : {DEV}/deps/zlib-1.2.4 ;
using png : 1.4.0 : {DEV}/deps/libpng-1.4.1 ;
```


As I have mentioned, I not an expert of Boost.Build but rather wigwaging through its matter. So, if you've found an error or better solution please let me know. At the same time, if you have problems with applying my notes, it may mean they don't present correct solution and I'd suggest rather to ask on the [Boost mailing lists](http://lists.boost.org/) or IRC channel [#boost](irc://irc.freenode.net/boost) than asking me.
