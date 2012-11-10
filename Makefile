#
# Makefile - generates Hakyll site builder
#
# Mateusz Loskot <mateusz@loskot.net>
#
# Examples
# 	$ make
#	$ make HKGIT=$HOME/dev/hakyll/_git/hakyll
#
# Static config for my laptop (hostname:dog)
DOGHKGIT=$(HOME)/dev/hakyll/_git/hakyll
ifneq "$(wildcard $(DOGHKGIT) )" ""
HKGIT=$(DOGHKGIT)
endif

# Build and import Hakyll directly from Git clone
ifdef HKGIT

HAKYLL=$(HKGIT)
generate-git: hakyll-git
	@./hakyll build

hakyll-git: hakyll.hs
	@echo Building Hakyll from sources in $(HAKYLL)
	@ghc --make -i$(HAKYLL)/src -i$(HAKYLL)/dist/build/autogen -optP-include -optP$(HAKYLL)/dist/build/autogen/cabal_macros.h hakyll

# Use Hakyll installed system-wide
else

generate: hakyll
	@./hakyll build

hakyll: hakyll.hs
	@echo Building with installed Hakyll
	@ghc --make hakyll

endif

clean:
	@rm -rf _cache _site
	@rm hakyll.hi hakyll.o hakyll

.PHONY: clean distclean
