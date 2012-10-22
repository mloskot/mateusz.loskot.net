---
comments: true
date: 2009-10-13 22:03:50
layout: post
slug: always-use-proper-cpp-integer-types
title: Always use proper C++ integer types
wordpressid: 1282
categories: programming
tags: c++,int,language,programming,signed,size_type,string,type,unsigned
---

When programming  in[ C++](http://en.wikipedia.org/wiki/C%2B%2B), it's a good idea to use proper integer types relevant to particular context. A little bit of strictness always pays back. It's not uncommon to see a tendency to ignore the integral types defined as specific to standard containers, namely [size_type](http://www.dinkumware.com/manuals/?manual=compleat&Search=string&page=string2.html#basic_string::size_type). It's available for number of standard container like `std::string` or `std::vector`. Such ignorance may get its revenge easily.





Below is a simple example of incorrectly used type to catch result of `std::string::find` [function](http://www.cplusplus.com/reference/string/string/find/). I'm quite sure that many would expect there is nothing wrong with the `unsigned int` here. But, actually this is just a bug. I run Linux on 64-bit architecture and when I compile this program as is, it works as expected. However, when I replace the string in line [1] with `abc`, it still works but not as expected :-)




    
    <span class="cp">#include <iostream></span>
    <span class="cp">#include <string></span>
    <span class="k">using</span> <span class="k">namespace</span> <span class="n">std</span><span class="p">;</span>
    <span class="kt">int</span> <span class="n">main</span><span class="p">()</span>
    <span class="p">{</span>
      <span class="n">string</span> <span class="n">s</span> <span class="o">=</span> <span class="s">"a:b:c"</span><span class="p">;</span> <span class="c">// "abc" [1]</span>
      <span class="kt">char</span> <span class="n">delim</span> <span class="o">=</span> <span class="sc">':'</span><span class="p">;</span>
      <span class="kt">unsigned</span> <span class="kt">int</span> <span class="n">pos</span> <span class="o">=</span> <span class="n">s</span><span class="p">.</span><span class="n">find</span><span class="p">(</span><span class="n">delim</span><span class="p">);</span>
      <span class="k">if</span><span class="p">(</span><span class="n">string</span><span class="o">::</span><span class="n">npos</span> <span class="o">!=</span> <span class="n">pos</span><span class="p">)</span>
      <span class="p">{</span>
        <span class="n">cout</span> <span class="o"><<</span> <span class="n">delim</span> <span class="o"><<</span> <span class="s">" found in "</span> <span class="o"><<</span> <span class="n">s</span> <span class="o"><<</span> <span class="n">endl</span><span class="p">;</span>
      <span class="p">}</span>
    <span class="p">}</span>
    






Fix is very simply. Just replace `unsigned int` with `std::string::size_type`. The problem could be avoided if somebody who wrote this program took care of use of correct type. Not to mention that the program would be portable straight away.





I've seen this kind of issues quite many times, especially in code written by former C programmers who do not like to wear the muzzle of strictness the C++ types system enforces and requires. The example above is a trivial one, but I believe it presents the root of the problem well.





It's [not acceptable to cut corners in the biscuits business](http://www.guardian.co.uk/media/video/2008/may/28/advertising), so why it should be acceptable in programming :-)
