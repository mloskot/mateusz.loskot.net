---
title: Powered by Hakyll
description: Switched my website from WordPress to Hakyll
date: 2012-12-03
category: code
tags: blog,hakyll,haskell,wordpress
---

I decided to learn some [Haskell](http://www.haskell.org/). So, I wanted to find a 
challenge, a pet project that will drive the learning process forward and 
motivate to reach the important resources.

Around the same time, I discovered static site generators, especially for personal
blogs. I've got hooked by the simplicity of working with plain text and managing 
content using Git. I stumbled upon [Jekyll](https://github.com/mojombo/jekyll) and 
[Octopress](http://octopress.org/), obviously, and a few solutions in Python.

I'm not convinced I should learn Ruby and I code in Python too often to find
it new and exciting, so I was reluctant to choose them.

I eventually found [Hakyll](http://jaspervdj.be/hakyll/) by Jasper Van der Jeugt.
It generates static sites and is written in Haskell. It's exactly what I want.

The decision was quick, but the realisation took me a few weeks.
The very first and obvious obstacle was my complete lack of Haskell knowledge.
The second problem was how to move my website from WordPress to Hakyll, in particular, 
how to convert posts and pages to [Markdown](http://daringfireball.net/projects/markdown/) 
format with the structure and some elements of semantic preserved.
And, what to do with comments.
Finally, the change at low level should be accompanied by a change at higher level,
I thought. So, I wanted to re-design my website a bit: minimal engine, minimal style.

I was excited about working around the first obstacle, because it meant learning
Haskell. So, I started reading the 
[Learn You a Haskell for Great Good!](http://learnyouahaskell.com/) written
and offered completely free to read online by Miran Lipovača. Excellent book!
Together with collection of 
[Haskell course lectures](http://www.youtube.com/watch?v=AOl2y5uW0mA) by 
[Philip Wadler](http://en.wikipedia.org/wiki/Philip_Wadler) found on
YouTube, it had become my every day lunchtime bread for several weeks.

Meanwhile, I had to figure out how to attempt the second task - move my data from 
WordPress. First stop, Hakyll mailing list. There was an 
[old unanswered thread](https://groups.google.com/d/topic/hakyll/KZdcNsBVNkA/discussion), 
so I bumped it up. Someone suggested to convert HTML using MySQL and Emacs macros
or Pandoc. That was Scary!
So, I went to check how folks from the Jekyll/Octopress camp solved the conversion.
I found a few blogs suggesting [exitwp](https://github.com/thomasf/exitwp) 
utility written in Python. Sweet!
At least, I would be able to debug it or customise if I need. So, I decided to make
the conversion through WordPress native export to 
[WordPress eXtended RSS](http://codex.wordpress.org/Tools_Export_Screen) (WXR) format.

I started writing ```hakyll.hs``` configuration file for my new website.
First things first: I read the whole end-user documentation and tutorials of Hakyll
trying to grasp the general idea and the actual [Hakyll workflow](http://jaspervdj.be/hakyll/tutorials/02-basics.html) behind ```./hakyll build```.

Next, I played with the official examples from 
[hakyll-examples](https://github.com/jaspervdj/hakyll-examples) and tried to distinguish
the core patterns from custom purpose-specific extensions (for example, not every blog 
uses tags). I'd slowly moved forward and started to understand how Hakyll works and 
what Haskell does here and there.
The major headache was caused by the intensive use of rather advanced Haskell
features. Namely [Monads](http://en.wikipedia.org/wiki/Monad_%28functional_programming%29)
and [Arrows](http://en.wikipedia.org/wiki/Arrow_%28computer_science%29), 
but mostly the latter. Jasper bothered to provide explanation of 
[basics of arrows](http://jaspervdj.be/hakyll/tutorials/03-arrows.html) to first time 
users of Hakyll and kudos for that, but it would be too easy, 
if it was enough for me to grasp the concepts very well.
Another difficulty is that Hakyll uses Haskell to define a 
[domain specific language](http://en.wikipedia.org/wiki/Domain-specific_language) (DSL) 
what makes the learning curve steeper, obviously.

I didn't want to wait a few months spent on learning Haskell until I was able to set up
my website with Hakyll, so I went for the "puzzle matching" approach. I looked for
examples of Hakyll configuration files, learned what other users do, then I tried to 
replicate or customise it for my configuration. Just like a child choosing puzzles and
checking if they match together, in countless iterations.
Thankfully, there is a solid community of Hakyll users who keep their websites managed
at GitHub. Searching for good examples was easy. Learning from them was not so easy.
Just to name a few outstanding sites powered by Hakyll (here, I mean configuration 
files written in Haskell, not Web design features or visual effects), I recommend 
checking [Ian Ross' blog](https://github.com/ian-ross/blog/) (good example of advanced
posts manipulation and organising), 
[Daniël de Kok](http://danieldk.eu/) (a nice example of Hakyll and 
[Bootstrap](http://twitter.github.com/bootstrap/) integration).


Eventually, I've come up working version of my new lighter, simpler, leaner website
generated by Hakyll. With all my blog posts safely migrated.
I decided to drop the comments though. Hakyll does not provide native support for
comments, but that's not the reason I decided to remove them.
It is easy to add comments support using third-party services like Disguiss or Live...
I don't see much benefits in allowing comments.
I wasn't receiving many comments on my old WordPress-based blog anyway.
Although, I'm very thankful for those I had received. To realise that someone actually
reads my writings was always a pleasant jiggle.

I read Matt Gemmell's [argument against comments](http://mattgemmell.com/2011/11/29/comments-off/) and I agreed with his reasoning.
So, if you read something here, and want to reply, please do one of the following, in order of preference:

1. Write a response on your own blog
2. Reply on Twitter
3. E-mail

In next articles, I'm going to write about the WordPress to Hakyll migration process 
in more details with all the tools and steps described.
