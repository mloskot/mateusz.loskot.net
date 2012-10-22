#!/bin/sh
HAKYLL=${HOME}/dev/hakyll/_git/hakyll
ghc --make \
    -i${HAKYLL}/src \
    -i${HAKYLL}/dist/build/autogen \
    -optP-include -optP${HAKYLL}/dist/build/autogen/cabal_macros.h \
    hakyll.hs
