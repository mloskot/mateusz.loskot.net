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
    match "css/*" $ do
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
        >>> arr (setField "title" "Home")
        >>> requireAllA "posts/*" addPostList
        >>> applyTemplateCompiler "templates/index.html"
        >>> applyTemplateCompiler "templates/default.html"
        >>> relativizeUrlsCompiler

    -- Compile templates
    match "templates/*" $ compile templateCompiler

-- Site configuration metadata
myMetadataA = arr (trySetField "homeurl" "http://mateusz.loskot.net")
    >>> arr (trySetField "brand" "Mateusz Loskot")
    >>> arr (trySetField "author" "mloskot")
    >>> arr (trySetField "email" "mateusz@loskot.net")
    >>> arr (trySetField "github" "github.com/mloskot")
    >>> arr (trySetField "twitter" "twitter.com/mloskot")
    >>> arr (trySetField "flickr" "flickr.com/photos/mloskot")
    >>> arr (trySetField "youtube" "youtube.com/mloskot")
    >>> arr (trySetField "vimeo" "vimeo.com/mloskot")
    >>> arr (trySetField "linkedin" "linkedin.com/in/mateuszloskot")
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
