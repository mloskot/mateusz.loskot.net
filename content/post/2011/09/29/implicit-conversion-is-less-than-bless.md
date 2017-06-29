---
title: Implicit conversion is less than bless
date: 2011-09-29 15:59:21

slug: implicit-conversion-is-less-than-bless
categories: [ "code" ]
---

A quick example on how frivolous and to all appearances useful design of a C++ class can kick the rear aspect of your personality hard. In Unicode-enabled code using `wchar_t` as character data carrier:

    
```
#include <comutil.h>
#include <sstream>
int main()
{
   std::wostringstream oss;
   _bstr_t str(L"abc"); 
   oss << str;
}
```


Now, remembering that `wchar_t` has made it into the C++ ages ago, hich version of `operator<<`` is called here?`


The example above is equivalent to the following code:

    
```
std::wostringstream oss;
_bstr_t str(L"abc"); 
oss << static_cast<char*>(str);
```


Possibly, it is because of failure of template argument deduction as specified in [C++/14.8.2.1/4](http://www.open-std.org/jtc1/sc22/wg21/). I'd be interested to learn if this interpretation is correct or why, if it is not.
