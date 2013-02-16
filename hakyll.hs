{-# LANGUAGE OverloadedStrings #-}
module Main where

import Prelude hiding (id)
import Control.Category (id)
import Control.Arrow ((>>>), (***), (+++), arr)
import Data.List (intercalate, sortBy, isPrefixOf)
import Data.Monoid (mempty, mconcat)
import Data.Ord (comparing)
import System.FilePath (takeFileName, takeDirectory,
                        joinPath, splitDirectories, dropExtension)

import Hakyll

instance Writable b => Writable (Either a b) where
  write p (Right b) = write p b
  write _ _ = return ()

main :: IO ()
main = hakyll $ do

    -- Copy static files (more or less)
    match "css/*" $ do
        route idRoute
        compile compressCssCompiler

    -- Render each and every post
    match "posts/*/*/*/*/index.markdown" $ do
        route   $ setExtension ".html"
        compile $ pageCompiler
            >>> myMetadataA
            >>> arr(renderDateField "posted" "%d %b %Y" "Unknown Date")
            >>> arr(renderDateField "published" "%Y-%m-%dT%H:%M:%SZ" "Unknown Date")
            >>> arr(renderDateField "updated" "%Y-%m-%dT%H:%M:%SZ" "Unknown Date")
            >>> arr(copyBodyToField "feedcontent")
            >>> applyTemplateCompiler "templates/post.html"
            >>> applyTemplateCompiler "templates/default.html"
            >>> relativizeUrlsCompiler

    -- Render list of all posts
    match "posts.html" $ route idRoute
    create "posts.html" $ constA mempty
        >>> myMetadataA
        >>> arr (setField "title" "Posts")
        >>> requireAllA "posts/*/*/*/*/*.markdown" addPostList
        >>> applyTemplateCompiler "templates/posts.html"
        >>> applyTemplateCompiler "templates/default.html"
        >>> relativizeUrlsCompiler

    --- Render list of posts in category: code
    match "code.html" $ route idRoute
    create "code.html" $ constA mempty
        >>> myMetadataA
        >>> arr (setField "title" "blog::code")
        >>> requireAllA "posts/*/*/*/*/*.markdown" (filterCategoryCode >>> addPostList)
        >>> applyTemplateCompiler "templates/posts.html"
        >>> applyTemplateCompiler "templates/default.html"
        >>> relativizeUrlsCompiler
    
    --- Render list of posts in category: sweat
    match "sweat.html" $ route idRoute
    create "sweat.html" $ constA mempty
        >>> myMetadataA
        >>> arr (setField "title" "blog::sweat")
        >>> requireAllA "posts/*/*/*/*/*.markdown" (filterCategorySweat >>> addPostList)
        >>> applyTemplateCompiler "templates/posts.html"
        >>> applyTemplateCompiler "templates/default.html"
        >>> relativizeUrlsCompiler

    -- Render index
    match "index.html" $ route idRoute
    create "index.html" $ constA mempty
        >>> myMetadataA
        >>> setFieldPageList (take 15 . sortChronological)
            "templates/postitem.html" "posts" "posts/*/*/*/*/*.markdown"
        >>> applyTemplateCompiler "templates/index.html"
        >>> applyTemplateCompiler "templates/default.html"
        >>> relativizeUrlsCompiler

    -- Render RSS feed
    match  "rss.xml" $ route idRoute
    create "rss.xml" $
        requireAll_ "posts/*/*/*/*/*" >>> renderRss feedConfiguration

    -- Render Atom feed
    match  "atom.xml" $ route idRoute
    create "atom.xml" $
        requireAll_ "posts/*/*/*/*/*" >>> renderAtom feedConfiguration

    -- Render Atom feeds per tag
    create "tags" $
        requireAll "posts/*/*/*/*/*" (\_ ps -> readTags ps :: Tags String)

    match "feeds/*" $ route $ setExtension ".xml"
    withTags "tags" (fromCapture "feeds/*") makeTagFeed

    -- Compile templates
    match "templates/*" $ compile templateCompiler

-- Site configuration metadata
myMetadataA = arr (trySetField "homeurl" "http://mateusz.loskot.net")
    >>> arr (trySetField "brand" "Mateusz Loskot")
    >>> arr (trySetField "tagline" "hacking on, working out, living up")
    >>> arr (trySetField "author" "mloskot")
    >>> arr (trySetField "email" "mateusz@loskot.net")
    >>> arr (trySetField "linkedin" "linkedin.com/in/mateuszloskot")
    >>> arr (trySetField "gplus" "gplus.to/mloskot")
    >>> arr (trySetField "aboutme" "about.me/mloskot")
    >>> arr (trySetField "twitter" "twitter.com/mloskot")
    >>> arr (trySetField "github" "github.com/mloskot")
    >>> arr (trySetField "ohloh" "ohloh.net/accounts/mloskot")
    >>> arr (trySetField "flickr" "flic.kr/mloskot")
    >>> arr (trySetField "youtube" "youtube.com/mloskot")
    >>> arr (trySetField "vimeo" "vimeo.com/mloskot")
    >>> arr (trySetField "cadcorp" "cadcorp.com")
    >>> arr (trySetField "osgeo" "osgeo.org")

-- Atom and RSS feed configuration
feedConfiguration :: FeedConfiguration
feedConfiguration = FeedConfiguration
    { feedTitle       = "Mateusz Loskot blog"
    , feedDescription = "Feed of blog on hacking on, working out, living up."
    , feedAuthorName  = "Mateusz Loskot"
    , feedAuthorEmail = "mateusz@loskot.net"
    , feedRoot        = "http://mateusz.loskot.net"
    }

-- | Helper functions
--

-- | Auxiliary compiler: generate a post list from a list of given posts, and
-- add it to the current page under @$posts@
--
addPostList :: Compiler (Page String, [Page String]) (Page String)
addPostList = setFieldA "posts" $
    arr (sortChronological)
        >>> require "templates/postitem.html" (\p t -> map (applyTemplate t) p)
        >>> arr mconcat
        >>> arr pageBody

-- | Sort pages chronologically. This function assumes that the pages have a
-- @year/month/day/title[.extension]@ naming scheme.
-- Source: https://github.com/ian-ross/blog/
--
sortChronological :: [Page String] -> [Page String]
sortChronological = reverse . (sortBy $ comparing pageSortKey)

-- | Generate a sort key for ordering entries on the index page.
-- Source: https://github.com/ian-ross/blog/
--
pageSortKey :: Page String -> String
pageSortKey pg =  datePart ++ "/" ++ (if ts /= "" then ts else namePart)
  where path = getField "path" pg
        ts = getField "timestamp" pg
        datePart = joinPath $ take 3 $ drop 1 $ splitDirectories path
        namePart = case (takeFileName path) of
            "index.markdown" -> last $ splitDirectories $ takeDirectory path
            _               -> dropExtension (takeFileName path)

-- Filter posts according to hard-wired categories
isCategory :: Page a -> String -> Bool
isCategory p c =
  let category = getField "category" p in
  category == c

filterCategoryCode :: Compiler (Page a, [Page b]) (Page a, [Page b])
filterCategoryCode = id *** arr (filter (`isCategory` "code"))

filterCategorySweat :: Compiler (Page a, [Page b]) (Page a, [Page b])
filterCategorySweat = id *** arr (filter (`isCategory` "sweat"))

-- Tags support utilities based on John Lenz's configuration
-- with customisations applied
-- Source: https://bitbucket.org/wuzzeb
--
-- | Compile a list of pages to a tag feed page
makeTagFeed :: String -> [Page String] -> Compiler () (Page String)
makeTagFeed tag posts = 
        constA posts
    >>> listToPageCompiler "templates/atom-item.xml"
    >>> arr (\p -> (p,posts)) >>> setMaxUpdated
    >>> myMetadataA
    >>> arr(setField "feedtitle" (" - Posts tagged " ++ tag))
    >>> applyTemplateCompiler "templates/atom.xml"

-- | Compiler which takes two inputs: a list of pages and a page
-- The compiler goes through the list of pages and finds the maximum updated date,
-- and sets the "lastupdated" field in the second input page to this maximum date.
-- Useful when combined with requireAllA
setMaxUpdated :: Compiler (Page String, [Page String]) (Page String)
setMaxUpdated = setFieldA "lastupdated" $ arr maxUpdated
    where
        maxUpdated :: [Page String] -> String
        maxUpdated posts = maximum $ map (getField "updated") posts

-- | Build a page by starting with an empty page, applying the template to each
-- page from the input, and finally combining all pages together in the body.
-- The metadata of the created page just contains the default fields from 'addDefaultFields'.
listToPageCompiler :: Identifier Template -> Compiler [Page String] (Page String)
listToPageCompiler template =
        pageListCompiler recentFirst template
    >>> arr fromBody
    >>> addDefaultFields

-- | Register a compiler to produce a page for each (tag, list of pages).
--
-- This is a useful combination of 'metaCompile' and 'tagsMap'.
withTags :: Identifier (Tags String) -- ^ the mapping of tags to pages
        -> (String -> Identifier (Page String)) -- ^ build an identifier for each created tag page
        -> (String -> [Page String] -> Compiler () (Page String)) -- ^ a compiler for a specific tag page
        -> Rules
withTags t ident pageC =
    metaCompile $ require_ t
        >>> arr tagsMap
        >>> arr (map (\(tag,ps) -> (ident tag, pageC tag ps)))
