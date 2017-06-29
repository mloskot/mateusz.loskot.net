---
date: 2006-08-17 14:20:28
slug: save-formatted-data-into-stdstring
title: Save formatted data into std::string
categories: [ "code" ]
---

Following short [C++](http://en.wikibooks.org/wiki/Programming:C_plus_plus) snippet presents how to format  number using string stream and save it to [std::string](http://en.wikibooks.org/wiki/C%2B%2B_Programming/String) object. It is an equivalent to the [sprintf](http://en.wikipedia.org/wiki/Printf#sprintf) function from C library.








    
    
    #include <iomanip>
    #include <iostream>
    #include <sstream>
    #include <string>
    #include <cstdio>
    
    int main()
    {
      const long num(789);
    
      // Format
      std::ostringstream os;
      os << std::setw(9)
           << std::setfill('0')
           << std::right
           << num;
    
      // Save
      std::string data(os.str());
    
      // Display
      std::cout << data << std::endl;
    
      return 0;
    }
    



