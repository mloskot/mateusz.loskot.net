---
comments: true
date: 2010-01-15 00:33:05
layout: post
slug: exceptions-to-error-codes-translation-made-simple
title: Exceptions to error codes translation made simple
wordpressid: 1681
categories: programming
tags: c++,error,exception,return code,std::exception,throw
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




    
    <span class="cp">#include <cassert></span>
    <span class="cp">#include <exception></span>
    <span class="cp">#include <iostream></span>
    <span class="cp">#include <stdexcept></span>
    
    <span class="k">template</span> <span class="o"><</span><span class="k">typename</span> <span class="n">T</span><span class="o">></span>
    <span class="kr">inline</span> <span class="n">T</span> <span class="k">const</span><span class="o">&</span> <span class="n">handle_exception</span><span class="p">(</span><span class="kt">char</span> <span class="k">const</span><span class="o">*</span> <span class="k">const</span> <span class="n">who</span><span class="p">,</span> <span class="n">T</span> <span class="k">const</span><span class="o">&</span> <span class="n">rc</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="k">try</span>
        <span class="p">{</span>
            <span class="k">throw</span><span class="p">;</span>
        <span class="p">}</span>
        <span class="k">catch</span> <span class="p">(</span><span class="kt">int</span> <span class="n">e</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="n">std</span><span class="o">::</span><span class="n">cerr</span> <span class="o"><<</span> <span class="n">who</span> <span class="o"><<</span> <span class="s">" caught int: "</span> <span class="o"><<</span> <span class="n">e</span> <span class="o"><<</span> <span class="n">std</span><span class="o">::</span><span class="n">endl</span><span class="p">;</span>
        <span class="p">}</span>
        <span class="k">catch</span> <span class="p">(</span><span class="kt">char</span> <span class="k">const</span><span class="o">*</span> <span class="n">e</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="n">std</span><span class="o">::</span><span class="n">cerr</span> <span class="o"><<</span> <span class="n">who</span> <span class="o"><<</span> <span class="s">" caught c-string: "</span> <span class="o"><<</span> <span class="n">e</span> <span class="o"><<</span> <span class="n">std</span><span class="o">::</span><span class="n">endl</span><span class="p">;</span>
        <span class="p">}</span>
        <span class="k">catch</span> <span class="p">(</span><span class="n">std</span><span class="o">::</span><span class="n">exception</span> <span class="k">const</span><span class="o">&</span> <span class="n">e</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="n">std</span><span class="o">::</span><span class="n">cerr</span> <span class="o"><<</span> <span class="n">who</span> <span class="o"><<</span> <span class="s">" caught std::exception: "</span> <span class="o"><<</span> <span class="n">e</span><span class="p">.</span><span class="n">what</span><span class="p">()</span> <span class="o"><<</span> <span class="n">std</span><span class="o">::</span><span class="n">endl</span><span class="p">;</span>
        <span class="p">}</span>
        <span class="k">return</span> <span class="n">rc</span><span class="p">;</span>
    <span class="p">}</span>
    
    <span class="cp">#define EXCEPTION_TRY() \</span>
    <span class="cp">    try {</span>
    
    <span class="cp">#define EXCEPTION_CATCH_AND_RETURN(success, failure) \</span>
    <span class="cp">    } catch (...) { \</span>
    <span class="cp">        return handle_exception(__FUNCTION__, failure); \</span>
    <span class="cp">    } \</span>
    <span class="cp">    return success;</span>
    
    <span class="c">// use it to exit void function on error</span>
    <span class="cp">#define EXCEPTION_CATCH_AND_EXIT() \</span>
    <span class="cp">    } catch (...) { handle_exception(__FUNCTION__, false); \</span>
    <span class="cp">    return; }</span>
    
    <span class="k">template</span> <span class="o"><</span><span class="k">typename</span> <span class="n">T</span><span class="o">></span>
    <span class="k">class</span> <span class="nc">number</span>
    <span class="p">{</span>
    <span class="k">public</span><span class="o">:</span>
        <span class="c">// public ctor, may throw</span>
        <span class="n">number</span><span class="p">(</span><span class="n">T</span> <span class="n">value</span><span class="p">)</span> <span class="o">:</span> <span class="n">value_</span><span class="p">(</span><span class="n">value</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="k">if</span> <span class="p">(</span><span class="n">value</span> <span class="o">!=</span> <span class="n">value</span><span class="p">)</span>
                <span class="k">throw</span> <span class="s">"value is NaN"</span><span class="p">;</span>
        <span class="p">}</span>
    
        <span class="c">// public save division, never throws</span>
        <span class="kt">bool</span> <span class="n">divide_s</span><span class="p">(</span><span class="kt">double</span><span class="o">&</span> <span class="n">result</span><span class="p">,</span> <span class="n">T</span> <span class="k">const</span><span class="o">&</span> <span class="n">den</span><span class="p">)</span> <span class="k">const</span>
        <span class="p">{</span>
            <span class="n">EXCEPTION_TRY</span><span class="p">()</span>
            <span class="n">result</span> <span class="o">=</span> <span class="n">divide_</span><span class="p">(</span><span class="n">value_</span><span class="p">,</span> <span class="n">den</span><span class="p">);</span>
            <span class="n">EXCEPTION_CATCH_AND_RETURN</span><span class="p">(</span><span class="kc">true</span><span class="p">,</span> <span class="kc">false</span><span class="p">)</span>
        <span class="p">}</span>
    
    <span class="k">private</span><span class="o">:</span>
        <span class="n">T</span> <span class="n">value_</span><span class="p">;</span>
        <span class="c">// used internally by private methods, allowed to throw</span>
        <span class="kt">double</span> <span class="n">divide_</span><span class="p">(</span><span class="n">T</span> <span class="k">const</span><span class="o">&</span> <span class="n">num</span><span class="p">,</span> <span class="n">T</span> <span class="k">const</span><span class="o">&</span> <span class="n">den</span><span class="p">)</span> <span class="k">const</span>
        <span class="p">{</span>
            <span class="k">if</span> <span class="p">(</span><span class="n">den</span> <span class="o">></span> <span class="mi">0</span><span class="p">)</span>
            <span class="p">{</span>
                <span class="k">return</span> <span class="n">num</span> <span class="o">/</span> <span class="n">den</span><span class="p">;</span>
            <span class="p">}</span>
            <span class="k">throw</span> <span class="n">std</span><span class="o">::</span><span class="n">invalid_argument</span><span class="p">(</span><span class="s">"denominator is zero"</span><span class="p">);</span>
        <span class="p">}</span>
    <span class="p">};</span>
    
    <span class="c">// C wrapper is not allowed to throw exceptions</span>
    <span class="kt">double</span> <span class="n">divide_numbers</span><span class="p">(</span><span class="kt">double</span> <span class="n">num</span><span class="p">,</span> <span class="kt">double</span> <span class="n">den</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="n">EXCEPTION_TRY</span><span class="p">()</span>
    
        <span class="n">number</span><span class="o"><</span><span class="kt">double</span><span class="o">></span> <span class="n">n</span><span class="p">(</span><span class="n">num</span><span class="p">);</span>
        <span class="kt">double</span> <span class="n">r</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span>
        <span class="n">n</span><span class="p">.</span><span class="n">divide_s</span><span class="p">(</span><span class="n">r</span><span class="p">,</span> <span class="n">den</span><span class="p">);</span>
    
        <span class="n">EXCEPTION_CATCH_AND_RETURN</span><span class="p">(</span><span class="kc">true</span><span class="p">,</span> <span class="kc">false</span><span class="p">)</span>
    <span class="p">}</span>
    
    <span class="kt">int</span> <span class="n">main</span><span class="p">()</span>
    <span class="p">{</span>
        <span class="kt">bool</span> <span class="n">success</span><span class="p">(</span><span class="kc">false</span><span class="p">);</span>
        <span class="kt">double</span> <span class="n">result</span><span class="p">(</span><span class="mi">0</span><span class="p">);</span>
    
        <span class="c">// Using C++ interface</span>
        <span class="p">{</span>
            <span class="n">number</span><span class="o"><</span><span class="kt">int</span><span class="o">></span> <span class="n">n</span><span class="p">(</span><span class="mi">10</span><span class="p">);</span>
            <span class="c">// no error logged</span>
            <span class="n">success</span> <span class="o">=</span> <span class="n">n</span><span class="p">.</span><span class="n">divide_s</span><span class="p">(</span><span class="n">result</span><span class="p">,</span> <span class="mi">2</span><span class="p">);</span>
            <span class="n">assert</span><span class="p">(</span><span class="n">success</span><span class="p">);</span>
            <span class="c">// error logged, error code returned</span>
            <span class="n">success</span> <span class="o">=</span> <span class="n">n</span><span class="p">.</span><span class="n">divide_s</span><span class="p">(</span><span class="n">result</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span>
            <span class="n">assert</span><span class="p">(</span><span class="o">!</span><span class="n">success</span><span class="p">);</span>
        <span class="p">}</span>
        <span class="c">// Using C interface</span>
        <span class="p">{</span>
            <span class="c">// no error logged</span>
            <span class="n">result</span> <span class="o">=</span> <span class="n">divide_numbers</span><span class="p">(</span><span class="mi">10</span><span class="p">,</span> <span class="mi">2</span><span class="p">);</span>
            <span class="c">// error logged</span>
            <span class="n">result</span> <span class="o">=</span> <span class="n">divide_numbers</span><span class="p">(</span><span class="mi">10</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span>
            <span class="c">// error logged</span>
            <span class="kt">float</span> <span class="n">nan</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span>
            <span class="n">result</span> <span class="o">=</span> <span class="n">divide_numbers</span><span class="p">(</span><span class="n">nan</span> <span class="o">/</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">10</span><span class="p">);</span>
        <span class="p">}</span>
    <span class="p">}</span>
    





It's simple and not ideal, but it did the job very well for myself and number libraries. Certainly, there are is a room for improvements. The logging mechanism is a simple one. It's a good idea to add [catch](http://en.wikipedia.org/wiki/Exception_handling_syntax) clauses for other types, even for `int`, especially if one has to deal with `throw __LINE__;` signals.





There is a lot of [<del>google</del>](http://eu.techcrunch.com/2009/11/24/google-analytics-illegal-germany/)findable articles and books one can buy. Here is the (incomplete) list of favourites guidelines:







  * [Error and Exception Handling](http://www.boost.org/community/error_handling.html) guidelines from [Boost](http://boost.org)


  * [Exception Safety and Exception Specifications: Are They Worth It?](http://www.gotw.ca/gotw/082.htm) by [Herb Sutter](http://herbsutter.wordpress.com/)


  * [Lessons Learned from Specifying Exception-Safety for the C++ Standard Library](http://www.boost.org/community/exception_safety.html) by [David Abrahams](http://en.wikipedia.org/wiki/David_Abrahams_%28computer_programmer%29)


  * [Design Guidelines Update: Exception Throwing](http://blogs.msdn.com/kcwalina/archive/2005/03/16/396787.aspx) and [Should Exceptions Carry Error Code Information](http://blogs.msdn.com/kcwalina/archive/2005/05/27/422681.aspx) by [Krzysztof Cwalina](http://blogs.msdn.com/kcwalina/default.aspx)


  * Think [RAII](http://en.wikipedia.org/wiki/Resource_Acquisition_Is_Initialization) and you will no longer need to implement [destructor](http://en.wikipedia.org/wiki/Destructor) for your types.





Thanks to wonderful [ACCU](http://accu.org) folks for a very interesting brainstorm on similar topic we had one day. Comments,  improvements and bug reports would be greatly appreciated.
