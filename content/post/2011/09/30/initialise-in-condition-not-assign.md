---
title: Initialise in condition, not assign
date: 2011-09-30 01:08:55
category: code
slug: initialise-in-condition-not-assign
categories: programming
---

I've read a lot of code polluted with assignments in condition:


``` 
T* p;
if (ptr = source())
{
    ...
}
else
{
    ...
}
```


Presumably, it is preferred of someone who is really after shortcuts in code. If you must cut short, reconsider it and at least write this:
    
```
if (T* p = source())
```


It is a perfect shortcut through several features at once: initialisation, condition and scope encapsulation. The scope of p is narrowed to the if-else condition only:

    
```
if (T* ptr = source())
{
    ...
}
else
{
    ...
}
```


And, it feels and works like [using statement in C#](http://msdn.microsoft.com/en-us/library/yh598w02%28v=VS.100%29.aspx). Perhaps that will convince C/C++ legacy crowd ;-)


Thanks to Jonathan Wakely from [ACCU](http://accu.org) for inspiring discussion(s).
