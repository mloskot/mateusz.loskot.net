{-# LANGUAGE OverloadedStrings #-}
import Control.Arrow ((>>>))

import Hakyll

main :: IO ()
main = hakyll $ do

    match "templates/*" $ compile templateCompiler

    match "pages/index.markdown" $ do
        route   $ constRoute "index.html"
        compile $ pageCompiler
            >>> applyTemplateCompiler "templates/default.html"
            >>> relativizeUrlsCompiler

    match "pages/about.markdown" $ do
        route   $ constRoute "about.html"
        compile $ pageCompiler
            >>> applyTemplateCompiler "templates/default.html"
            >>> relativizeUrlsCompiler
