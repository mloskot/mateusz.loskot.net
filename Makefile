generate: hakyll
	@./hakyll build

hakyll: hakyll.hs
	@ghc --make hakyll

clean:
	@rm -rf _cache _site
	@rm hakyll.hi hakyll.o hakyll

.PHONY: clean distclean
