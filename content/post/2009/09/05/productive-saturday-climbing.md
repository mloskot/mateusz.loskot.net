---
date: 2009-09-05 18:18:44
slug: productive-saturday-climbing
title: Productive Saturday Climbing
categories: [ "code", "sweat" ]
---

Today, Pantera and I we hit the [Castle Climbing Centre](http://www.castle-climbing.co.uk/) early in the morning. It's nice to have wide range of routes available when the centre is nearly empty as people are recovering after Friday buzz ;-). I am (exceptionally?) weak today. Probably, it's because the last 2 weeks I conducted endurance oriented sessions only. First, I jumped upstairs to climb a few [V1-V3](http://www.rockfax.com/publications/bgrades.html) [boulders](http://en.wikipedia.org/wiki/Bouldering) on the overhang [featured bouldering wall](http://www.castle-climbing.co.uk/index.php?option=com_wrapper&Itemid=114). I tried the new orange V5 boulder. It's beautiful, but I couldn't prevent my body swinging a bit after quite dynamic move to 4th hold. I've put the V5 on my short list, definitely. Next, we hit number of top-rope routes. Pantera was working on technical 5 and [5+](http://www.rockfax.com/publications/grades.html) and I was trying to mix strength and stamina problems:


  * The Slabs: [6b](http://www.rockfax.com/publications/grades.html) (blue), 2 x 6c (pink/green)
  * Tall Walls: 5 (green), [6b+](http://www.rockfax.com/publications/grades.html) (green/orange spots)
  * The [Fang](http://www.castle-climbing.co.uk/index.php?option=com_wrapper&Itemid=102): 2 x 6b (orange/lilak spots), 2 x 6c (pink s.o.s., including loss of a few layers of my finger tips skin ;-))
  * The Stack: [6c](http://www.rockfax.com/publications/grades.html) (red), 7a (yellow, made 1/3 of the route, 3 moves only)


No [rock rings](http://www.metoliusclimbing.com/rock_rings.html), no [campus](http://www.youtube.com/watch?v=h07kaQKtgDY). Finished bouldering a couple of V0-V3 on the [Panels](http://www.castle-climbing.co.uk/index.php?option=com_wrapper&Itemid=102).


While my muscles were busy pushing enormous amount of [ATP](http://en.wikipedia.org/wiki/Adenosine_triphosphate) molecules through their fibres and cells, my brain was busy solving design issues of how to make [C++](http://www.research.att.com/~bs/C++.html) [interface](http://www.cantrip.org/stdlibif.html) of [GDAL](http://gdal.org/) library [better](http://en.wikibooks.org/wiki/More_C%2B%2B_Idioms). It is clear that neither dataset nor raster band can have semantic of plain [value objects](http://www.c2.com/cgi/wiki?ValueObject). Both, dataset and raster band, represent real world physical resources and they are more like [reference objects](http://www.c2.com/cgi/wiki?ReferenceObject). In spite of that [reference semantic](http://www.parashift.com/c++-faq-lite/value-vs-ref-semantics.html) is dominant in the world of GDAL objects, I'd really like to make them [CopyConstructible](http://www.boost.org/doc/libs/1_39_0/libs/utility/CopyConstructible.html) and [Assignable](http://www.boost.org/doc/libs/1_39_0/libs/utility/Assignable.html). I know it can be achieved [straight away](http://en.wikipedia.org/wiki/C%2B%2B0x):


```
std::tr1::shared_ptr<GDALDataset> ds(::GDALOpen("file.tif", GA_ReadOnly), ::GDALClose);
```

But, I just don't want to make yet another [Gigantic Rats Nest Of Pointers](http://www.parashift.com/c++-faq-lite/value-vs-ref-semantics.html#faq-31.7). I would be happy to keep all the ugliness out of user's sight. I think it's feasible. Perhaps I will even [Pimpl my <del>Ride</del> GDAL](http://c2.com/cgi/wiki?PimplIdiom).


I'll probably need one or more climbing sessions to finish the design of _better GDAL_, so I can start [slinging some code around](/?p=731). Next [climbing](http://vimeo.com/6349060) on Monday in [Swiss Cottage](http://www.climblondon.co.uk/) with [Jo](http://www.youtube.com/user/doublebyte1), [Chiara](http://www.flickr.com/photos/chiara_ambrosino/) and [Pantera](http://www.flickr.com/photos/mloskot/tags/pantera).
