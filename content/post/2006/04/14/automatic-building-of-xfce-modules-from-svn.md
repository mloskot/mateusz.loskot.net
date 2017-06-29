---
date: 2006-04-14 22:03:10
slug: automatic-building-of-xfce-modules-from-svn
title: Automatic building of Xfce modules from SVN
categories: [ "code" ]
---

![XFCE Logo](/images/logos/xfce-logo.jpg)A few days ago I moved from [GNOME](http://www.gnome.org) to smaller and faster desktop environment called [Xfce](http://www.xfce.org). GNOME is still my favourite desktop but it runs quite slowly even on new laptop with [AMD64 Turion](http://www.amd.com/us-en/Processors/ProductInformation/0,,30_118_12651,00.html) CPU and 512 MB of RAM. So, as a [GTK+](http://www.gtk.org) based UI fan, I found Xfce a very good replacement OF GNOME - _a tiny GNOME_. Usually, I prefer to be able to check newest features of software I use, so I decided to use development version of Xfce, available in the [Xfce Subversion repository](http://svn.xfce.org/svn/xfce/).






Yesterday, I wrote a small utility to control updating and building private sandboxes of Xfce modules. This is a small script I called **xfce-svn-builder.sh**. It can be used to do first checkout of Xfce sources. After all required modules are downloaded, the builder script can run all targets - _update - clean - configure - build - install_ - with just a single command.






The complete story together with usage instructions and download link can be found in the [Scripts](http://mateusz.loskot.net/software/scripts/) section, on the [xfce-svn-builder](http://mateusz.loskot.net/software/scripts/xfce-svn-builder/) dedicated page.

