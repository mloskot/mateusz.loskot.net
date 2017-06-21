---
date: 2009-03-06 12:24:28
slug: vector-of-function-pointers
title: vector of function pointers
categories: programming
---

This is just a small tip on how to define a vector of function pointers in C++ and how to call functions stored in it:




    
    <code>#include <vector>
    #include <iostream>
    
    typedef int (*fptr)(int, int);
    int foo(int a, int b) { return a + b; }
    int bar(int a, int b) { return a * b; }
    
    int main()
    {
        std::vector<fptr> f;
        f.push_back(foo);
        f.push_back(bar);
    
        std::cout << f[0](2, 3)
            << f[1](2, 3)
            << std::endl;
        return 0;
    } </code>





That's it. Next, this example could be extend to replace old-fashion function pointers with [function objects](http://en.wikipedia.org/wiki/Function_object).
