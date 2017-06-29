---
title: Python WTF of the day
date: 2011-09-22 16:34:15

slug: python-wtf-of-the-day
categories: [ "code" ]
---

Update: The rant has been [suspended](https://twitter.com/#!/mateuszloskot/status/117001180999196672), temporarily.


The code speaks for itself:

    
```
>>> class A:
...     def foo(a, ):
...             pass
...
>>>
>>> a = A()
>>> a.foo()
>>> a.foo(1)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: foo() takes exactly 1 positional argument (2 given)
>>>
```


I confess, I am a Python newbie. I climb the rocky curve of the Python C API for the first time trying to write custom Python generators. I still know very little about Python. This is not the last time Python's bitten me ass.
