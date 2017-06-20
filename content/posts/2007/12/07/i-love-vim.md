---
date: 2007-12-07 02:34:50
slug: i-love-vim
title: I love Vim
categories: programming
---

![Vim logo](/images/logos/vim-logo.gif)...for its bloody powerful simplicity that fits Unix philosophy and toolset very well and helps to achieve less and more complex tasks in very intuitive way.





Let's say I need to find details of all test cases in GDAL autotest package referring to GetNoDataValue method of Band class from Python bindings:


    
    
    $ cd autotest
    $ grep -l GetNoDataValue *.py | xargs gvim
    



All files answering the filter are loaded to Vim:
 
[![batch-open-in-gvim](http://farm3.static.flickr.com/2340/2091734603_903ecbdb83_m.jpg)](http://www.flickr.com/photos/mloskot/2091734603/)






I've seen may questions on the Usenet what's the best IDE for Unix, especially comparable to Visual Studion and in most cases nothing well-working came out. Means, there is no such IDE for Unix. My answer is: Unix, with its astronomical number of small tools, is a perfect IDE, so nobody intends to develop anything like that.
