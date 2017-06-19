---
title: Python sys.stdout redirection in C++
date: 2011-12-01 01:30:25
category: code
comments: true
layout: post
slug: python-sys-stdout-redirection-in-cpp
wordpressid: 2819
categories: open source,programming
tags: api,c++,embedding,extending,interpreter,lambda,python,stdout,sys
---

Lately, I have been [embedding Python interpreter](http://docs.python.org/py3k/extending/embedding.html) and implementing plenty of Python extensions in C++ using [plain C API](http://docs.python.org/py3k/c-api/index.html) provided by Python 3. One of common challenges at C/C++ level is to intercept output sent to `sys.stdout` or `sys.stderr` by Python functions like `print`. [Python Embedding/Extending FAQ](http://docs.python.org/py3k/faq/extending.html) suggests common solution based on Python code:


``` 
# catcher code
import sys
class StdoutCatcher:
   def __init__(self):
      self.data = ''
   def write(self, stuff):
      self.data = self.data + stuff
catcher = StdoutCatcher()
sys.stdout = catcher
```


This Python code can be executed by embedded Python interpreter using `PyRun_SimpleString`, then the output can be accessed by fetching `__main__` module attributes:


```
PyObject* m = PyImport_AddModule("__main__");
char const* code = "... catcher code here...";
PyRun_SimpleString(code);
PyRun_SimpleString("print(3.14)");
PyObject* catcher = PyObject_GetAttrString(m, "catcher");
PyObject* output = PyObject_GetAttrString(catcher, "data");
// get textual data contained in output
```


Such mix of Python and C code is neither convenient to use nor states a flexible solution. I simply don't like this prosthesis, especially if I need to frequently switch between number output sinks.


So, I have come up with better solution which allows me to directly bind any callable C++ entity. The syntax I mean looks and feels like this:

    
```
int main()
{
    PyImport_AppendInittab("emb", emb::PyInit_emb);
    Py_Initialize();
    PyImport_ImportModule("emb");

    PyRun_SimpleString("print(\'hello to console\')");

    // here comes the ***magic***
    std::string buffer;
    {
        // switch sys.stdout to custom handler
        emb::stdout_write_type write = 
            [&buffer] (std::string s) { buffer += s; };

        emb::set_stdout(write);
        PyRun_SimpleString("print(\'hello to buffer\')");
        PyRun_SimpleString("print(3.14)");
        PyRun_SimpleString("print(\'still talking to buffer\')");
        emb::reset_stdout();
    }

    PyRun_SimpleString("print(\'hello to console again\')");
    Py_Finalize();

    // output what was written to buffer object
    std::clog << buffer << std::endl;
}
```

    
This allows me to handle `sys.stdout.write` with C++ free function, class member function, named function objects or even anonymous functions as in the example above where I use [C++11 lambda](http://en.wikipedia.org/wiki/C%2B%2B11).


Complete implementation of the `emb` module in C/C++ using plain Python C API is available from my [Python workshop at GitHub](https://github.com/mloskot/workshop/tree/master/python):


```
git clone git://github.com/mloskot/workshop.git
```


The complete code is enclosed in [python/emb/emb.cpp](https://github.com/mloskot/workshop/blob/master/python/emb/emb.cpp) file. Note, this is a minimal example to present the essential concept. In production-ready code, it certainly needs more attention around reference counting of PyObject, getting rid of global state, and so one.
