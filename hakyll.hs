{-# LANGUAGE OverloadedStrings #-}
import Control.Arrow ((>>>))

import Hakyll

main :: IO ()
main = hakyll $ do

    -- Copy static files (more or less)
    match "bootstrap/js/*.min.js" $ do
        route idRoute
        compile copyFileCompiler

    match "bootstrap/css/*.min.css" $ do
        route idRoute
        compile compressCssCompiler

    -- Render pages
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

    -- Compile templates
    match "templates/*" $ compile templateCompiler
