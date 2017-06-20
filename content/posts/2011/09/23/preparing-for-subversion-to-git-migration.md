---
title: Preparing for Subversion to Git migration
date: 2011-09-23 02:01:24
category: code
slug: preparing-for-subversion-to-git-migration
categories: programming
---

[GEOS](http://trac.osgeo.org/geos/) is slowly [moving to Git](http://lists.osgeo.org/pipermail/geos-devel/2011-September/005455.html), so I decided to clear the Subversion specific settings, namely the svn:keywords. The procedure is quick and based on the commands I used to perform [bulk svn:keywords property update](http://mateusz.loskot.net/?p=168).


First, svn:keywords property is removed:

    
```    
find . -path '*/.svn' -prune -o -type f -print  | xargs svn propdel -q svn:keywords
```


Next, line consisting of `$Id$` keyword is stripped from every plain text file using a tiny script coded in Python:

    
```
    #! /usr/bin/env python
    import fileinput
    import re
    import sys
    
    def strip_line(filename, rx):
        sys.stderr.write(filename + '\n')
        for line in fileinput.input(filename, inplace=1):
            m = re.match(rx, line)
            if m is None:
                sys.stdout.write(line)
            else:
                sys.stderr.write(line)
    
    if len(sys.argv) < 2:
        sys.exit("Missing filename")
    
    pattern = '^.*\$Id.*$'
    rx = re.compile(pattern, re.DOTALL)
    strip_line(sys.argv[1], rx)
```


The script is executed for every file, excluding the working copy admin area in  `.svn`:


```    
for f in `find . -path '*/.svn' -prune -o -type f -print`; do ~/bin/strip_line_regex.py $f; done;
```


Voila!


**Update**: Torvalds answers [Does GIT has vc keywords like CVS/Subversion?](http://www.gelato.unsw.edu.au/archives/git/0610/28891.html)
