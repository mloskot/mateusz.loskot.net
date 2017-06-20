---
date: 2005-09-20 16:39:09
slug: fresh-breeze-of-the-ubuntu-510-the-breezy-badger
title: Fresh breeze of the Ubuntu 5.10
categories: none
category: code
---

About two weeks ago I got new laptop - Acer Aspire 5021. Nice gadget for fun and work. Because 3 months ago I moved from Debian to Ubuntu 5.04 _Hoary_ I decided to install Ubuntu on my new laptop too. Before Acer I used Aristo (ASUSTek-like) laptop. It was PIII 700MHz with 256+128 MB RAM. Not a rocket at all. On this Aristo FT-9550 I also run Slackware. I haven't said, but my first Linux distribution was Slackware - the beauty of simplicity. I stop using Slackware because of TGZ packages. I needed to have possibility to update my system frequently from the Net, that's why I felt in love with debs.

I planned to do fresh installation so I needed some breeze and I got it.
It came through an open window in my flat and it is called Ubuntu 5.10 "The Breezy Badger".

I downloaded [Ubuntu 5.10 (Breezy Badger) Preview](http://se.releases.ubuntu.com/5.10/) ISO image. First installer run and crash, second installer run and crash again. I tried 4-5 times but it still crashed at the same stage - copying packages to the hard drive. All crashes occured at different percentage of operation. Here is my post with deeper explanation of this problem [Breeze installation hangs on copying packages ](http://ubuntuforums.org/showthread.php?t=66581). Someone adviced me to check CD integrity and I did so, no problems detected. I'll submit some but report on the [Ubuntu Bugzilla](https://bugzilla.ubuntu.com).

So, what am I gonna to do?
There is still old-good Ubuntu Hoary CD in my desk - "Hoary" the Great please come and help.
Shortly, I installed Ubuntu Hoary first. Then, after first boot, I edited ```/etc/apt/sources.list``` to 
use Breezy repositiories (the procedure is explained in the [Hoary 5.04 Guide](http://ubuntuguide.org)).
Next, I executed well-known magic commands:

```
$ sudo apt-get update
$ sudo apt-get dist-upgrade
```

and I went to make a big coffee.
After about 2 and 1/2 hours I got nice smelling Ubuntu 5.10 "The Breezy Badger".

Here are a few [screenshots](http://mateusz.loskot.net/gallery/ubuntu-breezy) from Ubuntu 5.10 first boot.
They are pretty standard, for all first boots :-)
