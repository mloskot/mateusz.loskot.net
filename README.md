# mateusz.loskot.net

Next generation of my personal website and weblog powered by Hakyll
published at http://mateusz.loskot.net

## Requirements

* Hakyll 3.5+
* Haskell
* GNU make
* lftp (deployment)

## Building


```
make
```

With a little help from Makefile magic, the building procedure detects
if Hakyll is available from Git clone in my *standard* location or 
from system-wide installation (or cabal).

## Deploying

```
./deploy
```

## WordPress to Hakyll Migration

Blog posts describing migration from WordPress, using Hakyll and such:

* [Powered by Hakyll](http://mateusz.loskot.net/posts/2012/12/03/powered-by-hakyll/)
* [Hakyll posts in folders](mateusz.loskot.net/posts/2012/12/15/hakyll-posts-in-folders/)

## License

The blog code, Hakyll configuration, CSS and HTML templates are free to do with what you will.
The blog content is provided under a [Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/).
