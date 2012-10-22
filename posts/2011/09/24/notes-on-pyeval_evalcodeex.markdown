---
comments: true
date: 2011-09-24 22:45:57
layout: post
slug: notes-on-pyeval_evalcodeex
title: Notes on PyEval_EvalCodeEx
wordpressid: 2174
categories: programming
---

Recently, I tried to [figure out](http://mail.python.org/pipermail/python-list/2011-September/1280749.html) what is the actual result of [PyEval_EvalCodeEx](http://docs.python.org/release/3.2/c-api/veryhigh.html#PyEval_EvalCodeEx) call from the [Python C API](http://docs.python.org/release/3.2/c-api/). The documentation is less than sparse. Obviously, the function returns result of expression evaluation. The result is returned as pointer to `PyObject`, but the type has a bit opaque nature, so means nothing without querying and inspecting underlying data.





Luckily, I have received a couple of answers on the Python mailing list as well as from [ACCU](http://accu.org) folks . Here is very quick summary of the `PyEval_EvalCodeEx` function:







  * first and foremost, know C as well as Python


  * it evaluates an expression, any valid Python expression


  * it wraps the builtin `eval()`


  * its return value is exactly the same as the return value of an equivalent call to the `eval()`


  * if the `PyObject *co` argument was compiled with start argument `Py_eval_input` denoting a single expression, the function returns value produced as the result of the expression


  * if `Py_file_input` or `Py_single_input` compilation mode was used, then the result of will be `Py_None`


  * it returns `PyObject*`, so - as [Russel Winder](http://www.russel.org.uk/) suggested - Do type analysis regarding the object being pointed at you have to do it the hard way! PyObject_IsInstance, or if you are eeling really hard :-) PyObject_Type. There is also PyPobject_TypeCheck.





I can't do it now, but I'm going to check if all those statements are correct.
