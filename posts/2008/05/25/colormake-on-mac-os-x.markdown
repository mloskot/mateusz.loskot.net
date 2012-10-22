---
comments: true
date: 2008-05-25 10:42:49
layout: post
slug: colormake-on-mac-os-x
title: colormake on Mac OS X
wordpressid: 247
categories: programming
tags: colormake,gcc,make,perl,script,shell,utility
---

I have just discovered [colormake](http://bre.klaki.net/programs/colormake/) utility - a simple wrapper around [make](http://www.gnu.org/software/make/) to colorize its output.





colormake is really helpful for someone who heavily works in [Unix shell](http://en.wikipedia.org/wiki/Unix_shell) environments to visually analyse messages generated during programs compilation. Simply, colors are used as another _language_ for communication with a user, complementing letters printed out to the console. The colormake wrapper in combination with clean console fonts like [Terminus](http://mateusz.loskot.net?p=223/) serve as a great tandem in hacker daily job.





First, I started to use _colormake 0.2_ on [Ubuntu Linux](http://www.ubuntu.com/): 
    
    $ sudo apt-get install colormake





Next, I tried it on Mac OS X 10.5, though with no luck. Basically, because of subtle differences in [Bash](http://en.wikipedia.org/wiki/Bash) and format of [GCC](http://gcc.gnu.org/) output messages. So, simple patch ([colormake-0.2-mloskot.patch](/download/patches/colormake-0.2-mloskot.patch)) is required to get _colormake 0.2_ working on Mac OS X. I've sent this patch to [Bjarni](http://bre.klaki.net/) - the author of colormake, so perhaps he will like to include it in next (0.3?) version. BTW, thanks to Bjarni for the colormake tool!
