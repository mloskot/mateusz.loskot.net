---
title: 'Eclipse 4.2 throwing gtk_widget_real_map: assertion failed'
date: 2012-09-14 22:04:53
category: code
slug: eclipse-4-2-throwing-gtk_widget_real_map-assertion-failed
comments: true
layout: post
wordpressid: 2948
categories: programming
tags: c++,cdt,eclipse,ide
---

Inspired by [Eclipse](http://eclipse.org/) and [CDT](http://www.eclipse.org/cdt/) recommendations [posted recently](http://lists.boost.org/Archives/boost/2012/09/196248.php) to Boost mailing list, I decided to give it a try.




I followed the [Arch way](https://wiki.archlinux.org/index.php/Eclipse) and installed [eclipse](https://www.archlinux.org/packages/?name=eclipse) 4.2 (Juno) and [eclipse-cdt](https://www.archlinux.org/packages/?name=eclipse-cdt) 8.1.0 from packages. Quick test with basic hello world! C++ project left me disillusioned.





As soon as I hit the Finish button in C++ project wizard, Eclipse window disappeared. It's was a crash. I re-launched and opened the previously created project, but Eclipse indicated the Java perspective. So, I tried to open the C/C++ perspective. Crash, again. This time I caught some output:




    
    mloskot@dog ~ $ eclipse
    **
    Gtk:ERROR:gtkwidget.c:8854:gtk_widget_real_map: assertion failed: (gtk_widget_get_realized (widget))
    





Anyone's got any idea what's wrong?
