---
date: 2007-02-08 18:36:16
slug: about-handling-fdo-exceptions
title: About handling FDO exceptions
categories: none
---

Every one who has played with [Feature Data Objects](http://fdo.osgeo.org/) (FDO) using C++ knows that FDO uses exceptions pretty intensively. Therefore, it's important to understand how to [handle exceptions](http://en.wikipedia.org/wiki/Exception_handling) thrown by FDO properly and effectively. A good introductory about exceptions handling can be found in [The FDO Developer's Guide](http://fdo.osgeo.org/documentation.html) document, under _Development Practices_ and _Exception Handling_ nodes. I'll focus on practical examples here.







The first important thing to remember is that FDO uses its own _hierarchy of exceptions_ with [FdoException](http://fdo.osgeo.org/files/fdo/docs/FDO_API/db/dee/class_fdo_exception.html) class as a base. The FdoException does not use or depend on standard C++ exceptions with _std::exception_ base class and it has to be handled in FDO specific way - catch by pointer and released:



[cpp]try {
  // ... 
}
catch (FdoException* ex) {
  // Handling procedure (see below)
  ex->Release();
}[/cpp]



Second important thing and worth to remember is that FDO exceptions can nested. A source exception thrown in one place can be wrapped with new exception in _catch_ clause on some level and re-thrown away. The new exception with can be caught on an upper level, wrapped and re-thrown again. Every such repetition of this _wrap and re-throw_ operation nests source exception, together with associated message, in newly created. Here is a simple example presenting mechanism composing nested exceptions:



[cpp]try {
  try {
    try {
      throw FdoException::Create(L"First exception");
    }
    catch (FdoException* ex) {
      throw FdoException::Create(L"Second caused by first", ex);
    }
  }
  catch (FdoException* ex) {
      throw FdoException::Create(L"Third caused by second", ex);
  }
}
catch (FdoException* ex) {
  // Handling procedure (see below)
  ex->Release();
}[/cpp]



Finally, it's time to process queue of nested exceptions and output associated messages to a user. Below, catch clause completing the example above is presented. The output formatting is based on standard C++ streams:



[cpp]#include 
#include 
#include GetExceptionMessage()
        < < std::endl;
    
  FdoPtr cause(ex->GetCause());
  while(NULL != cause)
  {
    msg < < std::setw(++offset)
          << L"*** "
          << cause->GetExceptionMessage()
          < < std::endl;

    // get next exception from the queue
    cause = cause->GetCause();
  }
  ex->Release();

  std::wcout < < msg << std::endl;
}[/cpp]



The output message will look as follows:


    
    
    *** FDO FAILURE ***
      *** Third caused by second
       *** Second caused by first
        *** First exception
    





The first, root, exception is processed as last and the last re-thrown exception is processed as first. As it's observable, FDO nested exceptions are recorder in [LIFO](http://en.wikipedia.org/wiki/FIFO_and_LIFO_accounting) queue order.




I hope this short explanation will be helpful to understand FDO exceptions. By the way, if you have any questions or proposals of articles about using **Feature Data Objects with C++**, please [drop me a note](http://mateusz.loskot.net/contact/) about it. I'll do my best to give some writings and examples here, so anyone can read about it.
