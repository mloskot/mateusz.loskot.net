---
date: 2007-03-08 18:25:37
slug: fun-in-the-open-source-code
title: Fun in the Open Source code
categories: [ "code" ]
---

[![Bug Icon by valessiobrito](/images/logos/valessiobrito_bug_icon.png)](http://openclipart.org/media/files/valessiobrito/2564)Sometimes reading a code of Open Source Software gives a lot of fun. Programmers put many different and weird things into blocks of comments. It's like a kind of source code blogging, isn't it :-). You can find jokes and funny sentences or sentences expressing anger on a mad manager who forced a developer to stay next 12 hours at work in front of debugger screen...





Today, I was browsing sources of the [OSGeo FDO Provider for OGR](http://fdo.osgeo.org/fdoogr/index.html) and I encountered one of these source code jokes. Here it is:


    
    const double OgrSpatialContextReader::GetZTolerance()
    {
        //zero tolerance!!! Yeah!!!!!!
        return 0.0;
    }








Now, I wonder if the value returned from this function is what a user usually expects **or** may be it's actually an expression (or better, a _materialization_) of programmer's _state of mind_ advertised here ;-) 
