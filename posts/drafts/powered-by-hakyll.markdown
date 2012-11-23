---
title: Powered by Hakyll
description: Switched my website from WordPress to Hakyll
date: 2012-11-21
category: code
tags: blog,hakyll,haskell,wordpress
---

I decided to learn some Haskell. So, I wanted to find a challenge, a pet project that
will drive the learning process forward and motivate to reach the important resources.

At the same time, I discovered static site generators, especially for personal blogs.
I've got hooked by the simplicity of working with plain text and managing content 
using Git. I stumbled upon Jekyll and Octopress, obviously, and a few solutions in Python.
But, I'm not convinced I should learn Ruby and I code in Python too often to find
it new and exciting, so I was reluctant to choose them.

I eventually found Hakyll. It generates static sites and is written in Haskell.
That is exactly what I wanted.

The decision was quick, but the realisation took me a few weeks.
The very first and obvious obstacle was my complete lack of Haskell knowledge.
The second problem was how to move my website from WordPress to Hakyll,
in particular, how to convert posts and pages to Markdown format with the structure
and some elements of semantic preserved. And, what to do with comments.
Finally, the change at low level should be accompanied by a change at higher level,
I thought. So, I wanted to re-design my website a bit: minimal engine, minimal style.

I was excited about working around the first obstacle, because it meant learning
Haskell. So, I started reading the "Learn You a Haskell for Great Good!" written
and offered completely free to read online by Miran Lipovača. Excellent book!
Together with collection of Haskell course lectures by Philip Wadler found on
YouTube, it had become my every day lunchtime bread for several weeks.

Meanwhile, I had to figure out how to attempt the second task - move my data from WordPress.
First stop, Hakyll mailing list. There was an old unanswered thread, so I bumped it up.
Someone suggested to convert HTML using MySQL and Emacs macros or Pandoc. That was Scary!
So, I went to check how folks from the Jekyll/Octopress camp solved the conversion.
I found a few blogs suggesting exitwp utility written in Python. Sweet!
At least, I would be able to debug it or customise if I need. So, I decided to make
the conversion through WordPress native export to WordPress eXtended RSS format.

Finally, I started writing ```hakyll.hs``` configuration file for my new blog.
First things first: I read the whole end-user documentation and tutorials of Hakyll
trying to grasp the general idea and the actual Hakyll workflow behind
```./hakyll build```.

Next, I played with the official examples from hakyll-examples and tried to distinguish
the core patterns from custom purpose-specific extensions (i.e. not every blog has
uses tags). I'd slowly built my understanding of Hakyll along with learning Haskell.
The major headache was caused by the intensive use of rather advanced Haskell
feature - Arrows. Jasper bothered to provide explanation of arrows to first time
sers of Hakyll and kudos for that, but it would be too easy if it was enough for me.
