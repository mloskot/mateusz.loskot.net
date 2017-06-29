---
date: 2008-01-23 20:02:02
slug: a-bug-in-stdbasic_istream-from-visual-c
title: A bug in std::basic_istream from Visual C++
categories: [ "code" ]
  c++,visual studio
---

**Update:** I submitted this problem to the Microsoft [Connect](https://connect.microsoft.com/default.aspx) and the Feedback ID is [323765](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=323765)





I believe I found a bug in Visual C++ implementation of the [C++ Standard Library](http://www.josuttis.com/libbook/) (AFAIR, it's provided by [Dinkumware,Ltd.](http://www.dinkumware.com/)). This is my first trove of that kind in Visual C++, thus I should exclaim **Hurray!** ;-). The C++ library discussed here is shipped with Visual C++ 8.0 compiler from the Visual Studio 2005 Professional.





Shortly, in the [std::basic_istream](http://msdn2.microsoft.com/en-us/library/x5507bd0.aspx) class, implementation of input operator overloaded for _unsigned long_ with Microsoft specific modifier [__w64](http://msdn2.microsoft.com/en-us/library/s04b5w00.aspx) consists of incorrect cast from reference to non-const to _unsigned long_, a nonreference type - [rvalue](http://www.devx.com/tips/Tip/5696).





Here is the buggy implementation copied (stripping unimportant lines) from the <[istream](http://msdn2.microsoft.com/en-us/library/5cy6dc9z.aspx)> header, by default installed in _c:\program files\microsoft visual studio 8\vc\include\istream_, near **lines 309-326**:


    
    
    _Myt& operator>>(unsigned long __w64& _Val)
    { // extract an unsigned long
      ios_base::iostate _State = ios_base::goodbit;
      const sentry _Ok(*this);
    
      if (_Ok)
      {  // state okay, use facet to extract
         const _Nget& _Nget_fac = _USE(ios_base::getloc(), _Nget);
    
         _Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
            *this, _State, (unsigned long)_Val);
      }
    
      _Myios::setstate(_State);
      return (*this);
    }








In the code above, bug is in the line where [std::num_get](http://msdn2.microsoft.com/en-us/library/b5k1kd13.aspx)::get function is called. The 5th parameter is casted from reference to nonreference type:

    
    (unsigned long)_Val



and, from the [C++ Language Standard](http://www.open-std.org/jtc1/sc22/wg21/)/3.10:



> 6 An expression wich holds a temporary object resulting from a cast to a nonreference type is an rvalue.



Next, the _std::num_get::get_ function call tries to bind the rvalue to reference to non-const type, according to its prototype:


    
    
    // C++ Standard/22.2.2.1 - std::num_get class members
    _InIt get(_InIt _First, _InIt _Last,
      ios_base& _Iosbase, ios_base::iostate& _State,
      unsigned long& _Val)



However, the C++ Standard/8.5.3 defines that



> the reference shall be to a non-volatile const type.





### Solution




The simplest solution is to fix the invalid cast, so the buggy line:


    
    _Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
      *this, _State, (unsigned long)_Val);



reads 


    
    _Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
      *this, _State, (unsigned long&)_Val);



alternatively, it's also possible to completely remove the cast of __Val_ object.





By the way, if you want to keep your C++ programs portable, it's a good idea to disable Visual C++ language extensions using compiler option [/Za](http://msdn2.microsoft.com/en-us/library/0k0w269d(VS.71).aspx).
