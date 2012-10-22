---
comments: true
date: 2009-08-22 17:45:04
layout: post
slug: compilation-of-virtualbox-addins-for-ubuntu-910
title: Compilation of VirtualBox add-ins for Ubuntu 9.10
wordpressid: 887
categories: programming
tags: '#4823,2.6.31,guest,ide,kernel,linux,microsoft,os,patch,ticket,trac,ubuntu,utf8,virtualbox,visual
  c++,visual studio,windows'
---

I've been using the upcoming [Ubuntu 9.10](https://wiki.ubuntu.com/KarmicKoala) installed as a guest system on [VirtualBox](http://en.wikipedia.org/wiki/VirtualBox) for a while without any big problems. After one of big updates I found that currently under development [2.6.31](http://kernel.org) kernel version was installed. So, I decided to rebuild [VirtualBox Guest Additions](http://www.virtualbox.org/wiki/VirtualBox) and it failed. Digging the logs helped me to find out what was the problem:




    
    /home/mloskot/tmp/vbox/linux/module/vboxvfs/utils.c:423: error: implicit declaration of function utf8_mbtowc


 


Should be simple to fix. However, it seems that signatures of [nls.h](http://lxr.kelp.or.kr/source/include/linux/nls.h) functions in the kernel [have changed](http://lkml.indiana.edu/hypermail/linux/kernel/0904.3/03172.html) or have been moved to new place which I have no idea about. I'm not a kernel developer but I like to dig codes. Thus, I unpacked the VirtualBox installer, found the victim - `utils.c` and applied a very ugly fix:




    
    extern int utf8_mbtowc(wchar_t*, const __u8*, int);
    extern int utf8_wctomb(__u8*, wchar_t, int);





At least, it allowed me to compile and install the VirtualBox additions. I haven't notice any run-time issues. I have reported this problem back to the [VirtualBox](http://www.virtualbox.org/report/15) as its code may need to be updated: [#4823 (Missing declaration of utf8_mbtowc function in utils.c)](http://www.virtualbox.org/ticket/4823). So far, so good.



