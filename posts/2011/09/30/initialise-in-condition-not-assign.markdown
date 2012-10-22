---
comments: true
date: 2011-09-30 01:08:55
layout: post
slug: initialise-in-condition-not-assign
title: Initialise in condition, not assign
wordpressid: 2190
categories: programming
---

I've read a lot of code polluted with assignments in condition:



    
    <code>T* p;
    if (ptr = source())
    {
        ...
    }
    else
    {
        ...
    }</code>/





Presumably, it is preferred of someone who is really after shortcuts in code. If you must cut short, reconsider it and at least write this:




    
    <code>if (T* p = source())</code>





It is a perfect shortcut through several features at once: initialisation, condition and scope encapsulation. The scope of p is narrowed to the if-else condition only:




    
    <code>if (T* ptr = source())
    {
        ...
    }
    else
    {
        ...
    }</code>/





And, it feels and works like [using statement in C#](http://msdn.microsoft.com/en-us/library/yh598w02%28v=VS.100%29.aspx). Perhaps that will convince C/C++ legacy crowd ;-)





Thanks to Jonathan Wakely from [ACCU](http://accu.org) for inspiring discussion(s).
