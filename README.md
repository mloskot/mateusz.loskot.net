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
