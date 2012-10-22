---
comments: true
date: 2011-09-29 15:59:21
layout: post
slug: implicit-conversion-is-less-than-bless
title: Implicit conversion is less than bless
wordpressid: 2181
categories: programming
---

A quick example on how frivolous and to all appearances useful design of a C++ class can kick the rear aspect of your personality hard. In Unicode-enabled code using `wchar_t` as character data carrier:




    
    <code>#include <comutil.h>
    #include <sstream>
    int main()
    {
       std::wostringstream oss;
       _bstr_t str(L"abc"); 
       oss << str;
    }</code>





Now, remembering that `wchar_t` has made it into the C++ ages ago, hich version of `operator<<`` is called here?`





The example above is equivalent to the following code:




    
    <code>std::wostringstream oss;
    _bstr_t str(L"abc"); 
    oss << static_cast<char*>(str);</code>





Possibly, it is because of failure of template argument deduction as specified in [C++/14.8.2.1/4](http://www.open-std.org/jtc1/sc22/wg21/). I'd be interested to learn if this interpretation is correct or why, if it is not.
