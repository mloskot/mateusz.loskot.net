---
date: 2009-09-29 22:11:42
slug: talking-about-data-races
title: Talking about data races
categories: programming
---

My countryman [Bartosz Milewski](http://bartoszmilewski.wordpress.com/) - the author of one of the best C++ introductory books - the [C++ In Action](http://www.relisoft.com/book/) posted video with very interesting talk about [Ownership Systems against Data Races](http://bartoszmilewski.wordpress.com/2009/09/22/ownership-systems-against-data-races/trackback/) (video is [here](http://www.vimeo.com/6689999)).









Interestingly, Bartosz proposes to understand the battle with **data races** as a discipline-driven programming that helps, mostly C+ programmers, to _avoid all this horrible pitfalls_. Moreover, Bartosz presents programmers with a well-designed methodology _based on types system_ as a tool that may guard programs against injury from data races problem and with success.





Basically (and not surprisingly) Bartosz recommends _think first, act later_ kind of approach based on detailed analysis of _what might be causing data races in your program_, on identification of potential sources of data race problems. This approach is a contrary to spending hours searching for data races conditions using debugger.





The data race problem is a complex subject, but - in my opinion - Bartosz explains it in a very accessible step-by-step form. Three words summary of Bartosz' lecture and the presented methodology is: **sharing** + **mutability** + **no synchronisation** = **data race**
