---
date: 2009-06-25 15:35:19
slug: logic
title: Logic
categories: life,programming
---

My wife asked me: _Buy sausages, if you'll find eggs, buy 10_. What happens next?





Option #1:



    
    <code>if eggs >= 10 then buy(sausages, eggs=10);</code>





Option #2:



    
    <code>if sausages > 0 then buy(sausages);
    if eggs >= 10 then buy(eggs, 10);</code>





Option #3



    
    <code>buy(sausages);
    if eggs >= 10 then buy(eggs, 10);</code>





The 3rd option is dangerous one because it could end up with never-ending run in the city looking for sausages, never buying eggs and never coming back home.





...and more. Why?





Asking me to make shopping, my wife did not stick to [the principles of valid inference and correct reasoning](http://en.wikipedia.org/wiki/Logic). That's the reason why not everybody can be a programmer :-)
