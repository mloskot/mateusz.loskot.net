---
title: Exceptions to error codes translation made simple
date: 2010-01-15 00:33:05

slug: exceptions-to-error-codes-translation-made-simple
categories: [ "code" ]
---

On many occasions, it is not possible or it's even forbidden to let an exception thrown to sneak out of a function. On many occasions, it is necessary to sink all exceptions in place where they may occur and translate exceptions thrown to error codes. I have observed it's not uncommon software projects stick to some rules about how they [handle exceptions](http://en.wikipedia.org/wiki/Exception_handling), like:

* I'm sorry, I don't like the fat & slow hippo [RTTI](http://en.wikipedia.org/wiki/Run-time_type_information) (BTW, [hippo](http://en.wikipedia.org/wiki/Hippopotamus) can run 50 km/h!).
* My function, class, library never ever throws exceptions.
* I use exceptions to signal error conditions only from and within internal components, but never let them to cross the line drawn by [public interfaces](http://en.wikipedia.org/wiki/Public_interface).
* I write [C wrapper for C++ library](http://www.epsilon-delta.net/articles/vc6_stl.html#c-wrapper-for-c-classes-one-way-to-do-it), I have to translate exceptions to error codes.
* Exceptions? I have no idea who was mad enough to invent such a $%&@ beast. Forget!


Shortly, not for everyone exceptions are kosher, gluten and lactose-free meals.


Even if exceptions are not kosher, it is necessary to love & deal with them because...use of standard library elements or 3rd-party components which may throw, coding conventions ignorance within a team, just-in-case prevention, etc. Handling exceptions may make code very messy (check how [Java camp deals database connection problems](http://accu.org/index.php/journals/1563)). It is possible to handle exceptions and maintain clean code.


> Any fool can write code that a computer can understand. Good programmers write code that humans can understand.

-- [Martin Fowler](http://www.refactoring.com/)


Below is a [simple example](http://codepad.org/XYZwZGWO) showing how to solve some of the problems pointed above. The basic idea is to implement one-for-all exceptions handler where all types of exceptions possible to be thrown are killed and translated to specified error code, exceptions have chance to send S.O.S. code before [sinking](http://www.youtube.com/watch?v=yR0lWICH3rY).

```
#include <cassert>
#include <exception>
#include <iostream>
#include <stdexcept>

template <typename T>
inline T const& handle_exception(char const* const who, T const& rc)
{
    try
    {
        throw;
    }
    catch (int e)
    {
        std::cerr << who << " caught int: " << e << std::endl;
    }
    catch (char const* e)
    {
        std::cerr << who << " caught c-string: " << e << std::endl;
    }
    catch (std::exception const& e)
    {
        std::cerr << who << " caught std::exception: " << e.what() << std::endl;
    }
    return rc;
}

#define EXCEPTION_TRY() \
    try {

#define EXCEPTION_CATCH_AND_RETURN(success, failure) \
    } catch (...) { \
        return handle_exception(__FUNCTION__, failure); \
    } \
    return success;

// use it to exit void function on error
#define EXCEPTION_CATCH_AND_EXIT() \
    } catch (...) { handle_exception(__FUNCTION__, false); \
    return; }

template <typename T>
class number
{
public:
    // public ctor, may throw
    number(T value) : value_(value)
    {
        if (value != value)
            throw "value is NaN";
    }

    // public save division, never throws
    bool divide_s(double& result, T const& den) const
    {
        EXCEPTION_TRY()
        result = divide_(value_, den);
        EXCEPTION_CATCH_AND_RETURN(true, false)
    }

private:
    T value_;
    // used internally by private methods, allowed to throw
    double divide_(T const& num, T const& den) const
    {
        if (den > 0)
        {
            return num / den;
        }
        throw std::invalid_argument("denominator is zero");
    }
};

// C wrapper is not allowed to throw exceptions
double divide_numbers(double num, double den)
{
    EXCEPTION_TRY()

    number<double> n(num);
    double r = 0;
    n.divide_s(r, den);

    EXCEPTION_CATCH_AND_RETURN(true, false)
}

int main()
{
    bool success(false);
    double result(0);

    // Using C++ interface
    {
        number<int> n(10);
        // no error logged
        success = n.divide_s(result, 2);
        assert(success);
        // error logged, error code returned
        success = n.divide_s(result, 0);
        assert(!success);
    }
    // Using C interface
    {
        // no error logged
        result = divide_numbers(10, 2);
        // error logged
        result = divide_numbers(10, 0);
        // error logged
        float nan = 0;
        result = divide_numbers(nan / 0, 10);
    }
}
```
    

It's simple and not ideal, but it did the job very well for myself and number libraries. Certainly, there are is a room for improvements. The logging mechanism is a simple one. It's a good idea to add [catch](http://en.wikipedia.org/wiki/Exception_handling_syntax) clauses for other types, even for `int`, especially if one has to deal with `throw __LINE__;` signals.


There is a lot of [<del>google</del>](http://eu.techcrunch.com/2009/11/24/google-analytics-illegal-germany/)findable articles and books one can buy. Here is the (incomplete) list of favourites guidelines:

* [Error and Exception Handling](http://www.boost.org/community/error_handling.html) guidelines from [Boost](http://boost.org)
* [Exception Safety and Exception Specifications: Are They Worth It?](http://www.gotw.ca/gotw/082.htm) by [Herb Sutter](http://herbsutter.wordpress.com/)
* [Lessons Learned from Specifying Exception-Safety for the C++ Standard Library](http://www.boost.org/community/exception_safety.html) by [David Abrahams](http://en.wikipedia.org/wiki/David_Abrahams_%28computer_programmer%29)
* [Design Guidelines Update: Exception Throwing](http://blogs.msdn.com/kcwalina/archive/2005/03/16/396787.aspx) and [Should Exceptions Carry Error Code Information](http://blogs.msdn.com/kcwalina/archive/2005/05/27/422681.aspx) by [Krzysztof Cwalina](http://blogs.msdn.com/kcwalina/default.aspx)
* Think [RAII](http://en.wikipedia.org/wiki/Resource_Acquisition_Is_Initialization) and you will no longer need to implement [destructor](http://en.wikipedia.org/wiki/Destructor) for your types.


Thanks to wonderful [ACCU](http://accu.org) folks for a very interesting brainstorm on similar topic we had one day. Comments,  improvements and bug reports would be greatly appreciated.
