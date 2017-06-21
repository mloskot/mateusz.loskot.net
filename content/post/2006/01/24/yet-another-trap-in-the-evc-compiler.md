---
date: 2006-01-24 21:45:42
slug: yet-another-trap-in-the-evc-compiler
title: Yet another trap in the eVC++ compiler
categories: programming
---


Today, I was porting a fairly big library to use it on [Windows CE](http://msdn.microsoft.com/embedded/windowsce/default.aspx). I created a library project with [eVC++ 4.0](http://msdn.microsoft.com/embedded/downloads/ce/default.aspx) then added source files of the library and with pretty smile on my face I hit F7. Then I was pelted with huge amount of error messages :-( Shortly, I revealed where was the problem. I thought it will bowl over everything I planned! I took a deep breath and... Simply, eVC++ 4.0 compiler, as well as [VC++ 6.0](http://msdn.microsoft.com/visualc/previous/vc6/default.aspx) (and earlier), **does not support in-place initialization of static const member data of class**!







So, following code can not be compiled with eVC++ 4.0:
`class A
{
public:
	static const int counter = 123;
};
`
There are two workarounds: use enum defined inside your class or instantiate static const member outside the class. The later is my prefered solution:
`class A
{
public:
	static const int counter; //  = 123;
};
const int A::counter = 123;
`
IMHO, this version is more consistent with how non-const static data members of class are initialized - [outside the class](http://www.parashift.com/c++-faq-lite/ctors.html#faq-10.10).






After I realized where is the problem and did backport changes in about 60 lines of ported library code I found that it's known issue and it's already reported in KB as
[Error C2258 and error C2252 occur if you try to perform in-place initialization of static const integral member data in Visual C++](http://support.microsoft.com/kb/241569/PL/). So, be watchful when playing with modern C++ code on old compiler :-)

