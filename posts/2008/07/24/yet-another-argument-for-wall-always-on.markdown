---
comments: true
date: 2008-07-24 16:29:53
layout: post
slug: yet-another-argument-for-wall-always-on
title: Yet another argument for -Wall always on
wordpressid: 256
categories: programming
tags: -Wall,compiler,gcc,practice,printf,tips,warnings
---

Yes, I'm _religious about writing correct and standard C/C++ code_ and the decalogue of my religion tells _do not ignore compiler warnings_. Yet another pinch to the vast jar of examples is about getting detailed warning on mixed types in [printf](http://en.wikipedia.org/wiki/Printf) format specifiers:



`#include <stdio .h>
int main (void)
{
  printf ("%d", 0.0);
  printf ("%lu", 0u);
  printf ("%lu", sizeof 0);
  return 0;
}`



Building the test above with following three commands will answer why it's a good idea to _help the compiler to help us_:




  * gcc test.c


  * gcc [-Wformat](http://gcc.gnu.org/onlinedocs/gcc-4.1.2/gcc/Warning-Options.html#index-Wformat-207) test.c


  * gcc [-Wall](http://gcc.gnu.org/onlinedocs/gcc-4.1.2/gcc/Warning-Options.html#index-Wall-248) test.c



