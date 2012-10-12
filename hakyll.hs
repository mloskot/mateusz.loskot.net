{-# LANGUAGE OverloadedStrings #-}
module Main where

import Prelude hiding (id)
import Control.Category (id)
import Control.Arrow ((>>>), (***), arr)
import Data.Monoid (mempty, mconcat)

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

    -- Render posts
    match "posts/*" $ do
        route   $ setExtension ".html"
        compile $ pageCompiler
            >>> myMetadataA
            >>> arr (renderDateField "date" "%e %b %Y" "Unknown Date")
            >>> applyTemplateCompiler "templates/post.html"
            >>> applyTemplateCompiler "templates/default.html"
            >>> relativizeUrlsCompiler

    -- Render index
    match "index.html" $ route idRoute
    create "index.html" $ constA mempty
        >>> myMetadataA
        >>> requireAllA "posts/*" addPostList
        >>> applyTemplateCompiler "templates/index.html"
        >>> applyTemplateCompiler "templates/default.html"
        >>> relativizeUrlsCompiler

    -- Compile templates
    match "templates/*" $ compile templateCompiler

-- Site configuration metadata
myMetadataA = arr (trySetField "brand" "mateusz.loskot.net")
    >>> arr (trySetField "homeurl" "/")
    >>> arr (trySetField "blogurl" "/blog.html")
    >>> arr (trySetField "author" "Mateusz Loskot")
    >>> arr (renderDateField "date" "%e %b %Y" "Unknown Date")

-- | Helper functions
--

-- | Auxiliary compiler: generate a post list from a list of given posts, and
-- add it to the current page under @$posts@
--
addPostList :: Compiler (Page String, [Page String]) (Page String)
addPostList = setFieldA "posts" $
    arr (reverse . chronological)
        >>> require "templates/postitem.html" (\p t -> map (applyTemplate t) p)
        >>> arr mconcat
        >>> arr pageBody
