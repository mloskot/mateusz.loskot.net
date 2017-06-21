---
date: 2008-07-31 01:52:02
slug: libgeotiff-lesson-for-today
title: libgeotiff lesson for today
categories: programming
---

Doing final tests of [libLAS](http://liblas.org/) on Linux (Ubuntu 7.04), before [Hobu](http://hobu.biz/) will release 1.0.0, I attempted to build it with latest [libgeotiff 1.2.5](/?p=260). I moved my fingers on keyboard and did _./configure && make_, shortly then I saw strange looking error message:




    
    /usr/bin/ld: makegeo: hidden symbol `__stack_chk_fail_local' in /usr/lib/libc_nonshared.a(stack_chk_fail_local.oS) is referenced by DSO
    /usr/bin/ld: final link failed: Nonrepresentable section on output
    collect2: ld returned 1 exit status





Google is your friend, so in a few seconds I knew what's going wrong. _./configure_ sets Makefile to call _ld -shared_. However, it does not work with [GCC 4](http://gcc.gnu.org/gcc-4.3/porting_to.html), because _ld_ linker does not include all required references to other shared libraries. Simply, GCC linker driver seems to handle shared references better, than bare _ld_.





The conclusion is, that if you use GCC 4.x and you want to build libgeotiff, configure it this way:




    
    ./configure --with-ld-shared="gcc -shared"





**Update July 31, 2008**: Another solution is to add _-fno-stack-protector_ option to CFLAGS and CXXFLAGS. Regarding Ubuntu Linux, this issue seems to be related to [enabled SSP support](https://launchpad.net/ubuntu/+spec/gcc-ssp) (see also [Ubuntu Wiki](https://wiki.ubuntu.com/GccSsp)) available in GCC 4.1.
